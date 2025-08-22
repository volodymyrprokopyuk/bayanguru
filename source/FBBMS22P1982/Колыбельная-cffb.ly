{{ define "rh1" }}
  {{ .a }} bes8 a4 d, | <cis f> e=') r2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key f \major
  \time 4/4
  {{ template "rh1" (w `a'='4.(\p`) }}
  {{ template "rh1" (w `a='4.(`) }}
  d='4(\< a'2.) | g4.( a8 bes4 c | d4. d8 f4 e | cis2) \af 2\! r2 |
  d=''4.( ees8 d4 c | bes d) r2 | d4.(\< d8 f4 \af 4\! e | <cis g'>2)\f r2 |
  a'=''4.( a8 bes4 a | g\> d2 e4 | a, d d8^\tRit cis b \af 8\! cis |
  <a=' d>2) r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  R1 | a=4.(-\frBass bes8 a4 d, | f e) r2 |
  a=4.( bes8 a4 g | fis4. fis8 a4 c | bes d=') r2 \clef treble |
  e='4( bes'2.) | a4.( bes8 a4 g | <fis a>2) r4 d( |
  g='4. a8 g4 f) | e( bes'2.) | a4.( bes8 a4 g) | fis4( c'2.) |
  bes='4.( a8 g2 | f e | <d=' f>) r |
}
{{ end }}
