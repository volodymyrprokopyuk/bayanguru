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
      b='4 bis | <e, gis>8 8 8 s8 | b' \rest <b e gis>[^\tenuto r b] |
      b='8 \rest <b e gis>[^\tenuto b \rest <a cis fis>]^\tenuto |
      b='8 \rest <bis gis'>^\tenuto cis4 |
      s2 | cis=''2 | <b cis e gis>4_\dCre <a cis fis a> | gis='2 | s2 |
    }

    <cis'='' e gis>16\mf bis <cis e gis> b <a cis fis> gis <a cis fis> fis |
    <e=' gis cis>16 dis <e gis cis> cis <a' cis> e <a cis fis> fis |
    <cis'='' e gis>16 bis <e gis cis> dis <e gis cis> cis <bis dis gis> gis |
    <gis=' cis e>16 fis <e gis cis> dis <cis e gis> gis( cis dis |
    gis='16 e dis cis bis a' gis fis | gis cis dis e dis cis a fis) |
    e='8 <e gis> <gis bis gis'> <gis bis fis'> |
    <e=' gis cis>8 <fis a cis> <e gis cis>16 <dis dis'>\f <e gis bis e> <fis fis'> |
    <gis=' cis e gis>16 16 8 <fis b dis fis>16 16 <b dis fis b> <a dis fis a> |
    <gis=' b e gis>16 16 8 <fis a cis fis> <a cis fis a> |
    <gis=' cis e gis>16 16 8 <gis bis e gis>\< <fis bis e fis> |
    <cis=' e gis cis>8 <cis e a cis> \af 8\! <cis=' e gis> r \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key cis \minor
}
{{ end }}
