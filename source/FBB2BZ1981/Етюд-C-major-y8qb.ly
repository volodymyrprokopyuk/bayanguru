{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 4/4
  e'='8(\f g fis g) e( c' b c) | f,( a gis a) f( d' cis d) |
  b='8( c d e f e d c | d c b a b g a b) |
  \rep 2 { c=''8( e dis e='') } |\rep 2 { d=''8( f e f='') } |
  a=''8( g f e d c b a | g gis a b c='') r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='8(-\frBass e dis e) c( e dis e) | \rep 2 { d='8( f e f=') } |
  d='8( e f g a g f e | f e d c d b c d) |
  e='8( g fis g) e( c' b c) | f,( a gis a) f( d' cis d) |
  f=''8( e d c b a g f | g f e d c=') r r4 |
}
{{ end }}
