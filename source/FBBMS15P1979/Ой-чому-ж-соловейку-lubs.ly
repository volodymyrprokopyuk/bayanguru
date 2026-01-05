{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 3/4
  e''=''8(\p e e16 d c b a8 c) | e( e e16 d c b a8 e') |
  d=''8( c b[ a] e'4) | a,16(\> c e8 d16 e32 d c16 b \af 4\! a='4) \fermata |
  R2.\p | gis='8( a16 b c b a gis a8) r |
  \duo { f''=''8( e d c16 d e8 d) | \af 2.\! a='2.\> \fermata \bar "|." }
  { a'='2. | a8( g^\tRit f16 g32 f e16 d a'='4) \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \meter 1/4 1,1,1
  R2. | e'='8(-\frBass fis gis e a4) | g8( a e f e d) | c( a b e a,=4) \fermata |
  e'='8( e e16 d c b a8 c) | e( e e16 d c b a8 e') |
  d='8( c b a16 b c8 b) | a16( c e8 d c16 b a=4) \fermata |
}
{{ end }}
