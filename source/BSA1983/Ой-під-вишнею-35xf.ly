{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  g'='8-.\f g-. b4-- | a8( fis d4) | g8-. g-. b( d | a fis d4) |
  g='8 g g( a16 b | c8) c e <g, bes e> | d' d d,( e16 fis | g8) g g4 |
  g='8 g g' g16( f | e d c b a b c8)-. | d d d,( e16 fis | g8) r <b=' g'>4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM | d' dM! d dM | b g@M! g8 gM | d' dM! fis d@M |
  g,=,8 gM! f g@M | e'8 c@M! c8( cis | d) g@M! d8 d7! | g,[ gM! gM gM] |
  g=,8 gM! a b | c cM! e c@M | d8 g@M! d8 d7! | g,=, r g+gM!4 |
}
{{ end }}
