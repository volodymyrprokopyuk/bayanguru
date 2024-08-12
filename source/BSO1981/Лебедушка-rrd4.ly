{{ define "rightHand" }}
\relative {
  \tempo Cantabile
  \clef treble
  \key a \minor
  \time 2/4
  c''=''4(\p c8 d | e f e4 | a,2) | c4 c8( d | e[ f e d] | a4) c8( e |
  d=''8[ c b a]) | e4( fis8 gis | a4) c8( e | d[ c b a]) | e4( gis | a='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! | e' eM! | a, am! | a am! | e' eM! | a, am! |
  d=4 dm! | e eM! | a, am! | d dm! | e= eM! | a+am!2 |
}
{{ end }}
