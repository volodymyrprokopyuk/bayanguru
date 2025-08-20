{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  R2\mf | f''=''8\< a c a | g16 a g f e8 \af 8\! c |
  f=''8 a c a | g4\> \af 4\! a | d,8 d a' f |
  e=''16 f e d cis8 a | d16 e f g a8 cis, |
  \duo { d''=''2 | } { r8 <d'=' e bes'>16 16 <d=' f a>4 | }

  f,='8(--\mp\< a-- c-- a-- | g16 a g f e8 \af 8\! c) |
  f='8( a c a | g4\> a16 g f \af 16\! e) |
  d='8(\< d a' f | e16 f e d cis8 \af 8\! a) |
  d='16 e f g a8 cis, | d16\> <f a> a, <f' a> d <f a> a, \af 16\! <f'=' a> |
  \duo { r8\p <e'=' g>8( <f=' a>4) \fermata \bar "|." } { d'='2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  f'='16-\frBass <a, c> d_\aSta <a c> \rep 3 { f'='16 <a, c> d <a= c> } |
  f'='16 <bes, d> f' <bes, d> c <bes e> c <bes e> |
  f'='16 <a, c> d <a c> f' <a, c> d <a c> |
  f'='16 <bes, d> e <bes d> e <a, cis> g <a cis> |
  d='16 <f, a> bes <f a> d' <f, a> bes <f a> |
  g=16 <bes d> gis <bes d> %
  \duo {
    r16 <cis'=' g'>16 16 16 | r <a d>[ r <bes d>] g8 <a= cis> \clef bass |
    r8 <g bes>16 16 <f= a>4 \clef treble |
  } { a=4 | f g8 f16 e | e=2 | }

  f'='8.( e16 ees4 | d c16 bes a g) | a-. c-. f-. e-. ees-. d-. ees-. c-. |
  bes=16-. d-. e-. d-. cis8-- a-- | bes16-. c-. bes-. <a c>-. %
  \duo { b=4 | bes a8 e' | r8 bes~ bes a= \clef bass | }
  { g=4~ | g g | <f d'> <g= e'> | }
  \rep 2 { <f= d'>16 <a d> <f d'> <bes= d> } |
  <f= d'>8 <d_( b'> <d=) bes'>4 \fermata |
}
{{ end }}
