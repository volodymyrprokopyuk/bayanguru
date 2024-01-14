{{ define "rh1" }}
  {{ .a }} g' d g e g f g e g f g e g d g='') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Presto
  \clef treble
  \key c \major
  \time 4/4
  {{ template "rh1" (w `c''=''16(\mf`) }}
  {{ template "rh1" (w `c,=''16(`) }}
  e=''16( c g' c, f c e c d g, f' g, e' g, d' g,) |
  c=''16( d c b c e g e c=''8) r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c+cM!8-\stBass r r4 r g+g7!8 r | c+cM!8 r r4 r g+g7!8 r |
  c+cM!8 r r4 g+g7!8 r r4 | c+cM!8 r r4 c=8 r r4 |
}
{{ end }}
