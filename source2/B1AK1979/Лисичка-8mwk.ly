{{ define "rh1" }}
  e='8( g) d d | e4 f | e8 e d d=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Presto
  \clef treble
  \key c \major
  \time 2/4
  c'='8(\mf d e f | g) g g g | a a a a | g4 g |
  {{ template "rh1" }} | c4( g') |
  {{ template "rh1" }} | c4 c=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \meter 1/2 #'(1)
  c=8(-\stBass cM!) cM cM | c( cM) cM cM |
  f,=,8( fM!) fM fM | c'( cM!) cM cM |
  \meter 1/4 1,1,1,1
  c=8 cM! g gM! | c cM! f, fM! |
  c'=8 cM! g gM! | c cM! g gM! |
  c=8 cM! g gM! | c8 cM! f, fM! |
  g=,8 c@M! g8 g7! | c= cM! c+cM4 |
}
{{ end }}
