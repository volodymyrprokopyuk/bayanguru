{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  <c''='' e>4\(\p\< 4 | <d f>4 \af 4\! 4 | <e g>4\> 4 |
  <d='' f>8 <c e> <b d>\) \af 8\! r |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
}
{{ end }}
