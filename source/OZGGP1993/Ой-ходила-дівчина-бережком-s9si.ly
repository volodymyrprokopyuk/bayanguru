{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}

{{ define "lyrics" }}
{{ end }}
