{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key e \minor
  \time 4/4
  e'='4(\p g8 fis e4 b' | a g fis e8 fis) |
  g='4( b8 a g4 d' | c d8 c b)\< b( c \af 8\! d |
  e=''4\mp d8 e c4 c8 e) | d4( c8 d16 c \af 2\! b2)\> |
  a='8(\< g fis \af 16.\! e g4\> fis8 \af 8\! e=') |
  \duo {
    fis'='4( e8 fis \af 2\! b2)\< |
    e=''8(\mf fis e d16 e c4\< c8 \af 8\! e) |
    d=''4(\f e8 fis16 e d4 b) \barFermata | a8( g fis e b'2) |
    a='8(^\tRit c b4 \af 4.\! \af 4.\p e=''2)\> \fermata \bar "|."
  } {
    fis'='4 e dis2 | <e gis> <e a> | <d a'>4 <fis a> g8 a g fis |
    e='4. e8~ <e g>2 | <e a>4 <dis a'> <e=' g>2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R1 | R1 | r2 r4 b'='4-\frBass | a2 g | gis( a4 g) |
  fis='8( e4 fis8 g fis e d=') \clef bass |
  c='2 b | a8 c b a g4 fis | e8 d' c b a b a g |
  fis=8 a d c b4 d | c2~ c8 b a g | fis4 g8 fis e=2 \fermata |
}
{{ end }}
