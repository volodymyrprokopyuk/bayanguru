{{ define "rh1" }}
  {{ .a }} e16 d4 | d8. e16 d4 | <d b'>8 8 <e a> <e g> | <fis=' a>2 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8 a g | <fis a>8 8 <d fis>4 | {{ .b }} 8 <cis e a>8 8 | {{ .c }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  {{ template "rh1" (w `d'='8.\mf`) }}
  {{ template "rh1" (w `d='8.`) }}
  {{ template "rh2" (w `<g=' b>8\f` `<b= d e>8` `<d=' fis>2`) }}
  {{ template "rh2" (w `<g=' b>8` `<d=' e>8` `d='2`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=4-\stBass dM! | d dM | g, a@M! fis4 d@M! |
  d'=4 dM! | d dM | g, a | d dM! |
  g,=,4 gM! | d' dM! | g, a | d dM! |
  g,=,4 gM! | a d@M! | g+gM!4 a+a7! | d= dM! |
}
{{ end }}
