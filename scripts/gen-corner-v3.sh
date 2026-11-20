#!/bin/bash
# AMORIS — corner regeneration: L-shaped corner piece anchored top-left.
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

gen corner-amoris-v3 1024x1024 "one single ornamental corner piece anchored strictly in the top-left corner of the canvas forming an L shape, slender matte antique gold baroque scrollwork running along the top edge and down the left edge, three deep wine crimson roses with dark ivy leaves clustered at the corner point itself and a single rose bud trailing along the top edge, thin delicate elegant composition, the centre and the right and bottom of the canvas are completely pure white empty with nothing drawn there, refined painterly matte illustration for luxury wedding stationery, muted jewel tones, no photorealism, no 3D rendering, crisp clean silhouette, isolated on pure white background, high detail, no text, no watermark"

echo CORNER-V3-DONE
