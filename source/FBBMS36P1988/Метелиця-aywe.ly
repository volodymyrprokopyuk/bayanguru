{{ define "rh1" }}
  {{ .a }} r fis4 | g8( a bes4) | d8 {{ .b }} d a( c) | bes( a g='4) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <g=' bes>[ r <g d'>] | r8 <g bes>[ r <g d'>] |
  r8 <fis=' a>8[ r <fis=' d'>] |
{{ end }}

{{ define "lh1" }}
  {{ .a }} bes) | d8 d bes4 | d4 a8( c) | bes( a {{ .b }} |
{{ end }}

{{ define "lh2" }}
  a=8( d,) c'( d,) | bes'( a g d=) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 2/4
  d''=''4(\mf bes) | d8 d bes4 | r8 d[( a c]) | bes( a g4) |
  d'=''8-. bes4( c8) | d-. bes4( d8) | f16( e d8 cis d) | bes8( a g='4) |
  {{ template "rh1" (w `fis='8\mp` ``) }}
  {{ template "rh1" (w `fis='8\mf` ``) }}

  {{ template "rh2" (w `r8\f`) }} | r16 d='16( e fis g fis g a) |
  {{ template "rh2" (w `r8`)}} | r16 d='16( e fis g4) |
  {{ template "rh1" (w `fis='8\mp` ``) }}
  {{ template "rh1" (w `fis='8\mf` `^\tRit`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  g=4(-\frBass d') | g,( d') | g,( c) | d8( c bes4) |
  \rep 2 { g=4( d'=') | } | g,( bes) | d8( c bes=4) |

  \rep 2 { a=8( c bes a) | bes4( g) | fis( d') | g,8( a bes=4) | }
  \clef bass
  {{ template "lh1" (w `d='4(` `g=4)`) }}
  {{ template "lh1" (w `d'='4(` `<g= bes>4)`) }}

  {{ template "lh2" }} | fis=8( d e fis) | g( a bes4) |
  {{ template "lh2" }} | fis=8( d fis a=) |
  \duo { d'='8( c bes4) | } { g=2 | }
}
{{ end }}
