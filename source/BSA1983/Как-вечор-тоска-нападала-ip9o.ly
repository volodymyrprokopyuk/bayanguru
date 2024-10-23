{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 4/4
  a'='4( e c' b | a gis a2) | c4( c c d | e1) |
  e=''4 e d d | c c b b | a( c b e | a,='1) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! d dm! | e e7! a, am! | a am! g g7! | c cM! cM cM |
  c=4 cM! d dm! | e a@m! e4 e7! | a, am! e' e7! | a,=, am! am am |
}
{{ end }}
