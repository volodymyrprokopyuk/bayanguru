{{ define "rh1" }}
  g='4 c g) e8( f | g f e d c='4) %
{{ end }}

{{ define "rh2" }}
  {{ .a }} e | f8 e d a' g4) e8( f | g f e d c='4) %
{{ end }}

{{ define "lh1" }}
  {{ .a }} f@M! c@M!4 r4 | g=, g7! c@M! r4 |
{{ end }}

{{ define "lh2" }}
  d'=4 dm! e@m! r4 | g,=, g7! {{ .a }} %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 4/4
  \partial 4 { e'='8(\mf f | }
  {{ template "rh1" }} e='8( f | {{ template "rh1" }}
  {{ template "rh2" (w `d='8(\p`) }} {{ template "rh2" (w `d='8(`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  {{ template "lh1" (w `c=4-\stBass`) }} {{ template "lh1" (w `c=4`) }}
  {{ template "lh2" (w `a@m! r4`) }} {{ template "lh2" (w `c@M!`) }}
}
{{ end }}
