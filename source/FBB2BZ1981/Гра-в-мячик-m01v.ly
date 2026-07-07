{{ define "rh1" }}
  {{ .a }} b ais b d b g d) | <dis='' e>8-. 8-. 8-> r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `ais''=''16(\mf`) }}
  {{ template "rh1" (w `ais'=''16(`) }}
  \acc { gis=''8 } a8-> r \acc { cis=''' 8 } d8-> r | <dis,='' e>8-. 8-. 8-> r |
  \acc { ais'=''8 } b8-> r \acc { cis=''' 8 } d8-> r | <dis,='' e>8-. 8-. 8-> r |

  {{ template "rh1" (w `ais'=''16(`) }}
  e=''16(\< f fis gis a b c \af 16\! d) | <dis e>8-.\mf 8-. 8-> r |
  a=''16(\< b c d \af 8\! e8)-. r | g,16(\< a b c \af 8\! d8)-. r |
  e,=''16( fis g b) d,( e fis a) |
  g=''8-.\< \acc { cis='''8 } d-. \af 8\! <fis=''' g>->\sf r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  g'='8-\frBass <b d>_\aSta d, <b' d> |
  \rep 2 { g='8 <b d> d, <b'=' d> | }
  \rep 3 { fis='8 <c' d> d, <c'='' d> | }
  \rep 4 { g='8 <b d> d, <b'=' d> | }
  \rep 2 { <gis=' d'>8 e=' } | a <c e> e, <c' e> |
  r4 r16 c=''16( b a) | r4 r16 b( a g) |
  a='8 cis fis, c' | g b g='-> r |
}
{{ end }}
