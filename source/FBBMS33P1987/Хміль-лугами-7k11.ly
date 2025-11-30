{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  R2\mp | e'='8( e c' b) | a4(\> b8 \af 8\! a) | e4\< \af 4\! e |
  \duo { a'='8( a a16 b c8) | b2 | a16(\> c b a g8 a | e4 \af 8\! e='8) } %
  { e'='2~ | e8 e16( fis g4) | e='2 | s4. } r8 |
  e='8(\mp e c' b) | c( b a g) | a16(\> c b a g8 \af 8\! fis) |
  e='8(\< g a \af 8\! b) | c( d c a) | g( b e d) | c(\> d16 c b8 a |
  e'=''4 \af 8\! e=''8) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
