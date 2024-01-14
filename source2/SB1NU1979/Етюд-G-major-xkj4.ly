{{ define "rh1" }}
  {{ .a }} a b c d e d \af 8\! g) | e( d c e d4 g='') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r b+g@M! r4 | c+cM!4 r b+g@M! r4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  {{ template "rh1" (w `g'='8(\f\<`) }}
  c,=''8( d e c) b( c d b) | d(\> c b c b4 \af 8\! a) |
  {{ template "rh1" (w `g='8(\<`) }}
  e=''4( c8 e) d4( c8 b) | a(\> b c a \af 2\! g='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g+gM!4-\stBass`) }}
  c+cM!4 r g+gM! r | d+dM!4 r d+dM! r |
  {{ template "lh1" (w `g+gM!4`) }}
  c+cM!4 r b+g@M! r4 | d+dM!4 r g+gM!2 |
}
{{ end }}
