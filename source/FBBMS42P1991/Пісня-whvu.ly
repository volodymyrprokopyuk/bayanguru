{{ define "rh1" }}
  {{ .a }} e dis e c4 b8 a | g a b fis e4. a8) |
  e='8( fis g b a g fis e=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  {{ template "rh1" (w `b'='8(\mf`) }} | b'='4.( dis,8 e4) r |
  e='8-.\f b'-. g-. b-. c(-> b a g) | b( c b fis) b( c b g) |
  r4 <g=' d'>4-- <bes ees>8(-> d c bes) |
  r4\< <g=' d'>4-- r \af 4\! <a b fis'>-- |
  r4\> <g=' b e>4-- r^\tRit \af 4\! <a=' b dis>-- |
  {{ template "rh1" (w `b='8(\p`) }} |
  b'='4~\> b8^\tRit <a dis> <g=' e'>4~ \af 8\! 8 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
