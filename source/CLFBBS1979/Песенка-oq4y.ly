{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  e'='4(\p fis g a | b2 e,) | fis4( a g fis | e1) |
  e='4(\mp fis g a | b2 e,) | b'4(\> a g \af 4\! fis | e='1)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  R1 | e=4(-\frBass fis g a | b2 e,) | fis4( a g fis | e1) |
  e=4( fis g a | b2. a4 | g fis e=2) |
}
{{ end }}
