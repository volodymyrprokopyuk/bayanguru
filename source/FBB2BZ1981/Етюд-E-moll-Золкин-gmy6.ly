{{ define "rh1" }}
  \rep {{ .a }} { r8 <g=' b d>8 8 8 | } r8 <fis=' a d>8 8 8 |
{{ end }}

{{ define "rh2" }}
  \rep {{ .a }} { r8 <e=' g b>8 8 8 | }
{{ end }}

{{ define "lh1" }}
  {{ .a }} b d8 e d | g4 fis8 e | d4 b=) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 2/4
  \meter 1/8 1,3
  r8\mf <g'=' b d>8 8 8 | {{ template "rh1" (w `2`) }}
  {{ template "rh1" (w `4`) }} | r <fis a b>8 8 8 |
  {{ template "rh2" (w `3`) }} | r <dis fis b>8 8 8 |
  {{ template "rh2" (w `2`) }} | r <e a c>8 8 8 |
  {{ template "rh1" (w `1`) }} | r\> <g b d>8^\tRit 8 \af 8\! 8 |
  <b=' d g>4~\p 8 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `g=16(-\frBass`) }} | c='4( b8 a | d2) |
  {{ template "lh1" (w `g,=16(`) }} | c='4( b8 a | b2) |
  e,=16( g b8 c b | e4 d8 c | b4 g) | a( g8 a | b2) |
  e,=16( g b8 c b | g'4 fis8 e | d4 b) | c( b8 a | g2_~ | g4_~ g=8) r |
}
{{ end }}
