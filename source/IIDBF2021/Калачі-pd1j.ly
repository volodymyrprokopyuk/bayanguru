{{ define "vocal" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 2/4
  \meter 1/8 1,1,1,1
  \rep 2 { a'='8 fis g e | d d d='4 | }
  e='4 e8 g | fis e d4 | e8 e a g | fis e d='4 \bar "|."
}
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key d \major
  <fis'=' a>8 <d fis> <e g> <cis e> | d d d16 e fis g |
  <a,= fis' a>8 <a d fis> <a e' g> <a cis e> | <fis a d> d' <fis,= a d>4 |
  <a= cis e>4 8 <a e' g> | <a d fis>8 <a cis e> <fis a d>4 |
  <g= b e>8 e' <a, cis a'> g' | <a, d fis> <a cis e> <fis= a d>4 |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=8-\stBass dM! a aM! | d dM! d dM | d dM! a aM! | d dM! d+dM4 |
  a=,8 aM! cis a@7! | d8 a@7! d8 dM! | e em! a, a7! | d a=, d+dM!4 |
}
{{ end }}

{{ define "lyrics" }}
\lyrOneColThree
"1." \column {
  "Я печу, печу, печу"
  "Діткам всім по калачу!"
  "Зверху маком притрушу,"
  "В піч гарячу посаджу!"
}
"2." \column {
  "Випікайтесь, калачі,"
  "У натопленій печі!"
  "Я для всіх печу, печу,"
  "Щоб наїлись досхочу!"
}
"3." \column {
  "Буду маму, буду тата"
  "Калачами частувати!"
  "Буду друзів пригощати,"
  "Калачами частувати!"
}
{{ end }}
