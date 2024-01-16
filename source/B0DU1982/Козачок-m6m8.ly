{{ define "rh1" }}
  {{ .a }} c8-. e-. | d16( c b8)-. c-. e-. |
  c=''8-. e-. c-. e-. | d16( c b8)-. {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! a am | e' e7! a, am! |
  a=,8 am! a am | e'= e7! {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `e''=''4\mf` `c=''4`) }}
  {{ template "rh1" (w `e=''4` `a='4`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8-\stBass` `a,=, am!`) }}
  {{ template "lh1" (w `a=,8` `a+am!4`) }}
}
{{ end }}
