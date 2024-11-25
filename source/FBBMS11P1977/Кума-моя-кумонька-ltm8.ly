{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key d \minor
  \time 2/4
  d'='8(\p a' a a | g8. e16 f8 g | a a a4) |
  \duo {
    f''=''8\mf e d a | bes g c bes | a bes <f a> <e g> |
    d='8( d d f | g4 f8 f | a g f4) | f'8 e d c | c bes a d | e16 d cis8 d=''4 |

    a='8\mf d d a' | g a16 g f8 d | e f16 e d8 e | f a a c |
    bes=''8 c16 bes a8 f | <d g> <e a> <c f> <des g> |
    a'=''8 d, e fis | g a16 g d8 e | f d e a, | <bes d>8 8 8 <d f> |
    g=''8 c16 bes a g f8 | e16\>^\tRit d cis8 \af 4\! d=''4 \fermata \bar "|."
  } {
    a'='4 f | d~ d8 e | f d cis4 | b a | gis a | <bes e> a | a'2 | e4 f8 a | g4 f=' |

    a='4 a8 c | bes4 a | g bes8 g | a c c ees | d4 c8 a | bes4 a8 bes |
    c=''8 c bes a | g4 bes | a g | f~ f8 bes | <bes d> d cis c | gis g f='4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \rep 3 { R2 | } | d=8(-\frBass a' a a | g8. e16 f8 g | a a a4) |
  g=8 f e d | b4 c | cis d | d8( d d f | g4 f8 f | a a <d,= a'>4) |

  d=8-\stBass dm! f, d@m! | g8 gm! a d@m! | c4 bes8 a |
  d=8 dm! f, fis | g gm! c f@M! | c4 f8 ees | d d7! c d@M! |
  bes=,8 g@m! g8 gm! | a d@m! a8 a7! | bes a g f | e g@m! f8 d@m! |
  bes=,8 a=, d+dm!4 \fermata |
}
{{ end }}
