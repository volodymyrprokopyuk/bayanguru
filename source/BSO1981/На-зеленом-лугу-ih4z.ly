{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \partial 4 { g'='8\f a | }
  b='4 c8 b | a4 d | g, g8\p a | b g c b | a4 d | g,4 g'8(\f a |
  b=''8 g c b | a fis d fis | g d) g,(\p a b g c b | a d, d' d, |
  g='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 4 { r4 | }
  g,=,4-\stBass gM! | d' dM! |
  \rep 3 { g,=,4 gM! | g gM! | d'= dM! | } | g+gM! %
}
{{ end }}
