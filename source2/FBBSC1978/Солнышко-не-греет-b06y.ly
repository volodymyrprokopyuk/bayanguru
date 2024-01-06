{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  a'='8\(\mf a c d | c4 b8 a | b g c b | a4 b\) |
  a='8\( a c d | e4 d8 c | b a c b\) | a a a='4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \meter 1/2 #'(1)
  r4 e'='4(-\frBass | a e | g8) r e4( | f e) |
  r4 e='4( | g8 c b a | g f e d) | c b a=4 \fermata |
}
{{ end }}
