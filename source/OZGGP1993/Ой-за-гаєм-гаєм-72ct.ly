{{ define "rh1" }}
  {{ .a }} c16( d e8 c) | b b16( c d8 b) | c( {{ .b }} a e fis=' |
{{ end }}

{{ define "lh1" }}
  a=8 a16( b c8 a) | g g16( a b8 gis) | a( c d c=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  g'='8(\mf a b c | d4 g) | e8.( fis16 g8 e | d4 b) |
  {{ template "rh1" (w `c=''8\mp` `_ \dCre`) }} | g='4) b8( d) |
  {{ template "rh1" (w `c=''8\f` ``) }} | g='4 g=')  \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  R2 | g=8(-\frBass a b d) | c( d e c | b a g d') |
  {{ template "lh1" }} | b=8 a) g( b) |
  {{ template "lh1" }} | b=4 b=) |
}
{{ end }}
