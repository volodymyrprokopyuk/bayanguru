{{ define "lh1" }}
  e=4 em! em | g, e@m em4 | a=, a7! a7 |
{{ end }}

{{ define "lh2" }}
  e=4 em! em | fis fis7! fis7 | b, bm! bm |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key b \minor
  \time 3/4
  <b= d>2\(\p <cis e>4 | <d fis>2 <b' d>4 |
  <a=' cis>2 <g b>4 | <fis a>2.\) |
  <a=' cis>2\( <g b>4 | <cis, e>2 <e g>4 |
  <g=' b>2 <fis a>4 | 2.\) |
  \duo {
    <e'=' g>2\( <fis a>4 | <g b>2 \stemDown <b d>4 |
    <a=' cis>2 \stemNeutral <g b>4 | fis='2.\) |
  } { s2. | s2. | s2. | d'='4( cis b=) | }
  <cis=' e>2\( <e g>4 | <d fis>2 <cis e>4 |
  <b= b'>2.~ | 2.\) |
  \duo { b'='2.\( | b2 d4 | e2. | d4 \acc { cis=''16 d } cis4 b='\) | }
  { <e'=' g>2\( <fis a>4 | g2 b4 | <a cis>2 <g b>4 | fis='2.\) | }
  <cis=' e b'>2\( <e g b>4 | <d fis>2 <cis e fis>4 |
  <b= b'>2.~ | 2.\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  b,=,4-\stBass bm! bm | b bm bm | e em! a@7! | d4 dM! dM |
  a=,4 aM! aM | a aM aM | d dM! dM | d dM dM |
  {{ template "lh1" }} | b cis d |
  {{ template "lh2" }} | b bm bm |
  {{ template "lh1" }} | d= dM! dM |
  {{ template "lh2" }} | b@m!2 r4 |
}
{{ end }}
