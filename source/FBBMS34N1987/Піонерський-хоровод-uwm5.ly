{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 4/4
  a=8\p d e f e_\dCre d bes4~ | bes8 c d e d c c4 |
  c='8 f g a g d d4~ | d8_\dDim f e d c2 | fis8_\dCre g a c bes d g, f |
  e='8 f g bes a c f, ees~ | ees d bes' a a g d f |
  f='8 e d e f4~_\dCre f16 g a bes=' |

  c=''16 a f'8 e16 f d8 \duo { <d''='' f>4 <bes=' d>8 8 | } { g'='2 | }
  bes='16 g e'8 d16 e d c \duo { <a'=' d>4 <a=' c>8 8 | } { f'='2 | }
  a='16 bes c8 \duo { <c''='' ees>8( <bes d>) 8[( <a c>]) <g c>( <g=' bes>) | }
  { fis'='4 f d=' | } d,16 c <g' bes>8 %
  \duo { <bes'=' d>8( <a=' c>) <f=' f'>4 } { e'='4 r8 <a=' c> } %
  d='16\< e g \af 16\! a=' |

  a='8\mf d e f %
  \duo {
    e''=''8( d) bes4~ | bes8 c d[ e] d( c) c4~ | c8 <c ees> <bes d> <a c> %
    <g=' c>8[( <g bes>]) d( g) | f e a g g[( f]) a( bes=') |
  } { c''=''4 g8( f) | e4 bes' a a8( g) | fis2 d4 bes | bes2 a4 f'8 g=' | }

  c=''16 a f8~ f16 c' bes a bes d g,8~ g16 a g f |
  e='16 f g8~ g16 a g e g f f e f g a bes |
  c=''16 a f ees' d c bes a bes d g, a bes d g, f |
  e='16^\tRit d c bes' a g bes e, g f f e <a,= f'>4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=4-\stBass dm! g, gm! | c c7! f, fM! | a f@M! bes4 g@m! |
  c=4 c7! f( ees | d) d7! g, gm! | c c7! f, fM! | d' d7! g, gm! |
  c=4 c7! f,=, fM! |

  a=,4 f@M! bes4 besM! | c c7! f, fM! | fis d@7! g4 gm! |
  c=4 c7! f,=, a@7! |

  \meter 1/4 1,1,1,1
  d'=8 dm!4 dm8 g, gm! d' g@m! | c8 c7!4 c78 f fM! f( ees |
  d=8) d7!4 d78 g, gm! d' g@m! | c8 c7! g c@7! f8 fM! c'= c7! |

  f,=,8 fM! c' f@M! d8 g@m! bes8 g@m! | c8 c7! e c@7! f,8 fM! c' f@M! |
  f,=,8 fM! fis d@7! g8 gm! d' g@m! | c8 c7! e c@7! f=8 fM! f@M!4 |
}
{{ end }}
