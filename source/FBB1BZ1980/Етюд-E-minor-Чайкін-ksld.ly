{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 3/4
  <e'=' g>2.\mf | <fis b> | <e g> | <fis b> | <e g> | <e a> | <fis b>~ | 2. |
  <e=' g>2. | <e a> | <e g> | <fis a> | <e g>( | <dis fis>) | e~ | e=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  e'='2.-\frBass | dis | e | dis | d | cis | dis( | b) |
  d='2. | cis | c | b | e2( b4 | dis2 b4) | e2.( | e,=) |
}
{{ end }}
