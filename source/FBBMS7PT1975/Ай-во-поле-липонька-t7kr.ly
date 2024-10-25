{{ define "rightHand" }}
\relative {
  \tempo "Non troppo adagio. Cantabile"
  \clef treble
  \key bes \major
  \time 4/4
  \duo {
    a'='8(\mf bes c d16 c bes a g8 f8. bes16) |
    a='16( f bes d c ees d c bes a g8 f g) |
    d='16( ees f8 f bes c16 a bes g f8. g16 |
    d='16 ees f8 f bes c16 a bes g f) c f g |
    a='16( bes c8~ c) f16( ees d4) c16( d c bes) |
    f='16( g a8~ a) d16( c bes4) a16( bes a g) |
    d='16( ees f8 <d f> <e bes'>) a16( bes a f <d d'>4) |
    d='16( e f8 <g, c f> <c fis d'>) c'( c16 bes <f a f'>4) |
    d'=''16( e f8 f g16 f e d c8 d8. c16) |
    g='16( a bes8 bes c16 bes a g f8 <b, g'>4) |
    d='16( ees f8 f bes c16 a bes g f8. g16) |
    d='16( e f8 f bes c16^\tRit a bes g <a,= f>4) \bar "|."
  } {
    a'='8( g f2~ f8.) r16 | r8 g( c bes16 a g8 ees f) r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
}
{{ end }}
