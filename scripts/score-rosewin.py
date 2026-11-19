#!/usr/bin/env python3
"""Score amoris rose-window candidates: the CENTRE opening should be a
large, clean, near-white circle."""
import numpy as np
from PIL import Image
from scipy import ndimage
import glob, os, shutil, sys

RAW = "/home/z/my-project/amoris-invitation/_raw-art"


def score(path):
    img = Image.open(path).convert("RGB")
    rgb = np.asarray(img).astype(np.float32) / 255.0
    H, W = rgb.shape[:2]
    d = np.sqrt(((1.0 - rgb) ** 2).sum(axis=2)) / np.sqrt(3)

    bg = d < 0.030
    seed = np.zeros_like(bg)
    seed[0, :] = seed[-1, :] = seed[:, 0] = seed[:, -1] = True
    outside = bg & ndimage.binary_propagation(seed, mask=bg)
    cand = (d < 0.10) & (~outside)
    lab, n = ndimage.label(cand)
    if not n:
        return 0.0, "no interior"
    # the region containing the centre (or nearest to it)
    centre_lab = lab[H // 2, W // 2]
    if centre_lab == 0:
        return 0.0, "centre not near-white"
    region = lab == centre_lab
    ys, xs = np.where(region)
    w = (xs.max() - xs.min()) / W
    h = (ys.max() - ys.min()) / H
    fill = region.sum() / max(1, (xs.max() - xs.min()) * (ys.max() - ys.min()))
    cx = (xs.min() + xs.max()) / 2 / W
    cy = (ys.min() + ys.max()) / 2 / H
    offcentre = abs(cx - 0.5) + abs(cy - 0.5)
    p95 = float(np.percentile(d[region], 95))
    return w * min(1, fill * 1.3) * max(0, 1 - offcentre * 3) - p95 * 0.5, \
        f"w={w:.2f} h={h:.2f} fill={fill:.2f} centre=({cx:.2f},{cy:.2f}) p95={p95:.3f}"


best, best_s, best_info = None, -9, ""
for f in sorted(glob.glob(os.path.join(RAW, "cands", "rosewin-*.png"))):
    s, info = score(f)
    print(f"{os.path.basename(f)}: score={s:.3f}  ({info})")
    if s > best_s:
        best, best_s, best_info = f, s, info

if best and best_s > 0.12:
    shutil.copy(best, os.path.join(RAW, "rosewindow-amoris.png"))
    print(f"\nPICKED {best} (score {best_s:.3f})")
else:
    print("\nNO GOOD CANDIDATE — best:", best, best_info)
    sys.exit(1)
