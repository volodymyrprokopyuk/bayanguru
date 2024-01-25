{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  a=4(\mf e' c c | d a8 b c2) | a4( e' c c | d a8 b c2) |
  c='4( c d c8 b | a4 a d f) | e4.( d8 c4 b | a2 a'4 g8 f) |
  e='4( g f e8 d | a'4 a8 g f4 a) | g4.( f8 e4 e | a2) a='4 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  R1 | R1 | r2 a=4(-\frBass g | f2 e) | r2 f4( g | a) r r d( |
  c='4. b8 a4 e | a=2 \clef treble f'='4 e8 d) |
  c='4( e d c8 b | a2 d4 f) | e4.( d8 c4 b | a=2.) r4 |
}
{{ end }}
