{{ define "rh1" }}
  {{ .a }} c b a | e'2 c) | d4( e f e | d c b a) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e a, b8 c | d4 c b a) | gis {{ .b }} <gis d'> | a='1 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `a'='4(\mp`) }}
  {{ template "rh2" (w `c=''4(` `<e=' e'>4 <fis e'>`) }}
  <c,=' a'>4(\mf <e c'> <d b'> <c a'> | <e a e'>2 <c e c'>) |
  <f=' d'>4( <g e'> <a f'> <g e'> | <f d'> <e c'> <d b'> <c a'>) |
  r2 c='4( e | f2 g) | gis4( <c e> <b e> <gis d'> | <a c>2 <e' g>) |
  {{ template "rh1" (w `a=''4(\pp`) }} | R1 |
  {{ template "rh2" (w `c,=''4(` `<c='' e>4 <fis, e'>`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  <c'=' e>1-\frBass | <a e'> | <d f> | <a e'> |
  <e'=' g>1 | <d f> | <b e> | <a a'>2 e'=' |
  \clef bass a,=4 g f e | d c b a | <d a'>1 | <f a> |
  c=4 e a, b8 c | d4 c b a | e'( fis gis e | a=1) |
  \clef treble a'='2 e' | g4 fis f e | d1 | f | R1 |
  a,='4 g f e | d c b a= \clef bass | e=2 <e b'> | <a= c>1 |
}
{{ end }}
