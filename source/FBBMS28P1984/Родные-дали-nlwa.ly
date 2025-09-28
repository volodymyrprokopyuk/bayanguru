{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key d \minor
  \time 4/4
  d'='4(\mp\< e f e8 \af 8\! f | g4\> d8 e f4 \af 4\! e) |
  d='4(\< f a g8 \af 8\! a | bes4 c8 bes a='2) |
  \duo {
    f''=''4(\mf\> e8 d c4 \af 4\! bes) | e(\> d8 c bes4 \af 4\! a) |
    bes='4( c8 d a4 d8 f | e4\< d8 e \af 2\! a,2) |
    <f'='' a>4(\f <e g>8 <d f> <c e>4 d8 <d f>) |
    <e='' g>4(\> a8 g g4 \af 4\! f) \barFermata | e=''4(\mp  d8 bes a4 d8 a |
    g='4\> <f a>8^\tRit <e g> \af 2\! <d=' d'>2) \fermata \bar "|."
  } {
    a'='2. g4 | g2. f4 | g a8 bes f4 f8 a | gis2 a |
    a='2 g4. bes8 | c4 c8 bes bes4 a | g bes8 g f2 | e8 d cis4 d='2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  R1 | R1 | d'='2(-\frBass c) | g( f4 e) | d( f g2) | c,4( e f2) |
  g=2( a | b a8 g f e) | d( e4 f8 g a bes d) | c( bes a g f2) |
  g=2( a) | <a, a'>2( d=) \fermata |
}
{{ end }}
