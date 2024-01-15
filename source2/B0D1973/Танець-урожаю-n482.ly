{{ define "rh1" }}
  {{ .a }} c | e8-. g-. e4 |
  d=''8( g)-. g-. f-. | e-. d-. c=''4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a)-. e-. a-. | gis4(-> e8) r |
  | b'( d)-. c-. b-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r | c+cM!8 r c+cM4 |
  {{ .b }} g@M! g8 gM | a-. b-. c=4 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} am! a am | b e@7! e8 e7 |
  gis,=,8 e@7! e'8 e7 | a,=, am! {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 { {{ template "rh1" (w `g'='4\mf`) }} | }
  {{ template "rh2" (w `e,='8(\p`) }} | c( d e4) |
  {{ template "rh2" (w `e=''8(`) }} | a4( a,8) r |
  \repeat volta 2 { {{ template "rh1" (w `g='4\mf`) }} | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c+cM!4-\stBass` `b,=,8`) }}
  {{ template "lh2" (w `a=,8` `e'= a@m`) }}
  {{ template "lh2" (w `a,=,8` `a=, r`) }}
  {{ template "lh1" (w `c+cM!4` `b=,8`) }}
}
{{ end }}
