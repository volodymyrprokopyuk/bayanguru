{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key d \minor
  \time 2/4
  d'='8(\p a' a a | g8. e16 f8 g | a a a4) |
  \duo {
    f''=''8\mf e d a | bes g c bes | a bes <f a> <e g> |
    d='8( d d f | g4 f8 f | a g f4) | f'8 e d c | c bes a d | e16 d cis8 d=''4 |
  } {
    a'='4 f | d~ d8 e | f d cis4 | b a | gis a | <bes e> a | a'2 | e4 f8 a | g4 f=' |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
