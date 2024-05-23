{{ define "rh1" }}
  {{ .a }} <a f'> <f a>8\< \af 8\! <g=' bes>) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  {{ template "rh1" (w `<a'=' c>4(\mp`) }}
  {{ template "rh1" (w `<a=' c>4(`) }}
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
}
{{ end }}
