{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 3/4
  \meter 1/4 1,1,1
  d'='8(\mp a' a g f d) | d( a' a g f d) | \rep 2 { e='8( e f e d='4) | }
  f='8(\mf e d cis d a) | a'( g f e d f) | g( bes a g f a=') |
  \duo {
    f''=''8( e d cis d4) | a8(\f f' f e d a) | d,( a' a g f d) |
    e='8( e f^\tRit e d4) \fermata | e8(\>^\tATem g f e^\tRit \af 4\! d='4)\p \bar "|."
  } {
    bes'='4 a8 g f4 | a2 f4 | d2 c4 | bes b c \fermata | b cis d='4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \meter 1/4 1,1,1
  d'='2.-\frBass | c | bes2( a4) | g2( f8 e) | \rep 2 { d=8( a'4 g8 f d=) | }
  e=4( f8 e d4) | g( f8 e d4) | d'8 a d cis d a | c f, c' bes a f |
  g=4 gis a \fermata | g a, <d= f> \bar "|."
}
{{ end }}
