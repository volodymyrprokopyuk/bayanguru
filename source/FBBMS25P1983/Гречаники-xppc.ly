{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  c''=''8\p d16( c bes a bes g) | f8 a c,4 | f8 f g g | a f d'4 |
  c=''8 c bes16( a bes g) | f8 a c, c | f a g16( a bes g) | f8 f f f=' |

  \tempo Allegretto
  d'=''4\mp d8 d | d e f d | c4 c8 c | c4 f | bes,8 bes bes bes |
  bes='8 c d bes | a a g g | f4->\> \af 4\! f-> | bes g8 a | bes2 |
  a='4 f8 g | a2 | g8 d e fis | g2 | f8 c e c |
  f='4->\< <a f'>8-> e'16( \af 16\! d='') |

  \tempo Andante
  \duo {
    c''=''8\mf d16( c bes a bes g) | f8 a c,4 | f8 f g g |
    a='8 f d' d | c c bes16( a bes g) | f8 a c, c | f a g16( a bes g) |
    f='8\> f f'16( g f \af 16\! ees) | d2\mp^\tAcc d8 e f d |
    c=''2 | c4 f | bes,2 | bes8 c d bes | a4\< bes16( a) g8 | f4 \af 4\! f=' |
  } {
    f'='4 e8 d | c4 c | a c16( d) e8 | f ees <d f>4 |f f8 e | c4 c8 c |
    c='4 e | s4 a | bes8 f g a | bes2 | a4 f8 g | a2 | g8 d e fis | g2 |
    f='8 c e4 | c ees=' |
  }

  <d,=' f bes>4\f 8 <f a c> | <f bes d>8 <g bes e> <bes d f> <f bes d> |
  <f=' a c>4 <c f a>8 <d f bes> | <f a c>4 <a c f> |
  <d,=' g bes>8 8 <bes d g> <c fis a> | <d g bes> <f a c> <e bes' d> <d g bes> |
  <c=' f a>8 8 <bes e g>8 8 | <a c f> r <f'=' a c f>4->\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  \rep 8 { R2 | }
  bes'='4 g8 a | bes2 | a4 f8 g | a2 | g8 d e fis | g2 | f8 c e c |
  a=8 bes d ees | d4 d8 d | d e f d | c4 c8 c | c4 f | bes,8 bes bes bes |
  bes=8 c d bes | a a g g | f-> c'-> f='-> r |

  R2 \clef bass | c='8 d16( c bes a bes g) | f8 a c,4 | f8 f g g |
  a=8 f d' d | c c bes16( a bes g) | f4 c8 d16( e) | f8 a f c'=' |

  \rep 3 { f,=8 f' f, f'=' | } | f, f' ees, ees' | d, d' cis c |
  bes=8 a g e | c a' c, bes' | a f g a= |

  bes=8 c bes a | bes a g f | a bes a g | f e d c | d g bes a |
  g=8 f e g | a f g c, | f-> c-> f,=,4-> |
}
{{ end }}
