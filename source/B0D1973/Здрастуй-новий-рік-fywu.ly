{{ define "rh1" }}
  {{ .a }} g-. g-. e-. f-. e-. d4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} c-. d4 e8-. e-. f4 | g8-. e-. f-. d-. c-. c-. c4 |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! a c@M d8 f@M! g,=,8 gM! |
{{ end }}

{{ define "lh2" }}
  c=8 cM! g gM! c cM! a f@M! |
  g=,8 c@M! g8 gM! c= cM! {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 4/4
  \meter 1/4 1,1,1,1
  {{ template "rh1" (w `g''=''8-.\mf`) }}
  {{ template "rh1" (w `g,='8-.`) }}
  {{ template "rh2" (w `c='8-.`) }}
  {{ template "rh2" (w `c'=''8-.`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \meter 1/4 1,1,1,1
  {{ template "lh1" (w `c=8-\stBass`) }}
  {{ template "lh1" (w `c=8`) }}
  {{ template "lh2" (w `cM4`) }}
  {{ template "lh2" (w `c+cM4`) }}
}
{{ end }}
