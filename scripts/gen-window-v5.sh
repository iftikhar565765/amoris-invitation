#!/bin/bash
# AMORIS — window v4: clean ogive opening for the card trace.
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

STYLE="refined painterly matte illustration for luxury wedding stationery, carved warm ivory sandstone with soft wine-crimson shading and delicate antique gold tracery accents, muted jewel palette, absolutely no photorealism, no photograph, no 3D rendering, no glossy metallic bevel, no cartoon outlines, uniform matte finish, crisp clean silhouette, isolated on pure white background, high detail, no text, no letters, no watermark"

gen window-amoris-tall 864x1152 "one single grand gothic pointed window frame perfectly centred filling most of the frame, tall pointed ogival arch with crocketed mouldings rising to one fine sharp point at the crown, the arch opening is one single clean smooth pointed arch shape of completely plain pure white empty space, absolutely nothing inside the opening, no tracery, no mullions, no bars, no glass, no rose window, no carvings inside the opening, slim clustered colonnettes directly flanking both sides of the opening, two small pinnacle turrets at the far outer left and right edges, a plain moulded stone sill at the base, everything outside the stone window pure white empty, $STYLE"

echo WINDOW-V5-DONE
