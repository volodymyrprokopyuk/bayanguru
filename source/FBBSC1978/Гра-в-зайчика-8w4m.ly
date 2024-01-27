{{ define "rh1" }}
  {{ .a }} g) g | bes( g) g | bes16( c d4 | c16 bes a='4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 3/8
  {{ template "rh1" (w `bes'='8(\p`) }}
  {{ template "rh1" (w `bes='8(`) }}
  bes='4 bes8( | a4) r8 | c4( c8 | d4 d8) |
  ees=''4( c8 | d4.) | g8( f ees | d16 c bes a g a) |
  {{ template "rh1" (w `bes='8(`) }}
  bes='8( g) g | bes( g) g | g16[( a] bes8) a-- g='4.-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  d'='4.\(-\frBass | f | e4 e8 | ees4 ees8\) |
  d='4.\( | f | e4 e8 | fis4 d8\) |
  \rep 4 { bes'='8( a g | fis4 d='8) | }
  <g,= d'>4.\( | ees' | e4 f8 | fis4 d8\) |
  g='4.\( | f | e4\) ees8-- | <g,= d'>4.-- |
}
{{ end }}
