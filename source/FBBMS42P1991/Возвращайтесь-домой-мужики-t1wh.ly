{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 3/4
  \meter 1/4 1,1,1,1
  <g'=' b>4\mf 8 <fis a> <g b> <a cis> | <b d>4 <a cis> <g b> |
  \duo { a'='4 g fis=' | } { d'='2. | } | <g b>4 <d a'> <b g'> |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
