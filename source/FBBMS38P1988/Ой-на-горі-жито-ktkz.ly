{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  g'='8\p\< g( b \af 8\! c) | d4.( c8) | b\> b a4 | g d8( \af 8\! fis) |
  g='8(\< a b \af 8\! c) | d4.( c8) | b b a4 | g2 | fis8(\mf a d, fis |
  g='2) \clef bass | fis,=8(\p a d, fis | \af 2\! g=2)\> \clef treble |
  fis''=''8(\mf a d, fis | \af 2\! g2)\> | fis,8(\p a d, fis | \af 2\! g2)\> |
  <g=' b>8\mf\> 8 <fis a>4 | g2\p | <g, b>8\>^\tRit 8 \af 8\! <fis a>4 |
  g=2\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  R2 | g=8-\frBass g( b c) | d4.( c8) | b b a4 | g4.( a8) |
  b=8( c d e) | d d c4 | <g b>2 | R2 | r8 d'( b g) | R2 | r8 d( g,4) |
  R2 \clef treble | r8 d'''=''8( b g) | R2 | r8 d8( g,4) | d' c |
  <b= d>2 \clef bass | d,=4 d, | g=,2 |
}
{{ end }}
