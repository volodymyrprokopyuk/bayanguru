{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 3/4
  \repeat volta 2 {
    f'='4\mf f8\( g a bes | c2 f4\) |
    d=''4\( f d | c2 a4\) |
    bes='4\( d bes | a c a |
    g='4 bes e, | f8 g a bes c4\) |
    bes='4\( d c8 bes | a4 c bes8 a |
    g='4 bes e, | f='2.\) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,4-\stBass fM! fM | a f@M! fM4 |
  bes=,4 besM! besM | a f@M! fM4 |
  bes=,4 besM! besM | c f@M! fM4 |
  c=4 c7! c7 | f, fM! fM |
  g=,4 gm! gm | c f@M! fM4 |
  c=4 c7! c7 | f,=, fM! fM |
}
{{ end }}
