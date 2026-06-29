{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 1,1,1
  R2.\p | \rep 3 { R2. | }
  c''=''8(\f g e g f d) | c4.( e8 g4) | c8( g e g f d) | c2. |
  c''='''8(\p g ees g f d) | c4.( ees8 g4) | c8( g ees g f d) | c=''2. |

  g'=''8(\f d b d c a) | g4.( b8 d4) | g8( d b d c a) | g='2. |
  \ottava #1 g''='''8(\p d bes d c a) | g4.( bes8 d='''4) \ottava #0 |
  g,=''8(\f d b d c a) | g='2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \meter 1/4 1,1,1
  e'='4-\frBass c g | e g c=' | \rep 3 { e='4 c g | e g c=' | }
  \rep 2 { ees='4 c g | ees g c=' | }

  g=4.( b8 d='4) \clef treble | g='8( d b d c a) | g=4.( b8 d4) |
  g='8( d b d c a) | g2. | g'8( d bes d c a) | g4.( b8 d4) | g='2. |
}
{{ end }}
