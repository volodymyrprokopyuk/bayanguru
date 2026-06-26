{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 6/8
  c''=''8\(\mp b a c b a | d c b d c b | c b a c b a | gis4. e\) |
  <e=' c'>2. | f | e4. \af 4.\! gis\<^\tRit | a='2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  <a= e'>2.-\frBass | <gis e'> | <a e'> | e | c'8\( b a c b a |
  d='8 c b d c b | c b a e fis gis | a=2.\) |
}
{{ end }}
