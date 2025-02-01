{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 3/4
  e'='8(\mf fis g4 a | g8 fis e2) | g8( a b4 c | a b2) |
  b='8( c a4 a | a8 b g4 e) | c'8( b a4 b | g8 fis e='2) |

  e='8\f fis g a b c | b a g fis e fis | g a b c d e | d c b a b g |
  c=''8 b c b a c | b a b a g e | a b c d^\tRit e fis |
  \duo { g''=''8\> fis \af 2\! e=''2 \bar "|." } { <b'=' e>4 <a b> <g=' b> | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
