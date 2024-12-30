{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 2/4
  e'='8[(\p fis g e] | b'4 a8 b16 a | g4.) g8( |
  c=''8\< d16 c b8 \af 8\! e) | a,8( b16 a g8 e) |
  \duo { fis'='8(\> g16 a g8 \af 8\! fis | e4) \stemDown b'=' | }
  { c'='4 dis | s2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
