{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \major
  \time 2/4
  b'='8\mf b e8. d16 | cis8 cis e8. cis16 |
  b='8 b e8. d16 | cis8( a) a4 |
  b='16( e, gis b) e8. d16 | cis( b cis d) e8. cis16 |
  b='16( e, gis b) e8. d16 | cis( d cis b a='4) \bar "||"

  \key e \major
  fis='8 b, b'8. a16 | gis8 gis b8. gis16 |
  fis='8 b, b'8. a16 | gis8( e) e4 |
  fis='16( b, dis fis) b8. a16 |
  gis='16( fis gis a) b8. gis16 |
  fis='16( b, dis fis) b8. a16 |
  gis='16( a gis fis e='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  e=8-\stBass e7! b e@7 | a8 aM! cis a@M |
  \rep 3 { e=8 e7! b e@7 | a8 aM! cis= a@M | }

  \key e \major
  \rep 3 { b=,8 b7! fis b@7 | e'8 eM! gis,=, e@M | }
  b=,8 b7! fis b@7 | e'=8 eM! e+eM4 |
}
{{ end }}
