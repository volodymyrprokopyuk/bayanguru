{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key e \minor
  \time 2/4
  \meter 1/2 #'(1)
  b'='8(\p b g g | a4 g8 fis | e4 g) | b8( b b d | c4 b8 a | e4 b') |
  fis='8( fis fis e | b4 b'8 a | e4 g) | fis8( fis fis e | b4 b'8 a | e='2) |

  \duo {
    b'='4( g | a g8 fis | e fis g a) | b4.( d8 | c4 b | e,8 fis g b) |
    a='8( g fis e | b'2 | e,4 g) | fis8( g fis e | b[ <g' b>] <fis a> b, |
    \af 2\! e='2)\> |
  } {
    g'='8 fis e d | e4 e8 dis | e4 dis | g8( fis e4) | a8[ fis] g fis |
    e='8 c b4 | e2 | dis8 b g'[ fis] | s4 c | c='2 | s2 | s2 |
  }

  b'='8(\mp b g g | a4 g8 fis | e fis g a) | b( b b d | c4 b8 a |
  g='8 fis e b') | a( g fis e | dis4 b'8 a | g4 g) | fis8( g fis e |
  b=8[ b'] a[^\tRit fis] | e4) <e=' g b e>->\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  \meter 1/2 #'(1)
  e'='2~-\frBass | e~ | e | g4( g8 e | a e g fis | e b e g,=) \clef bass |
  a=4( ais | b8 a g fis | g fis e d) | c4 a' | g8( cis, dis4) |
  e=8( b) <e,=, e'>4-> |

  e'=4 d | c b | e, fis | g gis | a b | e8( dis d4) | cis4 c | b dis |
  c=4 e | a, ais | b8( cis dis4) | e8( b' e='4) \clef treble |

  g='8( fis e d | c4) b8( a | g b e fis) | g( e gis e | a e g fis |
  e='8 b g4) | cis4( c | b) g'8( fis | e4 d=') \clef bass |
  c='4( ais) | \duo { b=2 | } { r4 dis=4 | } <e= b'>2 |
}
{{ end }}
