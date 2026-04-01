{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  a'='4\(\p a8 b | c4 b8 a | b4\< e | a, \af 4\! g\) |
  c=''4\(\mf c8 d | e4 d8 c | d4 g | e=''2\) |

  \repeat volta 2 {
    f=''4(_\markup \dAlt f p e8 d | e4 c) | d4( c8 b | c4 a) |
    a='4 a'8\( f | e d c b | a2 | a='4\) r |
  }

  a='4\(\p a8 b | c4 b8 a | b4\< e | a, \af 4\! g\) |
  c=''4\(\mf c8 d | e4 d8 c | d4 g | e=''4\) r |

  \repeat volta 2 {
    f=''4(\mp e8 d | e4 c) | a'2( | e) | r4 a8\( f |
    e=''4\> g | \af 2\! a2 | a=''4\)\pp r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \meter 1/2 #'(1)
  a=4-\frBass f' | e2 | d | c4 r | c a' | g2 | f | c |
  <d=' a'>2 | <c a'>4 e | <f a>2 | e4 r | d2 | e4 e | a,2 | a=4 r |

  a=4 f' | e2 | e8( f e d | c4) r | c( a' | g2) | g8( a g f | <c g'>4) r |
  d'=''4 r | a2 | d4( c8 b | c4 a) | a4 r | e'8 d c b | a2 | a='4 r |
}
{{ end }}
