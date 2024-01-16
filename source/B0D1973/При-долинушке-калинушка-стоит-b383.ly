{{ define "rh1" }}
  {{ .a }} d-. e-. c-. | d( c d e | c4) %
{{ end }}

{{ define "lh1" }}
  {{ .a }} c@M!4 | d+dm!4 g+gM! | c+cM! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  \partial 4 { c''=''8-.\mp e-. | }
  {{ template "rh1" (w `f=''8-.`) }} c,8-. e-. |
  {{ template "rh1" (w `f='8-.`) }} g''8-. e-. |
  {{ template "rh1" (w `f=''8-.`) }} g8-. e-. |
  f='8-. d-. e-. c-. | d( c b d | c='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  {{ template "lh1" (w `f@M!4-\stBass`) }} r4 |
  {{ template "lh1" (w `f@M!4`) }} r4 |
  {{ template "lh1" (w `f@M!4`) }} r4 |
  {{ template "lh1" (w `f@M!4`) }}
}
{{ end }}
