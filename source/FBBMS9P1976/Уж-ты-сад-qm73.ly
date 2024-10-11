{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 3/4
  \partial 4 { d'='8\(\p d | }
  g='4. a8 b d | a4. g16 fis e8 d | g4. a8 b d | a2\) a8\( a |
  d=''4. e8 d c | g2 d'8 b | a c b a e4 | d='2\) r4\mf |

  \duo {
    b'='8 \rest\p b='8( g fis g4) | b8 \rest a( fis e fis4) |
    b='8 \rest d=''8( e4 d) | b8 \rest c( d4 c) |
    b='8 \rest b8 a4 b8 a | b4( e) b8( b |
    c=''8 e d[ c] e4 | a,) a \rest d,8\(\p d |
    g='4.\pp a8 b d | a4. g16 fis e8 d |
    g='4. a8 b d | a2\) a8\( a | d4. e8 d c | g2 d'8 b |
    a='8 c b[ a] e4 | d='2\) %
  } {
    s8 d'='8 e4 d | s8 c d4 c | s8 b' g fis g4 | s8 a fis e fis4 |
    s8 g='8 fis4 g8 fis | e fis g4 g | a fis g | fis s2 |
    d='2 g4 | c,2 c4 | d2 g4 | d2 e4 | b'4. c8 b a | g2 g4 | a fis e | c='2 %
  }
  d'=''8(\f  b | a c b a e'4 | d=''2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 4 { r4 | }
  r4 <e= g>4-\frBass <d fis> | \duo { a=4 e4. fis=8 | } { c=2. | }
  <b=, g'>4 <b' d>8 <a c> <g b>4 |
  \duo { d'='2 e,4 | fis d8 e fis4 | g b b,=, | }
  { fis=4( d) c | b4. c8 d4 | e2 g,=,4 | }
  <a,=, c>4 <b d> <c e> | \duo { fis=4 a= r | } { d=2 d8 d= | }

  g'=4.\( a8 b d | a4. g16 fis e8 d | g4. a8 b d | a2\) a8\( a |
  d='4. e8 d c | g2 d'8 b | a c b[ a] e4 | d d,\) d'8_\aSta c' |
  b=8 ais b a g f | e f fis g gis a | b ais b a g f | fis g a b d c |
  b=8 ais b a b c | e dis e d b d | c r d dis r c | a fis e d <g, b>4 |
  <a=, c>4 <b d> <c e> | <d= a'>2 %
}
{{ end }}
