#!/bin/bash
# AMORIS — window regeneration: single grand gothic window, pure-white
# opening for the alpha-hole cutout + ogive trace pipeline.
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

STYLE="refined painterly matte illustration for luxury wedding stationery, carved wine-tinted ivory sandstone with antique gold tracery accents and deep wine crimson dusk tones, muted jewel palette, absolutely no photorealism, no photograph, no 3D rendering, no glossy metallic bevel, no cartoon outlines, uniform matte finish, crisp clean silhouette, isolated on pure white background, high detail, no text, no letters, no watermark"

gen window-amoris-tall 1152x864 "one single grand gothic pointed window frame perfectly centred filling most of the frame, carved sandstone surround, slender clustered colonnettes directly flanking the opening, a tall pointed ogival arch with crocketed mouldings rising to a fine point, a small circular rose tracery medallion crowning the head of the arch just above the opening, the pointed window opening is filled with plain pure white empty space with absolutely nothing inside it, no tracery bars no mullions no glass no candles inside the opening, two small pinnacle turrets at the outer left and right edges, everything outside the stone window pure white empty, $STYLE"

echo WINDOW-V3-DONE
