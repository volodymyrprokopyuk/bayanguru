{{ define "rh1" }}
  {{ .a }} e fis \af 4\! g | fis\> dis \af 2\! e='2) |
{{ end }}

{{ define "rh2" }}
  b'='4(->\mf g) b(->\> g) | b(-> {{ .a }} a \af 2\! {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a_~ | <a c> <g b>4 a=) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  {{ template "rh1" (w `b=4(\p\<`) }}
  {{ template "rh1" (w `b=4(\<`) }}
  {{ template "rh2" (w `` `e='2)`) }}
  {{ template "rh2" (w `^\tRit` `e='2)\pp`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `e=2(-\frBass`) }}
  {{ template "lh1" (w `e=2(`) }}
  e=4( d') e,( cis') | e,( c') e,( b') |
  e,=4( d') e,( cis') | e,( c' e,=2) |
}
{{ end }}
