{{ define "rh1" }}
  \duo { d''=''8( b) | a4( cis8 a gis fis=') | }
  { gis'='4 | fis8( e16 d cis='2) | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key fis \minor
  \time 3/4
  \partial 4 { fis'='8\mf fis | }
  <b=' d>4( <d fis> <cis e>8 <d fis> | <a cis>4.) a8( gis fis) |
  <b=' d>4( <a cis>) \duo { b'='8(\> \af 8\! cis='') | } { gis'='4 | }
  fis='4 <a cis fis> \fermata fis8\mf fis | <b d>4( <a cis>) %
  {{ template "rh1" }} <d,=' b'>4( <cis a'> <e gis> | fis2) fis8 fis |
  <d=' b'>4( <a' cis>) {{ template "rh1" }} |
  <d,=' b' d>4 <cis a' cis> <e gis b> | fis2 fis8 e |
  <a=' cis>4 <cis e> <b d>8 <gis e'> | <a cis>2\< 8( \af 8\! <b d>) |
  \duo {
    \once \stemDown <cis''='' e>4(\f fis,)_~ \once \stemDown fis_~ | <fis b d>2 %
  } { s2 \stemUp <d''='' fis>8^( <cis='' e>) | s2 } %
  <b=' d>8( <cis e>) | <d fis>4 %
  \duo {
    s4 <e''='' gis>8 <d fis> | <a cis>4. a8\> gis[ \af 8\! fis] |
    <b=' d>4\mf <a cis> <gis=' b> |
  } { <b'='~ fis' a>4 b | r8 cis,8 fis cis~ cis4 | fis2 e='4 | }
  fis,='2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key fis \minor
}
{{ end }}
