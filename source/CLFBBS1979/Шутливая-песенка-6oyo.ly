{{ define "rh1" }}
  {{ .a }} a-. | c-. c8( bes | a4)-. g='-. |
{{ end }}

{{ define "rh2" }}
  f='4-- {{ .a }} a | bes4)-- a8( g | a4)-- g8( f=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `f'='4-.\mf`) }} | f='2-- |
  {{ template "rh1" (w `f='4-.`) }} |
  {{ template "rh2" (w `g='8(\p`) }} | g='4)-. e-. |
  {{ template "rh2" (w `g='8(\mf`) }} | g='4)-. c-. | f,='2--\f \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  R2 | r4 c'='4-.-\frBass | d-. e-. | f2-- |
  R2 | r4 c='4-. | d-. e-. | f-- ees-- |
  d='2-- | c-- | bes4-. c-. | f-- ees-- |
  d='2-- | c-- | bes4-. c-. | f='2-- |
}
{{ end }}
