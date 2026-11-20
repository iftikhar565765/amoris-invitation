#!/bin/bash
# AMORIS — regeneration Ⅲ : the Chapel of the Rose Window at dusk.
# Hardened prompts: painterly matte illustration, no photorealism,
# no 3D bevel, no clip-art. Raw on pure white for the flood-fill
# cutout pipeline.
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

STYLE="refined painterly matte illustration for luxury wedding stationery, deep wine crimson and antique gold with soft ivory highlights, muted jewel tones, absolutely no photorealism, no photograph, no 3D rendering, no glossy metallic bevel, no cartoon outlines, no flat vector icons, uniform matte finish, crisp clean silhouette, isolated on pure white background, high detail, no text, no letters, no watermark, no watermark"

# 1 — hero window: tall gothic ogival window, rose tracery crown, glowing dusk inside
gen window-amoris-tall 1152x864 "one single grand gothic pointed window frame perfectly centred filling most of the frame, carved warm sandstone surround in wine-tinted ivory stone, slender clustered colonnettes on both sides, a tall pointed ogival arch with crocketed mouldings rising to a fine point, a small circular rose tracery window crowning the head of the arch above the opening, delicate gold tracery ribs, the pointed opening itself deep shadowed dusk wine with a faint warm candlelight glow rising from below, small pinnacles at the outer sides, everything outside the window pure white empty, $STYLE"

# 2 — corner ornament: cascading crimson roses with gold gothic tracery
gen corner-amoris-v2 1024x1024 "one top-left corner ornament of slender matte antique gold gothic tracery stems with slender crocketed buds, deep wine crimson and blush roses with dark ivy leaves cascading diagonally inward toward the centre, a few tiny gold fleuron points, thin elegant composition hugging the top-left corner, generous white space on the right and bottom, $STYLE"

# 3 — rose cluster for the base corners (tight, no white pockets)
gen roses-amoris-v2 1024x1024 "one tight lush low cluster of deep wine crimson roses with two blush roses and dark ivy leaves, small gold fleuron buds, flowers overlapping densely with no gaps between them, soft painterly matte illustration, crisp clean edges, isolated on pure white background, high detail, no text"

# 4 — closing plate: small gothic chapel front at dusk with candlelit windows
gen chapel-amoris 1152x864 "one small elegant gothic stone chapel facade at dusk, twin slim pinnacles flanking a pointed doorway glowing warm candlelight, one small circular rose window above the door emitting soft wine-crimson stained glass light, climbing crimson roses and ivy on the stone, a slender gold cross at the gable tip, gentle warm gold light wash, refined painterly matte illustration, no photorealism, no photograph, crisp clean silhouette, isolated on pure white background, high detail, no text"

echo AMORIS-V2-DONE
