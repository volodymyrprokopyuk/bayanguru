{{ define "rh1" }}
  e='8-. g-. d-. d-. | e-. e-. f4 |
  e='8-. g-. d-. d-. | c4 {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  c'='8-.\mf c-. e-. f-. | g4 g |
  a='8-. a-. a-. a-. | g4 g4 |
  {{ template "rh1" (w `g'='4`) }}
  {{ template "rh1" (w `c='4`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | c cM | f, fM! | c' cM! |
  c=8 cM! b g@M! | c8 cM! f, fM! |
  c'=8 cM! g gM! | c4 g+gM! |
  c=8 cM! b g@M! | c8 cM! d dm! |
  g,=,8 c@M! g8 gM! | c=4 cM! |
}
{{ end }}
