{{ define "rh1" }}
  {{ .a }} c-. a-. | d-. b-. g-. | a-. fis-. d='-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r8 | g+gM!4 r8 | d+d7!4 r8 | g+gM!4 r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key g \major
  \time 3/8
  {{ template "rh1" (w `e''=''8-.\f`) }} | g-. b-. d-. |
  {{ template "rh1" (w `e=''8-.`) }} | g4 r8 |
  a='8(\p\< fis d | g b \af 8\! d) |
  r8 d=''8(\> c | b a \af 8\! g) |
  e'=''8-.\mf c-. a-. | d-.\> b-. g-. |
  a='8-. fis-. d-. | \af 4\! g='4 r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `fis+d@7!4-\stBass`) }}
  {{ template "lh1" (w `fis+d@7!4`) }}
  d+d7!4.( | g+gM!8) r r | a,=,8[ d@7! d78] |
  g=,8 gM! gM | {{ template "lh1" (w `fis+d@7!4`) }}
}
{{ end }}
