{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 3/4
  \meter 1/4 1,1,1
  d'='4(\mf f e8 d | cis e a4. g8) | f( e g f e d | f8. e16 e2) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
