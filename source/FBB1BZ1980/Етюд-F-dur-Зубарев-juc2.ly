{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  f'='8(\mf g a bes) | g( a bes c) | a( bes c d) | c4-- a-- |
  c=''8(\p  d g, a) | bes( c f, g) | a( bes d, e | f='4)-- r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  r4 f'='8-\frBass r | r4 g8 r | r4 a8 r | r4 f4-- |
  r4 e='8 r | r4 d8 r | r4 r8 c | r4 f,=4 |
}
{{ end }}
