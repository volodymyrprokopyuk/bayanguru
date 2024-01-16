{{ define "rh1" }}
  {{ .a }} c c | c8 bes a g f4\) | bes8( c d2) | d4( c=''2) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fM! fm | f fM fM | f bes@M! besM4 | f= fM! fM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  {{ template "rh1" (w `c''=''4\(\p`) }}
  {{ template "rh1" (w `c=''4\(`) }}
  bes='8( a g4)-. g-. | a8( g f4)-. f-. |
  bes='8( a g4)-. g-. | a8( g f2) |
  bes='4\( a bes | c2 bes4\) |
  a='8( bes a4)-. g-. | f4-. f='-. r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  {{ template "lh1" (w `f=4-\stBass`) }}
  {{ template "lh1" (w `f=4`) }}
  \rep 2 { c=4 c7! c7 | f= fM! fm | }
  d=4 bes@M! besM4 | g, bes@M! besM4 |
  c=4 c7! c7 | f= fM! r |
}
{{ end }}
