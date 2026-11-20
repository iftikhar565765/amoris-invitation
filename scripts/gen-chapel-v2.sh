#!/bin/bash
# AMORIS — chapel regeneration: painterly matte, absolutely no photography.
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

gen chapel-amoris 1152x864 "painted gouache illustration of one small elegant gothic stone chapel facade at dusk, twin slim pinnacles flanking a pointed arched doorway glowing warm candlelight, one small circular stained glass rose window above the doorway in deep wine crimson and gold, climbing crimson roses and ivy painted on the stone, a slender gold cross at the gable tip, flat matte painting style with visible soft brushwork, muted jewel tones of wine crimson antique gold and ivory stone, absolutely no photorealism, no photograph, no 3D render, no realistic lighting, no depth of field, crisp clean silhouette, isolated on pure white background, high detail, no text"

echo CHAPEL-V2-DONE
