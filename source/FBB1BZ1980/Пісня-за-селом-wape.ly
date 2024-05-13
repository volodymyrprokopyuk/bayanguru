{{ define "rh1" }}
  {{ .a }} b8 c d4 e) | c( b8 a b4 e,) | e'4.( c8 b4\> a8 g | a2 \af 2\! {{ .b }} |
{{ end }}

{{ define "lh1" }}
  g=2 b4( gis) | a2( g) | c4( a g=2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 4/4
  g'='4( b e,2) | g4( b e,2) | e'4( d c b8 c | d4. c8 b2) |
  {{ template "rh1" (w `b='4(\mf` `e=')`) }}
  {{ template "rh1" (w `b'='4(\p` `e=')\pp`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=2~-\frBass e8 fis( g a) | b2~ b8 g( a b) | c4( b a2 | d, e) |
  {{ template "lh1" }} | f e) | {{ template "lh1" }} | d e=) |
}
{{ end }}
