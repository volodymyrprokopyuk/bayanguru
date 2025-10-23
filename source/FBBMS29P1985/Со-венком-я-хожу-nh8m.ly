{{ define "rightHand" }}
\relative {
  \tempo "Allegro"
  \clef treble
  \key d \major
  \time 2/4
  a'='4(\mp d | b8 g d' b) | a( g fis e | d4 d') |
  b='8( g d' b | a4) a8\( a | b a g fis | e e a a | fis='4\) %
  \duo {
    a'='8( c | b a g fis | e\> e a \af 8\! a | \af 2\! d,='2)\< |

    a'='4(\mf d | b d8 b) | a2( | a4 d) | b8( g d' b | a4) fis8( fis |
    e='8_\dCre fis g gis | a b a g | fis4) a8( c | b a g fis |
    e='4)^\tRit a8 a=' |
  } {
    d'='8 e | dis2 | e8 e cis='4 | s2 |

    fis='2 | g | a8 g fis e | fis4 d | d e8 g | a4 d,~ | d2 |
    cis='2 | d4 a' | g8 fis e d | cis b cis='4 |
  } \af 2\! d='2\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  r4 a=4(-\frBass | d b8 g | d'8 b) a( g | fis e d4 | d') b8( g |
  d'='8 b a4) | a8( a b a | g fis e e | a a fis4) |
  a=8( c b a | g fis e a, | d) e-- fis-- g=-- |

  r8 a=8( fis d) | r b'( a g) | r a( b cis) | r d( cis c) |
  r8 b=8( g e | fis4) a8\( a | b a g f | e e a a | d, a\) d( dis |
  e=8 fis g gis | a4) a,8 a | d=2 \fermata |
}
{{ end }}
