{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 6/8
  c'='4(\mp bes8 ees4 d8 | c4. g) | \rep 2 { aes=4( c8 ees4 d8 | c4. g=) | }
  aes=4( c8 ees4 d8 | c='4.~ c8) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  R2. | c=4(-\frBass bes8 ees4 d8 | c4. g) | aes4( c8 ees4 d8 |
  c=4. g) | c4( bes8 ees4 d8 | c4. g4.) | c=~ c8 r r |
}
{{ end }}
