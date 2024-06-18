{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  e'='8\mf g g f | e d e c | d e f a | g2 | c4( b | c4.) d8 | g,4( b | c=''2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='4(-\frBass b | bes2) | a4( b | c8 e d4) | e8 g g f | e d e f | e e d d | c='2 |
}
{{ end }}
