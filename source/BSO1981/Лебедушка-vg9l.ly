{{ define "rh1" }}
  \duo { a'='8( a16 b c b a e'='') } { <c'=' e>4 r | }
  {{ .a }} c' <dis, a' b> a'=') |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8( g') | <cis, e a>( bes') <cis, e a>( g'='') |
{{ end }}

{{ define "rh3" }}
  \duo { {{ .a }} f e d='' | } { <b'=' d>4 <g=' bes> | }
  <cis,,=' g' a>4 <e=' g cis> |
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
  <e,=' a c>8( b'16 c a b c d) | <gis, b e>8( f' e d) |
  {{ template "rh1" (w `<d,=' a' d>8(`) }} e='4 <dis fis>8 <d gis> |
  {{ template "rh1" (w `<d=' a' d>8(`) }} <gis,= d' e>4 <b d gis> |
  <c=' e a>2 \bar "||"

  \key d \minor
  {{ template "rh2" (w `<a'=' d f>4`) }} | <aes,=' bes d>4. e'8 |
  {{ template "rh2" (w `<a,=' d f>4`) }} | <f,=' a d>4 <a d f>8( a') |
  {{ template "rh3" (w `g''=''8`) }} | <f=' a d>4 <a d f>8 a' |
  {{ template "rh3" (w `g''=''8^\tRit`) }} | <f=' a d>4 \fermata r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=4-\stBass dm! | a a7! | bes besM! | d dm! |
  a=,4 a7! | \rep 2 { d=4 dm! | g, gm! | a=, a7! | } d= dm! |

  \key a \minor
  a=,4 am! | e' e7! | f, fM! | a am! | e' e7! | a, am! |
  f=,4 fis | gis e' | a, am! | f fis | e'= e7! | a+am!2 |

  \key d \minor
  d=4 dm! | a a7! | bes bes7! | d dm! |
  \rep 2 { a=,4 a7! | d dm! | g,=, gm! | }
  a=,4 a | d= \fermata r |
}
{{ end }}
