{{ define "rh1" }}
  {{ .a }} d e f g8) g | a16( g f a g4) |
  f='16( e d f {{ .b }} c b d c='4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! e c@M | f8 fM! e c@M! | {{ .b }} g, c@M! | g=,8 g7! {{ .c }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `c'='16(\mf` `e='8) e | d16(`) }}
  {{ template "rh1" (w `c='16(` `e='16 d c e | d16`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8-\stBass` `f=8 fM!` `c= cM!`) }}
  {{ template "lh1" (w `c=8` `d=8 dm!` `c+cM!4`) }}
}
{{ end }}
