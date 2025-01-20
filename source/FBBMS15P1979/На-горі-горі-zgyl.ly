{{ define "rh1" }}
  {{ .a }} a b c | d4 g8)-. r | e-. r {{ .b }} r | d=''4-> r |
{{ end }}

{{ define "rh2" }}
  {{ .a }} g b g | b d c b | a)-. r a-. r |
  a='8(\< b c \af 8\! e | d\> c b \af 8\! a=' |
{{ end }}

{{ define "lh1" }}
  fis='8( d fis d | fis)-. r d-. r | e-. r fis-. r | {{ .a }} r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `g'='8(\mf` `e-.`) }}
  {{ template "rh1" (w `g,='8(` `g-.`) }}
  {{ template "rh2" (w `b='8(\mp`) }} | d=''4)-> r |
  {{ template "rh2" (w `b='8(\p`) }} | g='4)\pp r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  \meter 1/2 #'(1)
  R2 | R2 | c'='8(-\frBass d e fis | g4)-> r | R2 | b4( g8)-. r |
  c,='8( d e fis | g4)-> r | R2 | R2 | {{ template "lh1" (w `g='4->`) }}
  R2 | g='8-. r e-. r | {{ template "lh1" (w `g='4`) }}
}
{{ end }}
