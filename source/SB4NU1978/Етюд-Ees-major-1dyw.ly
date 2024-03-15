{{ define "rightHand" }}
\relative {
  \tempo "Allegro brillante"
  \clef treble
  \key ees \major
  \time 4/4
  \repeat volta 2 {
    d'='16(\f\< f aes bes d f aes bes a bes c bes cis bes d \af 16\! bes) |
    f'='''16(\> ees a, bes) c( bes fis g) aes( g d ees) f( ees a, \af 16\! bes) |
    b='16(\< c g bes c e g bes b c des c d c e \af 16\! c) |
    g'='''16(\> f b, c) des( c b c) b( aes e f) g( f b, \af 16\! c) |
    bes='16( d f aes bes d f aes f d b aes f d b aes) |
    g='16( a bes b c\< d f ees) c( d ees e f b bes aes) |
    g=''16( aes a bes c d f \af 16\! ees) d(\f aes' f d bes a f d) |
    ees=''16( g ees bes g ees' bes g ees bes g ees=) r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
}
{{ end }}
