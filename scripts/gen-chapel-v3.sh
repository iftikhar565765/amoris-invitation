#!/bin/bash
# AMORIS — chapel attempt 3: hard-stylized storybook gouache, never photo.
set -u
RAW=/home/z/my-project/amoris-invitation/_raw-art
mkdir -p "$RAW"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8 9 10; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== amoris/$name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'completed'; then
      echo "ok amoris/$name"; sleep 8; return 0
    fi
    rm -f "$RAW/$name.png"
    sleep $((20 + attempt * 8))
  done
  echo "FAILED amoris/$name"
}

gen chapel-amoris 1152x864 "stylized storybook gouache painting of a small gothic stone chapel facade, flat matte illustration with visible painterly brush strokes and simplified stylized shapes, wine crimson and antique gold and ivory stone palette with muted jewel tones, twin slim pinnacles flanking a pointed arched wooden door glowing warm gold candlelight, one circular stylized rose window above the door painted in wine crimson and gold glass, climbing stylized crimson roses and ivy, a slender gold cross at the gable tip, fairy-tale wedding invitation artwork, flat colors, no gradients from lighting, no shadows rendered realistically, absolutely no photorealism, no photograph, no 3D render, no realistic stone texture, crisp clean silhouette, isolated on pure white background, high detail, no text, no watermark"

echo CHAPEL-V3-DONE
