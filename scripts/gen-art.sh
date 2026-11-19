#!/bin/bash
# AMORIS — the rose window · Christian redesign art suite.
# Renaissance illumination / stained glass rose window world.
set -u
RAW=/home/z/my-project/amoris-invitation/_raw-art
mkdir -p "$RAW/cands"

gen () {
  local name="$1" size="$2" prompt="$3"
  for attempt in 1 2 3 4 5 6 7 8 9 10; do
    [ -s "$RAW/$name.png" ] && { echo "have $name"; return 0; }
    echo "== amoris/$name attempt $attempt"
    if timeout 150 z-ai image -p "$prompt" -o "$RAW/$name.png" -s "$size" 2>&1 | grep -q 'completed'; then
      echo "ok amoris/$name"; sleep 8; return 0
    fi
    rm -f "$RAW/$name.png"
    sleep $((18 + attempt * 8))
  done
  echo "FAILED amoris/$name"
}

STYLE="flat painted illustration in the manner of a Renaissance illuminated manuscript with delicate gold leaf, luxury wedding stationery artwork, deep wine burgundy and soft blush rose with muted matte antique gold and warm ivory, absolutely no photorealism, no photograph, no 3D rendering, no glossy metallic bevel, uniform matte finish, crisp clean silhouette, isolated on pure white background, high detail, no text, no letters, no watermark"

# 1 — hero rose window: round stained glass window with EMPTY WHITE centre
for i in 1 2 3 4 5 6; do
  f="$RAW/cands/rosewin-$i.png"
  [ -s "$f" ] && continue
  echo "== amoris rose window roll $i"
  if timeout 150 z-ai image -p "one single grand circular rose window medallion perfectly centred filling most of the frame, a wide ring band of stone pink marble and matte antique gold gothic tracery with small stained glass rondels in deep wine red and sapphire blue set around the ring, delicate gold tracery rosette spokes, THE CIRCLE IN THE VERY CENTRE IS COMPLETELY EMPTY PURE WHITE BLANK SPACE IDENTICAL TO THE PLAIN WHITE BACKGROUND, absolutely no glass and no tracery inside the centre circle, the window is just an empty white round hole framed by the decorative ring, everything outside the ring pure white empty too, flat painted illustration in the manner of a Renaissance illuminated manuscript with gold leaf, luxury wedding stationery artwork, muted matte antique gold and warm ivory stone with deep wine and sapphire glass accents, no photorealism, no 3D rendering, uniform matte finish, crisp clean silhouette, high detail, no text, no watermark" -o "$f" -s 1024x1024 2>&1 | grep -q 'completed'; then
    echo "ok roll $i"; sleep 6
  else
    echo "fail roll $i"; rm -f "$f"; sleep $((15 + i * 5))
  fi
done
echo ROLLS-DONE

# 2 — sanctuary candle sconce (hanging lantern)
gen lantern-amoris 768x1344 "one slender hanging renaissance candle sconce lantern, matte antique gold frame with fine pierced scrollwork, soft rose tinted glass panels glowing with a small warm flame inside, small ornate chain rising to a ring at the top, small gold cap at base and crown, $STYLE"

# 3 — corner ornament (true corner, anchored top-left, NO frame)
gen corner-amoris 1024x1024 "one top-left corner arrangement of slender matte antique gold rose vines with tiny blush pink roses and fine deep green leaves hugging the top-left corner of the canvas and curving gently inward toward the centre like an open garland, absolutely no frame, no border, no square panel, no rectangle, only the free-flowing vines and leaves themselves, thin delicate lines, generous pure white empty space on the right and bottom, $STYLE"

# 4 — divider: thin gold rule with two entwined rings at centre
gen divider-amoris 1344x768 "an extremely thin single horizontal matte antique gold line running across the ENTIRE canvas width at the exact vertical centre, perfectly straight hairline rule only 4 pixels thick, one tiny pair of delicate matte gold wedding rings entwined sitting on the line at the exact centre flanked by two very small blush rose buds, the ornament band occupies less than six percent of the canvas height, the entire rest of the canvas above and below the line is completely empty pure white with nothing in it, $STYLE"

# 5 — doves: pair of doves (amoris signature — two hearts)
gen dove-amoris 1024x1024 "two elegant white doves in gentle flight side by side with wings raised, each carrying a small green olive sprig in its beak, fine matte gold outline on soft ivory feathers, centred with generous white margin, $STYLE"

# 6 — roses cluster (tight, no white pockets, NO pure white petals)
gen roses-amoris 1024x1024 "one tight lush cluster of deep wine red roses and blush pink roses with rich deep green leaves and tiny gold buds, petals in rich reds and pinks never pure white, flowers overlapping densely with foliage filling every gap between blooms, soft painterly matte illustration, muted jewel tones, crisp clean edges, isolated on pure white background, high detail, no text, no watermark"

# 7 — wax seal: wine wax with entwined gold rings + small cross
gen seal-amoris 1024x1024 "one round deep wine burgundy wax seal stamped with an embossed matte antique gold pair of entwined wedding rings above a tiny cross at its centre, wreathed in a small laurel of rose leaves, fine beaded pressed edge, slightly imperfect hand-poured wax rim, matte finish, centred, generous white margin, $STYLE"

# 8 — swag garland (wide)
gen swag-amoris 1344x768 "one elegant hanging garland swag curving in a gentle arc across the canvas, made of small wine red and blush pink roses with rich matte gold leaves and thin gold ribbon tied at both upper corners, dense colourful flowers and foliage with no empty white gaps inside the garland, soft painterly matte illustration, muted jewel tones, crisp clean edges, isolated on pure white background, high detail, no text, no watermark"

# 9 — manor chapel (closing plate): isolated chapel facade with rose vines
gen manor-amoris 1152x864 "one single graceful small stone chapel facade with a modest rose window and a slender matte gold cross at its crown, warm ivory stone with climbing blush rose vines framing the doorway, the chapel drawn entirely alone and complete, crisp clean silhouette of the chapel only, absolutely no trees, no landscape, no ground scenery, no sky, everything around the chapel pure white empty background, painted matte illustration, no photorealism, high detail, no text, no watermark"

echo AMORIS-DONE
