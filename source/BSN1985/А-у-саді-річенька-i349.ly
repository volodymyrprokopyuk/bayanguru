{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  g'='8.(\mp\< a16 bes8 \af 8\! g | a8.\> d,16 \af 4\! g4) |
  \duo { g'='8.(\< a16 bes8 \af 8\! g | a8.\> d,16 \af 4\! g='4) | }
  { ees'='4 e | fis8. d16 bes=4 | }
  bes='8.\(\mf\< c16 d8 ees | <bes d> d c \af 8\! a |
  <g=' bes>8 bes a16 g a8 | g4\> g8 \af 8\! <ees a>\) |
  <d=' bes'>8.\(\< <ees c'>16 <f d'>8 <g ees'> |
  <f=' d'>8 8 <ees c'> \af 8\! <c a'> |
  <d=' bes'>8 8 \duo { a'='16 g a='8 | } { c'='4 | }
  <bes= g'>4\> \af 4\! <bes= d g>\) |

  \tempo "Con moto"
  g'='16(\< cis, d a' bes d, fis \af 16\! g |
  a='16\> c, cis d g bes, ees \af 16\! d) |
  bes=16(\< d g a bes d g \af 16\! bes |
  a=''16\> d, bes a g' d bes \af 16\! g) |
  bes='16(\< a bes c d c d ees | f bes, d \af 32.\! f c d c a) |
  bes='16( d,)-. c'-. bes a( c,)-. bes'-. a-. |
  g='16( bes,)-. a'-. g-. a( bes)-. c-. f,-. |
  bes='16( c)-. d-. f-. bes,( d)-. ees-. g-. |
  d=''16( d')-. a-. bes-. c( a f c) | bes( bes')-. fis-. g-. a( fis d a) |
  \duo { g''=''4~\>^\tRit \af 4\! g='' \fermata | }
  { g''=''16( c,)-. bes-. a-. g='4 \fermata | }

  \tempo "Andante espressivo"
  \duo {
    \rep 2 { g'='8.(\f a16 bes8 g | a8.\> d,16 \af 4\! g='4) | }
    bes='8.(\< c16 d8 ees | d \af 16.\! d c a | bes bes a a |
    \af 8.\! g='4\> g8\< \af 8\! a=') |
  } {
    bes=8 d~ d des | c16 a ees' d~ d8 bes |
    ees='4 e | fis16 c bes a bes g c ees |
    bes'='16 d, f ees d' f, bes ees, | bes' c g f a g f ees |
    a='16 g f ees g e fis d | bes d c ees d bes f' c=' |
  }
  \duo {
    <d'=' f bes>8.\(\f\< <ees f c'>16 <f bes d>8 <g bes ees> |
    <f=' bes d>8 8 <ees g c> \af 8\! <ees g a> |
    <g=' bes>4^\tRit a16\> g a~ <a d~> |
    <g='~ d'>8 g_~ \stemDown \af 4\! <g=' d' g>4\) \fermata \bar "|."
  } { s2 | s2 | d'='8 cis~ cis c | bes g'=' s4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
