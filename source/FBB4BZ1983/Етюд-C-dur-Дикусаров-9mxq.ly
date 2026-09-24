{{ define "rightHand" }}
\relative {
  \tempo Moderado
  \clef treble
  \key c \major
  \time 4/4
  c'='8( b c d e dis e f | g fis g a g4.) gis8( |
  a='8 gis a b d c b a | gis g e f g2) | d8( e f g a b c d |
  e=''8 f g a g fis f e) | g( f d4) f8( e c4) | e8( d b4) d8( c a4) |
  b='8( a f g a b c d | e f g a b c d c) | b( a gis f e d c b |
  a='8 b c d e d c b) | a( b c d e fis gis a | b a g f e d c b) |
  c=''8( b a g fis f e d | c b c d e dis e f) | e( fis gis a g f e d |
  c='8 d e f g f e d) | c( e g a g f e d) |
  c='8( e g e g b c e | g e g b c e=''' \ottava #1 g=''' b |
  c=''''4 \ottava #0 r <e,,='' g c>) r | c,=' r r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  <e= g>1-\frBass |
  \duo {
    c'='2 b4 bes8 d, \rest | a'4 c d dis | s2 bes4 a | a2 g | s1 |
    b=2 c4 e | d2 a4 c | f='1 |
  } {
    e=2.~ e8 s8 | f1 | <c' e>4 <g c> <e cis'>2 | <f b>1 | <e g c>2 <e bes' cis> |
    d=4 a' g2 | e4 gis f2 | a g= |
  }
  <c'=' e>2 <f, dis'> | <e b' d>1 | <a c>4. r8 <e b' d>4. r8 | <a c>2 8 r r4 |
  <a= f'>2 \duo { f'='4 e8 d=' | } { gis=2 | } |
  \rep 2 { <a= c>8 r r4 <gis= b d>2 | }
  <a= c>8 r r4 <b f'>2 | \rep 2 { <c=' e>8 r r4 <b= f'>2 | }
  <a= c>8 r r4 r2 | R1 | R1 | c,=4 r r2 |
}
{{ end }}
