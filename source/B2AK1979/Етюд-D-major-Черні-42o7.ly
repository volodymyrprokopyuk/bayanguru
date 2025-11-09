{{ define "rh1" }}
  {{ .a }} gis b a fis d a' gis b a fis d='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Prestissimo
  \clef treble
  \key d \major
  \time 6/8
  {{ template "rh1" (w `a''=''16(\p`) }} | d'='''16 cis e d b g d' cis e d b g) |
  {{ template "rh1" (w `a=''16(`) }} | e=''16 dis fis e cis a b cis d e fis g) |
  a=''16( fis d cis e d a' fis d cis e d | g e b ais cis b g' e b ais cis b) |
  fis'=''16( d a gis b a e' cis a gis b a | d a' fis d a fis d='8) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d+dM!8-\stBass r r d+dM! r r | \rep 2 { d+g@M!8 r8 r } |
  \rep 2 { d+dM!8 r r } | a+a7!8 r r r4. | \rep 2 { fis+d@M!8 r8 r } |
  \rep 2 { g+e@m!8 r8 r } | a+d@M!8 r8 r a+a7! r r | d+dM! r r r4. |
}
{{ end }}
