{{ define "rh1" }}
  d=''8 d c c | b b a a | e e a='4 |
{{ end }}

{{ define "lh1" }}
  d=8 dm! a am! | e' eM! a, am! | e'= eM! {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  a'='8\mp e' e e | f f e e |
  {{ template "rh1" }}
  {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass am! a am | d dm! a am! |
  {{ template "lh1" (w `a,=,4`) }}
  {{ template "lh1" (w `a+am!4`) }}
}
{{ end }}
