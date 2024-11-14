{{ define "vocal" }}
\relative {
  \tempo Vivo
  \clef treble
  \key d \major
  \time 2/4
  \meter 1/8 1,1,1,1
  d'='8 d e e | fis fis g4 | fis8 fis e e | d d d4 |
  a'='4 a | g8 g g g | fis fis e e | d4 d='4 \bar "|."
}
\noPageBreak
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key d \major
  \duo {
    d'='8 d e e | fis fis <b, d g>4 | fis'8 fis e e | d d <fis, a d>4 |
    <d'=' fis a>4 4 | g8 g g g | fis fis e e | <fis,= a d>4 4 |
  } {
    r8 <fis=a>8[ r <a cis>] | r <a d> s4 | r8 <a d>[ r <a cis>] r <fis a> s4 |
    s2 | r8 <b= d>8[ r <bes d>] | r <a d>[ r <g= cis>] | s2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=8-\stBass dM! a aM! | d dM! g, gM! | d' dM! a aM! | d dM! d+dM4 |
  d=8 dM! c d@M! | b8 g@M! bes8 g@m! | a8 d@M! a8 a7! | d a d=4 |
}
{{ end }}

{{ define "lyrics" }}
\lyrOneColTwo
"1." \column {
  "Диби, диби, ой диби,"
  "Пішла баба по гриби,"
  "А дід по опеньки"
  "В неділю раненько."
}
"2." \column {
  "Пішла баба по гриби,"
  "А дід по опеньки,"
  "Дідо свої посушив,"
  "Бабині – сиренькі."
}
{{ end }}
