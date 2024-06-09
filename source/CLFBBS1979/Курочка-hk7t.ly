{{ define "rh1" }}
  {{ .a }} d-. bes-. d-. | c4( a8) c-. | bes-. a-. g='4 |
{{ end }}

{{ define "rh2" }}
  d'=''8-. d-. d,4 | g8-. g-. g4 | d'8-. d-. {{ .a }} d,-. d-. | g-. g-. g='4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 2/4
  {{ template "rh1" (w `bes'='8-.\mf`) }} {{ template "rh1" (w `bes='8-.`) }}
  {{ template "rh2" (w ``) }} {{ template "rh2" (w `^\tRit`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  g'='4(-\frBass f | ees2) | d4 g | g( f | ees2) | d4 g |
  R2 | <cis,=' ees>2-- | R2 | ees-- | R2 | <cis ees>-- | R2 | ees8( c <g= d'>4) |
}
{{ end }}
