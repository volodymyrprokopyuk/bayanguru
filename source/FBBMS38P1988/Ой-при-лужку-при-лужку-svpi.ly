{{ define "rh1" }}
  {{ .a }} d' bes d | c g8 a bes='4) r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key g \minor
  \time 4/4
  {{ template "rh1" (w `g'='4(\p`) }}
  {{ template "rh1" (w `g='4(`) }}

  \repeat volta 2 {
    f'=''4(\mf f8 g ees4 d8 c | g'4 g8 f ees4 g) | f4.( ees8 d ees c4 |
    \alternative {
      \volta 1 { g'=''2. d=''4) \sSlur nf #'((wb . 3.5) (ws . 7)) ( | }
      \volta 2 { \hSpace g=''1) \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  bes=2\(-\frBass g | ees' d4 c | bes2 d4 f | ees2 d4 bes\) |
  r2 c'=''4\( bes8 a | g2 c4 bes | a f bes a |
  g='2.\) \sSlur nf #'((wb . 2.5) (ws . 15)) ( r4 | g='1) |
}
{{ end }}
