{{ define "rh1" }}
  {{ .a }} e-. c-. e-. | d4( b8 d) | c-. b-. a='4 |
{{ end }}

{{ define "rh2" }}
  e'=''8-. e-. e,4 | <dis a'>8-. <dis a'>-. 4 |
  e'=''8-. e-. e,-. e-. | {{ .a }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r g r | f4 r | e8 r a=4 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} e= | f@M!8[ fM8] fM4 | r4 e= | {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `c''=''8-.\mp`) }}
  {{ template "rh1" (w `c=''8-.`) }}
  {{ template "rh2" (w `<f=' a>8-. <f=' a>-. 4`) }}
  {{ template "rh2" (w `a='8-. a-. a='4`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a=8-\puBass`) }}
  {{ template "lh1" (w `a=8`) }}
  {{ template "lh2" (w `r4-\stBass` `f@M!8[ fM8] fM4`) }}
  {{ template "lh2" (w `r4` `f=8-. d-. a+am!4`) }}
}
{{ end }}
