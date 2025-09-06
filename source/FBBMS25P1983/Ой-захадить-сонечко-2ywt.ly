{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key d \minor
  \time 2/4
  d''=''8(\mp a' g f | g f e d) | c( bes16 c a8 g | \af 2\! a2)\>^\tRit |
  d,='8(\mf^\tATem a' g f | g\> f e \af 8\! d) |
  \duo {
    g'='8(\< a bes \af 8\! d | c4. bes8 | a8\> \af 4\!g4)^\tRit b8 \rest |
    <e,=' c' e>4.(\f^\tATem <d bes' d>8 | <a' c> <g bes> a <a e'> |
    \af 2\! <d,=' d'>2)\> | <g bes>8(\< <bes d> <a c> \af 8\! <g=' bes>) |
  } { d'='2 | e~ | e4. s8 | s2 | c4 f8 e | bes'4( a) | d,8 f e d=' | }
  <c=' f a>4 <e g e'> | <d=' f d'>2 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  \rep 3 { R2 | } | r8 g'='8[(-\frBass f e] | d2)~ | d='4 \clef bass c='8( bes~ |
  bes=8) a( g bes | c a bes d) | c8.( d16 c8 bes) | a( e g f) |
  e=16( d c bes a8 c) | d( e f4) | g c, | f8 g, a a | d=2 \fermata |
}
{{ end }}
