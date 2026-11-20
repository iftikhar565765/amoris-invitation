#!/usr/bin/env python3
"""AMORIS — cutout pipeline v2: border flood-fill background removal (keeps
interior highlights opaque), interior keying for the window opening and
tracery glass pockets, feather + white unmix, palette compression."""
import numpy as np
from PIL import Image
from scipy import ndimage
import os, sys

RAW = "/home/z/my-project/amoris-invitation/_raw-art"
OUT = "/home/z/my-project/amoris-invitation/assets/art"


def dist_from_white(rgb):
    return np.sqrt(((1.0 - rgb) ** 2).sum(axis=2)) / np.sqrt(3)


def cutout(name, t_bg=0.030, interior_key=False, t_int=0.10, min_hole=20000,
           feather=1.1, maxdim=1300, colors=256):
    img = Image.open(os.path.join(RAW, name + ".png")).convert("RGB")
    rgb = np.asarray(img).astype(np.float32) / 255.0

    # sample the actual border colour — generators rarely leave pure white
    border = np.concatenate([
        rgb[0:6].reshape(-1, 3), rgb[-6:].reshape(-1, 3),
        rgb[:, 0:6].reshape(-1, 3), rgb[:, -6:].reshape(-1, 3)])
    bg = np.median(border, axis=0)
    bg = np.maximum(bg, 0.72)          # keep it light: never key dark art
    print(f"  bg sampled: {(bg * 255).astype(int)}")

    d = np.sqrt(((rgb - bg[None, None, :]) ** 2).sum(axis=2)) / np.sqrt(3)

    bg_candidate = d < t_bg
    seed = np.zeros_like(bg_candidate)
    seed[0, :] = seed[-1, :] = seed[:, 0] = seed[:, -1] = True
    outside = bg_candidate & ndimage.binary_propagation(seed, mask=bg_candidate)
    a = np.where(outside, 0.0, 1.0)

    # despeckle: drop isolated opaque specks
    lab, n = ndimage.label(a > 0.15)
    if n:
        sizes = ndimage.sum(a > 0.15, lab, range(1, n + 1))
        kill = np.isin(lab, [i + 1 for i, s in enumerate(sizes) if s < 220])
        a = np.where(kill, 0.0, a)

    if interior_key:
        # ENCLOSED near-white regions inside the solid art (the window
        # opening and the tracery glass pockets) key out to transparency.
        solid = a > 0.5
        candidate = (d < t_int) & solid
        lab, n = ndimage.label(candidate)
        if n:
            sizes = ndimage.sum(candidate, lab, range(1, n + 1))
            big = np.isin(lab, [i + 1 for i, s in enumerate(sizes) if s >= min_hole])
            ramp = np.clip((d - t_int) / (0.34 - t_int), 0, 1)
            a = np.where(big, ramp, a)

    a = ndimage.gaussian_filter(a, feather)
    a = np.clip(a, 0, 1)

    af = np.maximum(a, 1e-4)[..., None]
    rgb_out = np.clip((rgb - (1.0 - a[..., None]) * 1.0) / af, 0, 1)
    rgba = np.dstack([(rgb_out * 255).astype(np.uint8),
                      (a * 255).astype(np.uint8)])
    im = Image.fromarray(rgba)
    bbox = im.getchannel("A").point(lambda v: 255 if v > 8 else 0).getbbox()
    if bbox:
        im = im.crop(bbox)
    w, h = im.size
    if max(w, h) > maxdim:
        s = maxdim / max(w, h)
        im = im.resize((round(w * s), round(h * s)), Image.LANCZOS)
    q = im.quantize(colors=colors, method=Image.FASTOCTREE, dither=Image.FLOYDSTEINBERG)
    path = os.path.join(OUT, name + ".png")
    q.save(path, "PNG", optimize=True)
    print(f"{name}: {im.size[0]}x{im.size[1]} -> {os.path.getsize(path)//1024}KB")


if __name__ == "__main__":
    names = sys.argv[1:] or [
        "window-amoris-tall", "roses-amoris-v2", "chapel-amoris",
        "corner-amoris-v3", "frame-amoris",
    ]
    for name in names:
        kwargs = {}
        if name == "window-amoris-tall":
            # low min_hole: every tracery pocket between mullions must clear
            kwargs = dict(interior_key=True, t_int=0.115, min_hole=520,
                          feather=1.8, maxdim=1400)
        if name == "frame-amoris":
            kwargs = dict(maxdim=1200)
        if name == "roses-amoris-v2":
            kwargs = dict(maxdim=1100)
        try:
            cutout(name, **kwargs)
        except Exception as e:
            print(f"{name}: FAILED {e}")
