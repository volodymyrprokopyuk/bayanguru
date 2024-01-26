{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 4/4
  a'='4.(\p b8 c4 a | b g e e) | c'4.( d8 e4 d8 c | b2) e4( d) |
  c=''4( b8 c d4. c8 | b2. b4) | a( c b a | e'2) e4( d) |
  c=''8( d16 c b8 c d4. c8 | b2. b4 | a c b a | e'=''1) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R1 | R1 | a'='4.(-\frBass b8 c4 b8 a | g4 fis e2) |
  a='2( d, | g4 fis e d) | fis( e8 fis g4 fis | e2) e |
  a='2( d, | g4 fis e d=' \clef bass | c=' a g fis | e=1) |
}
{{ end }}
