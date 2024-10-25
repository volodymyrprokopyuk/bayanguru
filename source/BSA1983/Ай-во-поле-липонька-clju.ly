{{ define "lh1" }}
  {{ .a }} bes@M! f@M!4 c'8 c7! f,=, fM! |
{{ end }}

{{ define "lh2" }}
  bes=,8 besM! a g c= c7! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 4/4
  \repeat volta 2 {
    a'='8(\mf bes c d16 c bes a g8 f8.) bes16( |
    a='16 f bes d c ees d c bes a g8 f g) |
    d='16( ees f8 f bes c16 a bes g f8.) g16( |
    d='16 ees f8 f bes c16 a bes g f='4) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  \meter 1/4 1,1,1,1
  {{ template "lh1" (w `f,=,8-\stBass`) }} {{ template "lh1" (w `f=,8`) }}
  {{ template "lh2" }} f,=,8 fM! | {{ template "lh2" }} f@M!4 |
}
{{ end }}
