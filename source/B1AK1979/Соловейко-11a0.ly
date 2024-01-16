{{ define "rh1" }}
  {{ .a }} d b d | c( b a4) | b8( a g='4) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a d4 | b16( c b a g='4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM!) gM gM] | a[( d@7!) d78 d7] |
  d=8 d7! g,=, gM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `d''=''8\mf`) }}
  {{ template "rh1" (w `d'=''8\mp`) }}
  {{ template "rh2" (w `a='8\mf`) }}
  {{ template "rh2" (w `a='8\p`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8[(-\stBass`) }}
  {{ template "lh1" (w `g=,8[(`) }}
  d'=8 d7! fis d@7 | d8 d7! g, gM! |
  c=8 a@m! fis8 d@7! | d8 d7! g,=, gM! |
}
{{ end }}
