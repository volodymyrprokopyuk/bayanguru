{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 4/4
  a'='4.(\p b8 c4 a | b g e e) | c'4.( d8 e4 d8 c | b2) e4(\mf d) |
  c=''4( b8 c d4. c8 | b4 g g g) | a(\> c b \af 4\! a | e2) e'4(\p d) |
  c=''4( b8 c d4 c | b g g g) | a( c b a | e2\pp e'='') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R1 | R1 | a'='2(-\frBass fis) | g4( fis g e) | a2( d, | g2.) r4 |
  fis='4( e8 fis g4 fis | e2) e4( b') | a2( d, | g2.) r4 |
  fis='2( b,4 fis' | e2 e=') |
}
{{ end }}
