{{ define "rh1" }}
  {{ .a }} c e4 e | f8 e d4 c8 b |
  a='8\> c \af 2\! a2\) | a8(\p c a='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  {{ template "rh1" (w `a'='8\(\mf`) }}
  {{ template "rh1" (w `a='8\(\mf`) }}
  e='8\(\mp\< gis b4 gis | \af 8\! a8 c e4 c |
  b='8\mf e e2\) | b8(\p e e2) |
  e,='8\(\mf gis b4 gis | a8 c e4 c |
  b='8 c a2\) | b8(\p c a='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4(-\stBass am!) am | d( dm!) dm | a2 am!4 | f@M!2 fM4 |
  a=,4( am!) am | d( dm!) dm | f@M!2 fM4 | a@m!2 am4 |
  e=4 eM! eM | a, am! am | gis e@M! eM4 | r e@M! eM4 |
  e'=4 e7! e7 | a,=, am! am | d@m!( a@m!2) | e+e7!4 a+am!2 |
}
{{ end }}
