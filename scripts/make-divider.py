#!/usr/bin/env python3
"""AMORIS divider — deterministic hairline rule with entwined rings centre."""
import numpy as np
from PIL import Image, ImageDraw

S = 2
W, H = 1344 * S, 768 * S
im = Image.new("RGBA", (W, H), (0, 0, 0, 0))
d = ImageDraw.Draw(im)

GOLD = (201, 162, 75, 255)
GOLD_DIM = (170, 134, 52, 235)
INK = (138, 107, 42, 255)

cy = H // 2
cx = W // 2

# ── double hairline with soft end fades ──────────────────────────────
for dy in (-7 * S, 7 * S):
    line = Image.new("RGBA", (W, 3 * S), (0, 0, 0, 0))
    ld = ImageDraw.Draw(line)
    ld.line([(0, 1.5 * S), (W, 1.5 * S)], fill=GOLD_DIM, width=3 * S)
    fade = np.linspace(0, 1, 150 * S)
    a = np.asarray(line).astype(np.float32)
    a[:, :150 * S, 3] *= fade
    a[:, -150 * S:, 3] *= fade[::-1]
    im.alpha_composite(Image.fromarray(a.astype(np.uint8)), (0, cy + dy - 1 * S))

# ── centre: two entwined rings ───────────────────────────────────────
r = 30 * S
d.ellipse([cx - r - 9 * S, cy - r, cx + r - 9 * S, cy + r], outline=INK, width=2 * S)
d.ellipse([cx - r - 9 * S + 3 * S, cy - r + 3 * S, cx + r - 9 * S - 3 * S, cy + r - 3 * S], outline=GOLD, width=2 * S)
d.ellipse([cx + 9 * S - r, cy - r, cx + 9 * S + r, cy + r], outline=INK, width=2 * S)
d.ellipse([cx + 9 * S - r + 3 * S, cy - r + 3 * S, cx + 9 * S + r - 3 * S, cy + r - 3 * S], outline=GOLD, width=2 * S)

# tiny cross above the rings
d.line([(cx, cy - r - 26 * S), (cx, cy - r - 8 * S)], fill=GOLD, width=3 * S)
d.line([(cx - 6 * S, cy - r - 20 * S), (cx + 6 * S, cy - r - 20 * S)], fill=GOLD, width=3 * S)

# ── diamonds on the rule, flanking ───────────────────────────────────
def diamond(px_, py_, r_):
    d.polygon([(px_, py_ - r_), (px_ + r_ * 0.72, py_), (px_, py_ + r_), (px_ - r_ * 0.72, py_)], fill=GOLD)
for sx in (-1, 1):
    diamond(cx + sx * 62 * S, cy, 9 * S)

bbox = im.getchannel("A").point(lambda v: 255 if v > 8 else 0).getbbox()
im = im.crop(bbox)
w, h = im.size
im = im.resize((w // S, h // S), Image.LANCZOS)
q = im.quantize(colors=128, method=Image.FASTOCTREE, dither=Image.FLOYDSTEINBERG)
out = "/home/z/my-project/amoris-invitation/assets/art/divider-amoris.png"
q.save(out, "PNG", optimize=True)
import os
print(f"divider: {im.size} -> {os.path.getsize(out)//1024}KB")
