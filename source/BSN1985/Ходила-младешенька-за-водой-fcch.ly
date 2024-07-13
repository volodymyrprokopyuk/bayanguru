{{ define "rh1" }}
  gis'='4 fis8 b16( a | gis8) gis fis4 |
  e='8 gis gis( fis | cis) cis cis=' {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key cis \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    gis'='8\p gis fis fis | gis16( fis gis8) fis16( e dis8) |
    e='8 gis gis fis | cis cis cis4 |
    {{ template "rh1" (w `r8`) }}
    {{ template "rh1" (w ` \fine \bar "!!" r8`) }}

    \volta 2
    \duo {
      gis''=''4\mp fis | gis fis16( e dis8) | e gis gis( fis) | cis4. b8 \rest |
      s4.\f b'=''16( a) | s2 | s4 gis8( fis) | <e, gis cis>8\> 8 8 \af 8\! b' \rest |
      e=''4.\p fis8 | s2 | <e gis>8 8 8 <dis fis> | <e,=' gis cis>4 8 b'=' \rest |
    } {
      <b'=' cis>8 8 <a dis>8 8 | <gis cis> <b e> a4 |
      b='4 bis | <e, gis>8 8 8 s8 | b' \rest <b e gis>[-- r b] |
      b='8 \rest <b e gis>[-- b \rest <a cis fis>]-- | b \rest <bis gis'>-- cis4 |
      s2 | cis=''2 | <b cis e gis>4_\dCre <a cis fis a> | gis='2 | s2 |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key cis \minor
}
{{ end }}
