{{ define "rh1" }}
  a'='4( c8 a | g4 e8) e-. | g( f e d | c='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  g'='4(\mf e8) e-. | g4( e8) e-. | g( f e d | c2) |
  {{ template "rh1" }}
  {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \meter 1/2 #'(1)
  c=8(-\stBass cM!) cM cM | c( cM) cM cM |
  g=,8_\aSim gM! gM gM | c cM! cM cM |
  f,=,8 fM! fM fM | c' cM! cM cM |
  g=,8 gM! gM gM | c cM! cM cM |
  f,=,8 fM! fM fM | g[ c@M! cM8 cM] |
  g=,8 g7! g7 g7 | c= cM! cM4 |
}
{{ end }}
