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
  \duo {
    r4 <b= e>4 <c e> | <b e> <c e>( <c d>) |
    r4 <d=' g>4 <ees g>~ | 4 <d g> <d f> | r4 <c e>2 |
    r4 <g= b>4 <g bes> | r <a c> <a b> | r4 <g= b>4 4 |
  } {
    e=2.~-\frBass | e4 fis2 | g2. | g2 gis4 | a2 e4 | d2 des4 | c2 b4 | e=2. |
  }

  e'='2( ees4 | d2 c4) | b2( a4 | b2 b4) |
  \duo { r4 <c'=' e>4 r | r <g b> r | r <a c> <g= a> | }
  { a=2 e4 | d2 des4 | c=2 r4 } | e='2. |
}
{{ end }}
