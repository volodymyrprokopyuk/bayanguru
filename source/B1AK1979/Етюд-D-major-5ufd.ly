{{ define "rh1" }}
  {{ .a }} e fis g a8)-. fis16( g a8)-. g16( fis e8)-. e=''-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r d+dM!8 r d+dM!8 r a+a7! r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 4/4
  {{ template "rh1" (w `d''=''16(\f`) }}
  {{ template "rh1" (w `d=''16(`) }}
  \rep 2 { d=''16( fis a fis e8)-. a=''-. } |
  d,=''8 e16( fis g a b cis d='''8) r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  {{ template "lh1" (w `d+dM!8-\stBass`) }}
  {{ template "lh1" (w `d+dM!8`) }}
  \rep 3 { d+dM! r a+a7! r } d+dM! r r4 |
}
{{ end }}
