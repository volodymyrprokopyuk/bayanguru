{{ define "rh1" }}
  r8 d'=''4 b8 | cis4. a8 | gis cis, a' gis | fis='2 |
{{ end }}

{{ define "lh1" }}
  b=,8 bm! b bm | fis fism! cis' fis@m | cis8 {{ .a }}! cis= {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key fis \minor
  \time 2/4
  fis'='4.\mf gis8 | a4. fis8 | a a gis fis | gis4 cis,8 r |
  gis'='4. a8 | b4. gis8 | b b a gis | fis2 |
  cis'=''4 fis | e fis8 e | d d cis b | cis4 fis, |
  {{ template "rh1" }}
  <a=' cis>4 <d fis> | <cis e> <d fis>8 <cis e> |
  <b=' d>8 8 <a cis> <gis b> | <a cis>4 fis |
  {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key fis \minor
  fis,=,8-\stBass fism! fis fism |
  \rep 2 { fis=,8 fism fis=, fism | }
  cis'=8 cisM! gis cis@7! | cis8 cis7! cis cis7 |
  gis=,8 cis@7! cis8 cis7 | gis cis@7! cis8 cisM! |
  fis,=,8 fism! fis fism | cis' fis@m! cis8 fis@m |
  a=,8 aM! ais fis@7! | b8 bm! fis b@m |
  fis=,8 fism! fis fism |
  {{ template "lh1" (w `cisM`) }}
  fis,=,8 fism! cis' fis@m |
  \rep 2 { a=,8 aM! d= dM! | }
  b=,8 bm! fis b@m | fis8 fism! fis fism |
  {{ template "lh1" (w `cis7`) }} fis+fism!2 |
}
{{ end }}
