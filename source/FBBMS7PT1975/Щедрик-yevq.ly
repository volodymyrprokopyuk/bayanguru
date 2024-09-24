{{ define "rh1" }}
  bes='4\< a8 bes \af 4\! g4 | bes {{ .a }} a8 bes g4 |
  \rep {{ .b }} { bes='4 a8 bes g='4 | }
{{ end }}

{{ define "rh2" }}
  \duo { d''=''2. {{ .a }} | } { bes'='4 a8 bes g='4 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 3/4
  bes'='4->\mp a8_\aLeg bes g4 | bes->_\aSim a8 bes g4 |
  bes='4\pp a8 bes g4 | \rep 4 { bes='4 a8 bes g='4 | }
  {{ template "rh1" (w `\p` `2`) }}
  {{ template "rh1" (w `\mp` `3`) }}

  {{ template "rh2" (w `\mf`) }} {{ template "rh2" (w ``) }}
  {{ template "rh2" (w `_\dCre`) }} {{ template "rh2" (w ``) }}
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
