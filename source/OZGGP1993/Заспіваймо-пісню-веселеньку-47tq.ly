{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  \meter 1/2 #'(1)
  d'='4\mf f | g8 f e d | <cis g' a>2 | R2 |
  a=4 <f a d> | <a d f>4. d8 | <bes e> g' <cis, f> e | d4 a |
  <a= f'>4 d | <bes g'>8( f') e( d) | cis( d) e( cis) | a4 a |
  f'='4 f | <f a>4. f8 | g4 c8( bes) | <f a>4 g |
  <d=' f>4._\dCre f8 | <d g> f e d | <cis a'>2^\tRit | <e=' bes' c> \fermata |

  <f=' a c>4\f^\tATem 4 | <bes d> <a c>4 | 8 <g bes>4 8 | 8 8 4 |
  <g=' bes>4 4 | <e a c> <e g bes> | <g bes>8 <f a>4 8 | 8 8 4 |
  \repeat volta 2 {
    <f=' a>4 4 | <g bes> <f a>4 | 8 <e g>4 8 | 8 8 4 |
    <e=' g>4 <e bes'> | <cis a'> cis | e8 d4 d8 | d d d='4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \meter 1/2 #'(1)
  <d= f a>4-\frBass r | <d g bes> r | a'-. e-. | a, r |
  \rep 4 { d,=,8 a'4 a=,8 | } | <d, d'> a'4 a8 | g d'4 d8 |
  \rep 2 { a=,8 <e' g>4 8 | } \rep 2 { f=8 <a c> c, <a'= c> | }
  g=8 <bes c>4 8 | f <a c> e <a c> | d, <f a> c <f a> |
  bes,=,8 g' e g | a, a' e a | c, g' bes=4 \fermata |

  f=8 <a c> c, <a' c> | fis <c' d> d, <c' d> |
  \rep 3 { g=8 <bes d> d, <bes'= d> | } | c, bes' g bes |
  \rep 2 { f=8 <a c> c, <a'= c> | } \rep 2 { d,=8 <f a> a, <f'= a> | }
  \rep 2 { g,=,8 bes' d, bes'= | } | e, <bes' d>4 8 |
  a,=,8 g'4 g8 | d <f a> a, <f' a> | d <f= a>8 4 |
}
{{ end }}
