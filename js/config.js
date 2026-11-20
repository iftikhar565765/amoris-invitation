/* ═══════════════════════════════════════════════════════════════
   Amoris · config.js
   ---------------------------------------------------------------
   Main personalisation data for the site and visual editor.
   Longer copy, palette, and theme are editable here. Values
   marked SAMPLE are tasteful placeholders — replace them with
   your own before sending the link to your guests.
   ═══════════════════════════════════════════════════════════════ */

window.HEIRLOOM = {
  templateId: "amoris",

  /* ── The couple — SAMPLE content, replace with your names ────── */
  couple: {
    partnerOne: "Elowen",                      // SAMPLE
    partnerTwo: "Finnian",                     // SAMPLE
    initials:  "E · F",                        // SAMPLE — used on seals & monograms
    namesLine: "Elowen & Finnian"              // SAMPLE — used across the site
  },

  /* ── The wedding date & time ─────────────────────────────────
     iso : ISO 8601 date-time WITH an explicit UTC offset, so the
           countdown and the calendar files are correct on every
           guest's device, wherever they are in the world.
           Format: "YYYY-MM-DDTHH:MM:SS±HH:MM"                    */
  wedding: {
    iso: "2027-06-19T16:30:00-04:00",                                        // EDIT
    endIso: "2027-06-19T23:00:00-04:00",                                     // EDIT — end of the celebration
    display: "Saturday, 19 June 2027 · the Holy Matrimony begins at half past four in the afternoon", // EDIT
    zoneLabel: "EDT",                                                        // EDIT — optional note for guests abroad
    words: "Saturday · The Nineteenth of June · Two Thousand Twenty-Seven",  // EDIT
    numerals: "19 · 06 · 2027",                                              // EDIT
    weekday: "Saturday",                                                     // EDIT — the ornamental date row
    month: "June",                                                           // EDIT
    day: "19",                                                               // EDIT — the large numeral
    year: "2027",                                                            // EDIT
    ceremonyLabel: "Holy Matrimony",                                         // EDIT
    ceremony: "at half past four",                             // EDIT
    eventTitle: "Elowen & Finnian — Wedding"                                 // EDIT (calendar entry)
  },

  /* ── The venue ──────────────────────────────────────────────── */
  venue: {
    name: "The Rose Garden at Evermore Manor",                 // SAMPLE
    address: "Evermore Manor, Hudson Valley, New York",        // SAMPLE
    mapsQuery: "Rose Garden at Evermore Manor, Hudson Valley, New York",
    /* A full URL here overrides the map link built above, e.g. an
       exact Google Maps place link or an Apple Maps URL.          */
    mapUrl: ""
  },

  /* ── Copy shown throughout the invitation ────────────────────
     The visual editor can change these values without editing HTML. */
  content: {
    pageTitle: "Elowen & Finnian · 19 June 2027 — Wedding Invitation",
    pageDescription: "Elowen and Finnian request the honour of your presence at the Holy Matrimony at the Rose Garden at Evermore Manor — roses, doves and a covenant of love, on Saturday the nineteenth of June 2027. Open your invitation.",
    socialTitle: "Elowen & Finnian — An Invitation · 19.06.2027",
    socialDescription: "Roses, doves and a covenant of love — you are cordially invited.",
    navStory: "Story",
    navDetails: "The Day",
    navVenue: "Venue",
    navRsvp: "RSVP",
    menuInvitation: "The Invitation",
    menuStory: "Our Story",
    menuSaveDate: "Save the Date",
    menuDetails: "The Order of the Day",
    menuPalette: "The Palette",
    menuWeddingDay: "The Wedding Day",
    menuVenue: "Venue & Location",
    menuRsvp: "Kindly Respond",
    menuCountdown: "The Countdown",
    menuClosing: "A Closing Blessing",
    openingEyebrow: "With the grace of God and the blessing of their families, you are invited to the Holy Matrimony of",
    openingHint: "Touch the seal to break it",
    openButton: "Enter the Rose Garden",
    skipButton: "Skip straight to the invitation",
    envelopeAddress: "their honoured guests",
    verseLine: "I have found the one whom my soul loves",
    invitationEyebrow: "With the blessings of our families",
    invitationLead: "We joyfully invite you to celebrate the Holy Matrimony of",
    invitationAnd: "and",
    invitationClosing: "Your presence is our greatest blessing",
    heroVenueLabel: "Venue",
    sceneSignboard: "Written among the roses",
    invitationVenueSuffix: "· Hudson Valley",
    storyKicker: "The Chronicle",
    storyTitle: "Two hearts,",
    storyTitleScript: "one covenant",
    storyParagraphOne: "Every good story begins with a seed, and ours was planted in a rose garden — one shared bench, a straw hat the wind kept stealing, and a first conversation that outlasted the July heat. We walked the beds until the lamps came on, and somewhere between the last rose and the first starlight, we knew our lives had turned toward each other.",
    storyParagraphTwo: "Four years and two cities later, our families gathered beneath one roof to give their blessing, and the date was written in pen and prayer. Nothing would mean more than to have you standing beside us as we exchange our vows before God, and begin a home built on faith, hope and love.",
    storyQuote: "I have found the one whom my soul loves.",
    storyQuoteLabel: "— Song of Songs 3:4 — the verse that carried us",
    storyNote: "chapter one, and every chapter after",
    storyNoteCredit: "— pencilled on the back of a wedding date card",
    storyCaptionOne: "the evening in the rose garden",
    storyCaptionTwo: "one bench beneath the trellis",
    storyCaptionFour: "the vows",
    storyAside: "and they lived",
    scriptureKicker: "The Word",
    scriptureVerse: "And over all these virtues put on love, which binds them all together in perfect unity.",
    scriptureVerseLatin: "Super omnia haec vestimentum habete caritatis, quod est vinculum perfectionis.",
    scriptureReference: "Colossians 3 · 14",
    saveDateTitle: "Save the Date",
    saveDateCrossing: "the roses, the vows & the dancing",
    saveDateNote: "Add the date to your calendar and keep these particulars close.",
    calendarDownloadLabel: "Add to Calendar",
    calendarGoogleLabel: "Google Calendar",
    detailsKicker: "The Order of the Day",
    detailsTitleFirst: "The",
    detailsTitleSecond: "Wedding Day",
    detailsIntro: "One blessed day with our families — at a glance.",
    eventOneLabel: "The Garden Reception of Guests",
    eventOneTime: "Saturday, 19 June 2027 · half past three in the afternoon",
    eventOneNote: "Lemonade and string quartet beneath the trellis — arrive through the manor's rose walk.",
    eventTwoLabel: "The Ceremony",
    eventTwoTime: "Saturday, 19 June 2027 · half past four in the afternoon",
    eventTwoNote: "The Holy Matrimony in the garden chapel — vows, rings, and a covenant before God.",
    eventThreeLabel: "The Reception",
    eventThreeTime: "Saturday, 19 June 2027 · six in the evening",
    eventThreeNote: "A rose-lit supper on the manor lawn — toasts, dancing and candlelight until the stars come out.",
    eventFourLabel: "The Farewell Tea",
    eventFourTime: "Sunday, 20 June 2027 · eleven in the morning",
    eventFourNote: "One last afternoon in the garden — tea, cakes and farewells among the roses.",
    kindlyReplyLabel: "Kindly Reply",
    kindlyReplyNote: "Kindly send your response using the reply card further below.",
    particularsEyebrow: "The Particulars",
    particularsDateLabel: "The Date",
    particularsPlaceLabel: "The Place",
    particularsAttireLabel: "The Attire",
    particularsAttire: "Wine, blush & gold",
    particularsAttireNote: "Formal attire with a bloom of the garden — dress as though the roses might notice.",
    particularsCarriagesLabel: "Kindly Reply",
    particularsCarriagesTime: "the nineteenth of May, 2027",
    particularsCarriagesNote: "So the supper count is right and every seat is saved.",
    paletteKicker: "The Colours of the Day",
    paletteTitleFirst: "The wine &",
    paletteTitleSecond: "blush rose",
    paletteIntro: "Deep wine and blush rose, antique gold and sapphire glass — the colours of the rose window, worn by our favourite people.",
    dressCodeLabel: "Attire · Wine & Blush",
    dressCodeTitle: "Colours of the rose garden",
    dressCodeNote: "Wine silks, blush chiffon and gold accessories are most welcome — dress as splendidly as you feel.",
    weddingDayKicker: "The Celebration",
    weddingDayTitleFirst: "The wedding",
    weddingDayTitleSecond: "celebration",
    venueKicker: "The Place",
    venueDescription: "A manor chapel wrapped in climbing roses — stained-glass light at golden hour, doves on the trellis, string quartet among the beds, and candle lanterns lining every path.",
    venueCeremonyLabel: "Ceremony",
    venueCeremonyText: "in the garden chapel, at half past four, before God and our families",
    venueReceptionLabel: "Reception",
    venueReceptionText: "a rose-lit supper on the manor lawn",
    mapButton: "View Location",
    rsvpKicker: "Your Reply",
    rsvpTitle: "Kindly Respond",
    rsvpLead: "Kindly reply by",
    rsvpNameLabel: "Your name",
    rsvpNamePlaceholder: "e.g. Eleanor Whitmore",
    rsvpNameError: "May we have your name? Two letters or more will do.",
    rsvpAttendanceLabel: "Will you be joining us?",
    rsvpAcceptLabel: "Joyfully accepts",
    rsvpDeclineLabel: "Regretfully declines",
    rsvpAttendanceError: "Please let us know whether you can come.",
    rsvpGuestsLabel: "Seats in your party",
    rsvpGuestsError: "May we have a seat count between one and the party size allowed?",
    rsvpGuestSingular: "guest",
    rsvpGuestPlural: "guests",
    rsvpDietaryLabel: "Dietary requirements",
    rsvpDietaryPlaceholder: "Vegetarian, allergies…",
    rsvpMessageLabel: "A note for the couple",
    rsvpMessagePlaceholder: "Blessings, memories, wishes…",
    rsvpSubmitLabel: "Send Response",
    rsvpAmendLabel: "Amend the reply",
    countdownDaysLabel: "Days",
    countdownHoursLabel: "Hours",
    countdownMinutesLabel: "Minutes",
    countdownSecondsLabel: "Seconds",
    countdownKicker: "The Grand Countdown",
    countdownTitle: "counting the hours until",
    countdownPromise: "the vows are exchanged",
    closingScript: "with all our love",
    closingMessage: "Thank you, from the depths of our hearts, for being part of our story. May the Lord bless our home with faith, hope and love — and may every guest who walks through our door leave with a blessing. Your presence completes our celebration.",
    closingBlessing: "And now these three remain: faith, hope and love. But the greatest of these is love.",
    closingBlessingReference: "1 Corinthians 13 · 13",
    footerTagline: "Wine & blush — from the rose garden, with love."
  },

  palette: [
    { name: "Wine Burgundy",   color: "#6E2434" },
    { name: "Blush Rose",      color: "#E8C2B8" },
    { name: "Antique Gold",    color: "#C9A24B" },
    { name: "Sapphire Glass",  color: "#274D6D" },
    { name: "Deep Gold Ink",   color: "#6D5518" },
    { name: "Warm Ivory",      color: "#F6EFE0" }
  ],
  theme: "amoris",
  themeColors: {},
  fonts: {
    editorial: "cormorant",
    display: "italiana",
    script: "alexBrush",
    hand: "caveat",
    body: "ebGaramond"
  },

  /* ── Wedding moments — SAMPLE words for the string of lights.
     Use one short phrase per entry; an empty list hides the section. */
  moments: ["The Garden Walk", "The Processional", "The Vows", "The Rings", "The Reception", "The Dancing"],

  /* ── RSVP ─────────────────────────────────────────────────────
     endpoint : leave "" for the honest demonstration mode — the
                form validates and shows a preview of the reply and
                states clearly that nothing is sent or stored.
                Cloudflare's publishing service supplies the invitation-
                specific RSVP endpoint to public invitation pages.
     maxGuests: the number allowed by the invitation.
     deadline  : shown above the form.                                  */
  rsvp: {
    endpoint: "",
    maxGuests: 4,
    deadline: "the nineteenth of May, 2027"        // SAMPLE
  },

  /* ── Countdown wording (invalid or passed dates) ─────────────── */
  countdown: {
    invalidMessage: "The hour is still being finalised — see the order of the day below.",
    pastMessage: "The celebration has begun — thank you for being part of our story."
  },

  /* ── Optional ambient music ───────────────────────────────────
     Drop a small looping file at assets/audio/theme.mp3 and set
     src to enable the volume toggle in the navigation. Never
     autoplays; stays silent if the file is missing.                  */
  audio: {
    src: ""             // e.g. "assets/audio/theme.mp3"
  }
};
