{{ define "rightHand" }}
\relative {
  \tempo "Non troppo adagio. Cantabile"
  \clef treble
  \key bes \major
  \time 4/4
  \duo {
    a'='8(\mf bes c d16 c bes a g8 f8. bes16) |
    a='16( f bes d c ees d c bes a g8 f g) |
    d='16( ees f8 f bes c16 a bes g f8. g16) |
    d='16( ees f8 f bes c16 a bes g f) c f g |
    a='16( bes c8~ c) f16( ees d4) c16( d c bes) |
    f='16( g a8~ a) d16( c bes4) a16( bes a g) |
    d='16( ees f8 <d f> <e bes'>) a16( bes a f <d d'>4) |
    d='16( e f8 <g, c f> <c fis d'>) c'( c16 bes <f a f'>4) |
    d'=''16( e f8 f g16 f e d c8 d8. c16) |
    g='16( a bes8 bes c16 bes a g f8 <b, g'>4) |
    d='16( ees f8 f bes c16 a bes g f8. g16) |
    d='16( e f8 f bes c16^\tRit a bes g <a,= f'>4) \bar "|."
  } {
    a'='8( g f2~ f8.) r16 | r8 g( c bes16 a g8[ ees] f) r |
    r4 d='4( ees f8.) r16 | r4 f8( f ees4 f16) r8. |
    r8 a='16 g f4 bes16 a g f~ f8 d16 e | r8 f16 e d4 g16 f e d f8 e |
    s2 f='8 e s4 | bes8 <a d> s4 <bes f'>8 <bes e> s4 |
    s4 d'=''4 c fis, | s4 g f s4 |
    bes,=4 bes <bes e> <a d> | <gis d'> <aes d> <bes= e> s4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  r4 a=8(-\frBass bes c d16 c bes a g8 | f8. bes16) a( f bes d c ees d c bes a g8 |
  f=4) g16( a bes8~ bes c~ c16 a bes g | f8. g16) d'16( c d bes c8[ c,] f) r |
  r4 ees'='16( d c8 d[ bes] a g) | r4 f16( e f fis g8[ gis] a c) |
  r4 bes=8( g a4) bes16( c bes a) | g8[( f] ees d) des( c <f,=, c'>4) |
  r4 \clef treble <bes'= f'>4 <c g'> <d=' fis> |
  r4 \clef bass <ees,= bes'> <f c'> <g d'> |
  <bes,=, f'>4 <g d'> <c e> d8 c | <b e>4 <bes f'> <c e> <f,=, f'> |
}
{{ end }}
