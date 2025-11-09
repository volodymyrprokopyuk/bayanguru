{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  b'='16(\f d b d c b a g | d'8 e d4) | b16( d b d c b a g | a8 b g4) |
  g='16(\mp b g b a g fis e | b'8 c b4) | g16(_\dDim b g b a g fis e | g8 a e='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  R2 | R2 | b=16(-\frBass d b d c b a g | a8 b g4) | e' d~ | d d | cis( c | <e,= b'>2) |
}
{{ end }}
