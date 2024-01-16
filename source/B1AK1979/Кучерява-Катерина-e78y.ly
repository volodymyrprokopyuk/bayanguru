{{ define "rh1" }}
  {{ .a }} d e f g8)-. g-. | a16( g a8) g-. {{ .b }} |
  {{ .c }} e f8) e16( d e8) | d16( c d8) c-. c='-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d e8) d16( c d8) | e16( d e8) f-. f-. | e16( d e8) d16( c d8) |
{{ end }}

{{ define "lh1" }}
  c=8 cM! g gM! | c cM! f= fM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `c'='16(\f` `g='-.` `f='16(`) }}
  {{ template "rh1" (w `c='16(` `c=''-.` `f,='16(`) }}
  {{ template "rh2" (w `e='16(\p`) }}
  c='8-. c'-.\< c16( b \af 8\! c8) |
  {{ template "rh2" (w `e=''16(\mf`) }}
  c=''8-. c-. c-. c=''-. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass cM! c cM | f fM! c cM! |
  \rep 2 { g=,8 g7! c= cM! | }
  c=8 cM! e c@M | f8 fM! e c@M! |
  f=8 fM! g, c@M! | g8 g7! c cM! |
  {{ template "lh1" }}
  c=8 cM! g gM! | c cM! e c@M |
  {{ template "lh1" }}
  g,=,8 c@M! g8 g7! | c cM! c= cM |
}
{{ end }}
