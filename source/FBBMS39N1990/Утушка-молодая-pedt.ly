{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  R2\mf | \rep 3 { R2 | }
  e''=''4(\mp e | d c8 c | b4 a) | e'( e | d c8 c | b e a,4)-- |
  gis='8( e e gis) | a a a a | gis e e gis | a e' a e |
  gis=''8 e e gis | a a a a | e d e16( d c b | a8) e' a=''4 \barFermata \bar "||"

  \tempo Allegro
  \key a \major
  e=''4\mf e | d cis8 cis | b4 a | e'8 fis e a |
  e=''8 fis e d | cis(-> b a4) | b8(-> a) gis16( b fis8) |
  e='8( a) a16( b cis8) | b16( cis b a) gis( b fis8) |
  e='16 f fis gis a b cis d | e fis e fis e d cis b |
  a='16 gis fis e d cis b a | b cis b cis d e fis gis |
  a='16\<^\tRit b cis e a <a, cis>16 16 \af 16\! <b=' d> |

  \tempo Sostenuno
  <a=' cis e>8\f fis' <e, a cis>4 | <fis b d> <e a cis>8 e' |
  <d,=' fis b>4 <cis e a> | <e a cis> <a cis e>8 8 |
  <a=' d fis>8 a' <a, cis e> a' | <d, fis b> gis <a, e' a> <e a cis> |
  <d=' fis b>4 <cis e a> | <a d fis>8 gis' <cis, e a> cis' |
  <fis,=' b d>4. gis8 | <cis, e a> b' <e, a cis> e' |
  <b=' d fis>4. <gis b e>8 | <a cis e> fis' <a, cis e> a' |
  \rep 2 { <d,='' fis a>8 b'='' } | <cis, e a> cis' <cis,='' e a> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
