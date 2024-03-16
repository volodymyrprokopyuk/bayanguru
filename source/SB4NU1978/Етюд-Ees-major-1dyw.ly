{{ define "rh1" }}
  {{ .a }} bes=16( ees bes) r bes( des bes) r bes( ges' bes,=) %
{{ end }}

{{ define "lh1" }}
  ees,=,8 r eesM! r g r ees@M! r8 |
  c=8 r cM!4 r c7!8 r | f, r fm! r aes r f@m! r8 |
  bes=,8 r besM! r b r g@7! r8 | c r cm! r aes r f@m! r8 |
  bes=,8 r ees@M! r8 bes=, r bes7! r |
{{ end }}

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
    g'='''16(\> f b, c) des( c g aes) b( aes e f) g( f b, \af 16\! c) |
    bes='16( d f aes bes d f aes f d b aes f d b aes) |
    g='16( a bes b c\< d f ees) c( d ees e f g bes aes) |
    g=''16( aes a bes c d f \af 16\! ees) d(\f aes' f d bes a f d) |
    ees=''16( g ees bes g ees' bes g ees bes g ees=) r4 |
  }

  r16 b=,16(\f\< d f g b d f g b d f fis g a \af 16\! b) |
  c='''16(\> g g' ees c g ees c) g( g' ees c g ees c \af 16\! g) |
  r16 a=16(\< c, ees f a c ees f a c ees e f g \af 16\! a) |
  bes=''16(\> f f' des bes f des bes) f( f' des bes f des bes \af 16\! f=) |

  {{ template "rh1" (w `r16\p`) }} r bes( aes' bes,) |
  {{ template "rh1" (w `r16`) }} r c( ges' c,) |
  r16 c='16(_\dCre f c) r bes( f' bes,) r bes( ees bes) r a( ees' a,) |
  r16 f=16( bes des) r f,( aes des) r f,( aes c) r f,( aes ces=') |

  r16\f f,=16(\< aes bes d f aes bes d f aes a bes b c \af 16\! d) |
  f='''16(\> ees a, bes) c( bes fis g) aes( g d ees) f( ees a, \af 16\! bes) |
  b='16(\< c g bes c e g bes bes c des c d c e \af 16\! c) |
  g'='''16(\> f b, c) des( c g aes) bes( aes e f) g( f b, \af 16\! c) |
  bes='16( d f aes bes d f aes f d b aes f d b aes) |
  g='16( a bes b c\< d f ees) d( d ees e f g bes aes) |
  g=''16( aes a bes c d f \af 16\! ees) d(\f\> aes' f d bes a f \af 16\! d='') |

  ees=''8-.\p \ottava #1 bes''='''16(_\aLAssai aes) aes( g) g( f=''') \ottava #0 %
  f='''16( ees) ees( d) d( c) c( b) |
  c='''16( bes) bes( aes) aes( g) g( f) f( ees) ees( d) d( bes') bes( d,) |
  ees=''8-.\mf bes'16( aes) aes( g) g( f) f( ees) ees( d) d( c) c( b) |
  c=''16( bes) bes( aes) aes( g) g( f) f( ees) ees( d) d( bes') bes( d,) |
  ees='16(\f bes') bes( ees,) d( bes') bes( d,) %
  ees='16( bes') bes( ees,) d( bes') bes( d,) |
  ees='16(_\aPes bes') bes( ees,) d( b') b( d,) d( c') c( d,) d( ces') ces( d,=') |

  <d=' aes' bes>4 aes16 bes, d f aes d, f aes bes d f aes |
  bes='16( d f aes bes d f aes bes8) r <f,,=' aes d>4(\ff |
  <g=' ees'>8) r <bes d f>-> r <bes ees g>-> r <f' aes bes d>-> r |
  <ees='' g bes ees>4\sf r r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  bes,=,8-\stBass r besM!4 r4 bes7!8 r |
  {{ template "lh1" }} | ees, r eesM! r r4 ees=,4 |

  g=,8 r r4 r g7!8 r | c r cm! r r2 | f,8 r r4 r f7!8 r | bes=, r besm! r r2 |

  ges=,4( f ees f) | ges( f ees aes)-> | des( ges, c, f)-> |
  bes=,8 r b r c r des= r |

  \meter 1/8 1,1,1,1,1,1,1,1
  d=8 r r4 bes8 r bes7! r | {{ template "lh1" }}

  \rep 2 {
    ees,=,8 eesM!-> r eesM g g7!-> r g7 |
    aes=,8 f@m!-> r8 fm bes=, bes7!-> r bes7 |
  }
  \rep 3 { r8 ees+eesM! r8 bes+bes7! } r8 bes+bes7 r8 bes+bes7 | R1 |
  r2 r4 bes=,4( | ees,8) r bes'-> r ees,-> r bes'-> r | ees,=,4 r r2 |
}
{{ end }}
