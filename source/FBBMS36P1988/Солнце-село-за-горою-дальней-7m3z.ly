{{ define "rightHand" }}
\relative {
  \tempo Cantabile
  \clef treble
  \key d \minor
  \time 2/4
  d'='8(\p d d e | f4 d) | g( d8 e | f e d4) |
  f='8(\mf f f g | a4 f) | bes( a8 g | a='2) |

  \duo {
    d''=''4( d | d c | g d'8 d | c4 bes) |
    a='4( f8 g | a4 g | f'2~\< | \af 2\! f='') |
  } { fis'='2 | e | e | f | d | e | d~ | d=' | }

  d,='8(\mf e f g | <c, a'>4 f8 a | <b, g'>4 d8 e | <a, f'> e' d4) |
  f='8( e f g | <c, a'>4 f | <d bes'> a'8 g | <f=' a>2) |

  \duo {
    d''=''8( ees d c | d bes a g) | e( d' c bes | c a g f) |
    d='8( e f g | a bes a g | d'2~^\tRit | \af 2\! d=''2)\> \bar "|."
  } { fis'='2 | f | e | ees | d | cis | d8( f e g | f='2) | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  \rep 4 { R2 | } | d'='8(-\frBass d d e | f4 d) |
  g='4( d8 e | f e d='4) \clef bass | c='4 a | bes g |
  c,=2 | a | bes | c | d4( g | f e=) |

  d=4_\aSta a' | d, a' | d, g | d f | c f | c a' |
  <c,= g'>4 <c e> | <c= f>2 |

  d=4-\stBass d7! | g, gm! | c c7! | f, fM! | bes g@m! |
  a=,4 a7! | d= g@m! | d+dm!2 |
}
{{ end }}
