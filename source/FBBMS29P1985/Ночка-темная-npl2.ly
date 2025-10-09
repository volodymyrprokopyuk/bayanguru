{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 2/4
  e'='4(\mf c' | b8 g fis g | e4~ e8) r | \rep 3 { R2 | }
  d'=''4( d8 d | e4 d) | e8\( c b a | e'4. d16 c | b4.\> c8 |
  b='4 b8 b | \af 2\! e=''2\) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R2 | R2 | r4 r8 b=8\(-\frBass | e4 c' | b8 g fis g | e4 d\) |
  g='4\( g | c b | a g8 fis | e2\) | g4.( a8 | g fis16 e fis8 fis |
  e='2) \fermata |
}
{{ end }}
