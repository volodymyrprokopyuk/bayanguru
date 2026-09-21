{{ define "rh1" }}
  {{ .a }} g8-. g'-. <c, e>4-> g8-. g'-. |
  <f='' a>8(->\> <e g>)-. <d f>-. <c e>-. \af 4\! <g d'>4-- g8-.\f g'-. |
  \rep 2 { <b,=' d>4-> g8-. g'=''-. } |
  <e='' g>8(->\> <d f>)-. <c e>-. <g d'>-. \af 4\! <e c'>4-- c'8(\mp b |
  <f=' a>8\< c' f a) \af 8.\! <c, a'>4-- c8( a |
  <e=' g>8\< c' e g) \af 8.\! <c, g'>4-- e,8( a |
  <d,=' g>8\< b' d g) <b, g'>-. <c a'>-. <d b'>-. \af 8\! <e c'>-. |
  <fis='' d'>8(-> <e c'>)-. <d b'>-. <c a'>-. \af 4\! <b g'>4-- g8(\p f |
  <e=' g>8\< c' e g) \af 8.\! <c, g'>4-- b8( a |
  <d,=' g>8\< b' d g) \af 4\! <b,=' g'>4-- %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key c \major
  \time 4/4
  \partial 4 { g'='8-.\f g'-. | }
  \repeat volta 2 {
    {{ template "rh1" (w `<c,='' e>4->`) }} <a=' fis'>8-.\f <b g'>-. |
    <c='' a'>8(-> <b g'>)-. <a fis'>-. <g e'>-. %
    <fis=' d'>8-. <e c'>-. <d b'>-. <c=' a'>-. |

    <b= g'>4-- <d b'>-- <b g'>-- fis'8(\p g | a4 d,2) <a' c>4( |
    <g=' b>4 g2) fis8( g | a4 d,2) <c' e>4( | <b d>2~ 8) r <c e>( <d fis> |
    <e='' g>4\< <d fis> <c e> <fis, c'> | <g b> \af 4.\! <b d>2) %
    \duo { <e'=' c'>8( b' | a4)\> d2( c4 | b2~ b8) \af 16.\! b=' \rest } %
    { s4 | g'='4 fis g a | g2~ g='8 s8 } <c e>8( <d fis> |
    <e='' g>4\< <d fis> <c e> <fis, c'> | <g b> \af 4.\! <b d>2) <e, c'>8( b' |
    <g=' a>4)\> <fis d'>2(-> <c fis>4 |
    \alternative {
      \volta 1 { \af 4.\! <b= g'>2.) g'8-.\f g'=''-. | }
      \volta 2 {
        \hSpace <b,,= g'>2. \sSlur ub #'((wb . 4.5)) ( d'8)\mf cis='' |
      }
    }
  }

  \duo { d''=''2. d8( cis | d=''2.)^\tRit } %
  { r8 d'='8( <a' c> <g bes> <fis a>4) s4 | r8 d( <g bes> <fis a> g='4) } %
  d,='8-.\p^\tATem d'-. | \rep 2 { <g,=' b>4-> d8-. d'=''-. } |
  <aes=' f'>8( <g ees'> <f d'> <ees c'> <d b'>4)-- g8-.\mf g'-. |
  \rep 2 { <c,='' ees>4-> g8-. g'=''-. } |
  <f='' aes>8( <ees g> <d f> <c ees> <b d>4)-- d16(_\dCre ees f fis |
  <b,=' g'>4)-> d16( ees f fis <b, g'>4)-> ees16( f fis g |
  <c,='' aes'>4)-> ees16( f fis g <c, aes'>4)-> a'16( b c d |
  ees='''8)->\f <ees, c'>-. <c a'>-. <a fis'>-. %
  <fis=' ees'>8-.\> <ees c'>-. <c a'>-. \af 8\! <a fis'>-. |
  <b= g'>8\< <g' g'>8^\tRit 8 8 8[ \af 8\! 8] g--\f g'=''-- |

  {{ template "rh1"  (w `<c,='' e>4->^\tATem`) }}
  f'=''8 e | d(-> c) b a g\> f e d |
  c='4-- <g e'>-- \af 4\! <e c'>4-- b''='8(\p c | d4 g,2) <d' f>4( |
  <c='' e>4 c2) b8( c | d4 g,2) <f' a>4( | <e g>2~ 8) r <f a>8(\< <g b> |
  <a='' c>4 <g b> <f a> <b, f'> | <c e> \af 8\! <e='' g>2) %
  \duo { <a'=' f'>8( e' d4) g2.~\> | g2~ \af 8\! g=''8 } %
  { s4 | c''=''4 b c d | e2~ e=''8 } r8 <f,=' a>8( <g b> |
  <a=' c>4\< <g b> <f a> <b, f'> | <c e>4 \af 2\! <e g>2) <a f'>8(\sp e' %
  <c='' d>4) <b g'>2-> <a, f'>8(\f e' | <c d>4) <b g'>2-> <a' f'>8(\p e' %
  <c='' d>4) <b g'>4->^\tRit <c a'>-> <d b'>-> |
  <e='' c'>4->  g,8-.\f^\tATem g'-. <c, e>4->\> e,8-. e'-. |
  <g,=' c>4-> c,8-. c'-. <e, g>4-> g,8-. \af 8\! g'-. |
  <c,=' e>4-> <e g c>\< <g c e> <c e g> | <e g c> r \af 4\! <g, c e> r |
  <e=' g c>4\f r r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  <c'=' g'>8(->-\frBass g)-. r4 <c g'>8(-> g)-. r4 |
  r8 a=8-. b-. c-. d(-> c)-. b-. a-. |
  \rep 2 { <g= d'>8(-> d=)-. r4 } | r8 g-. a-. b-. c( b a g) |
  <f= c'>2(~ 8 a c f) | <c, c'>2(~ 8 e g c) | <g b>2. d'4 |
  r8 d,=8-. e-. fis-. g( f e d) | <c c'>2(~ 8 e g c) |
  <g= b>2(~ 8 d' b g) | d2-> e4-- fis-- | g-- g,-- g'=-- r |

  d=8( a' fis a fis a) e( fis | g d' b d g, d') a( d |
  d,=8 d' c d a d) fis,( d' | g, g' fis e d) r r4 |
  r8 c='8( c e fis g a d, | g fis f e ees d) a( b |
  c='8 cis d4) e( fis | g) fis-- e-- d-- |
  c='8( c, d e fis g a d | g, d' g fis f e) a,( b |
  c='8 cis d4) d,~ <d a'> | \rep 2 { g=4-- d-- g,=,-- r | }
}
{{ end }}
