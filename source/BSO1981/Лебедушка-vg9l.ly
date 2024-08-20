{{ define "rh1" }}
  \duo { a'='8( a16 b c b a e'='') } { <c'=' e>4 r | }
  <d=' a' d>8( c' <dis, a' b> a'=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 2/4
  f''=''4(\p f8 g | a bes a4) | d,4.( e8 | f4) f8( g | a bes a g) |
  d=''4 f8( a | g f e d) | a4 cis | d f8( a) | \acc { g=''16 a } g8( f e d) |
  a='4^\tRit cis | d=''2 \keyCancelBarChange \bar "||"

  \key a \minor
  <e,=' a c>4\mf^\tATem 8 d' | <gis, b e>( f' e d) | <f, a>4. b8 |
  <e,=' a c>8( b'16 c a b c d) | <gis, b e>8( f e d) |
  {{ template "rh1" }} e='4 <dis fis>8 <d gis> |
  {{ template "rh1" }} <gis,= d' e>4 <b d gis> | <c=' e a>2 \bar "||"

  \key d \minor
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
