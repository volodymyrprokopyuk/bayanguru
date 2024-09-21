{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 2/4
  e'='4(\p c' b8 g fis g | e4.) b8( | e4 c' | b g fis g | e4 d) |
  \duo {
    d''=''4( d8 d | e4 d) | e8( c b a | e'4. d16 c) |
    <g=' b>4.( <a c>8 | b4_\dDim b8 b | \af 2\! <e,=' e'>2)\> |
  } {
    b'='8( a g4 | g2) | fis4( g8 fis | e2) | s2 | g8 fis16 e fis8 fis=' | s2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
