{{ define "vo1" }}
  {{ .a }} f f4 | f8 f f4 | f8 f g a | bes4 {{ .b }} |
{{ end }}

{{ define "vocal" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  \meter 1/8 1,1,1,1
  {{ template "vo1" (w `f'='8` `f='`) }}
  {{ template "vo1" (w `f='8` `a='`) }}
  g='8 g d4 | g8 g d4 | d8 d e fis | g4 d |
  g='8 g d4 | g8 g d4 | a'8 a bes a | g4 g=' \bar "|."
}
{{ end }}

{{ define "rh1" }}
  \rep 2 { <bes= d f>8 f' <bes,= d f>4 | }
  <a= ees' f>8 f' g a | <d, f bes>4 {{ .a }} |
{{ end }}

{{ define "rh2" }}
  \rep 2 { <bes= d g>8 g' <g,= bes d>4 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key bes \major
  {{ template "rh1" (w `<bes= d f>4`) }}
  {{ template "rh1" (w `<c=' fis a>4`) }}
  {{ template "rh2" }} | <fis= c' d>8 d' e fis | <bes, d g>4 <g bes d> |
  {{ template "rh2" }} | <d'=' fis a>8 a' <c, fis bes> a' | <bes,= d g>4 4 |
}
{{ end }}

{{ define "lh1" }}
  {{ .a }} besM! f bes@M | bes8 besM! f bes@M |
  c'=8 f@7! f,8 f7 | bes besM! {{ .b }} |
{{ end }}

{{ define "lh2" }}
  \rep 2 { g,=,8 gm! d'= g@m | }
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  {{ template "lh1" (w `bes,=,8-\stBass` `f=, bes@M`) }}
  {{ template "lh1" (w `bes=,8` `d= d7!`) }}
  {{ template "lh2" }} | a=,8 d@7! d8 d7 | g, gm! d' g@m |
  {{ template "lh2" }} | d=8 d7! d d7 | g, d'= g+dm!4 |
}
{{ end }}

{{ define "lyrics" }}
\lyrOneColTwo
"1." \column {
  "Я скачу, я верчу у руках скакалочку,"
  "Як стрибну, обжену Галю і Наталочку!"
  "От і раз, то і два, прямо по доріжці,"
  "Та скоріш, веселіш та на правій ніжці."
}
"2." \column {
  "Я скачу, я верчу у руках скакалочку,"
  "Я скачу, я учу Галю і Наталочку."
  "От і раз, от і два – учаться сестрички,"
  "Тільки плиг, тільки скік золоті косички!"
}
{{ end }}
