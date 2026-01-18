{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  \partial 4 { f'='8(\mf a | }
  bes='4 a8 c | g4) f8( a | bes bes a c | g4) f8( a |
  bes='8 bes a c | g2) | \af 2\! f='2\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \partial 4 { r4 | }
  r4 f=8(-\frBass a | bes4 a8 c | g4) f8( a | bes bes a c |
  g=4) f8( a | bes4 c) | f,=2 |
}
{{ end }}
