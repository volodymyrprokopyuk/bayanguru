{{ define "rh1" }}
  {{ .a }} d d d | c4 b8 b | a4 g=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! b g@M | c8 cM! g gM! | d' d7! g,=, gM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `d''=''8\mf`) }}
  {{ template "rh1" (w `d'=''8`) }}
  a='8\p a b b | c4( b8 d | a4 g) |
  a='8 a a b | c4 b8( d | a4 g=') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }}
  {{ template "lh1" (w `g=,8`) }}
  d'=8 dM! g, gM! | c cM! g gM! | d' d7! g, gM! |
  d'=8 dM! g, gM! | c cM! d g@M! | d8 d7! g,=, gM! |
}
{{ end }}
