{{ define "vocal" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/8 1,1,1,1
  \rep 3 { e'='8 g g f=' | } | e d e c | \rep 2 { e='8 e f4 | e8 e d d=' | }
  e='8 g g8.( f16) | e8 g g f | e e f4 | e8 d c c=' \bar "|."
}
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key c \major
  \rep 3 { <c'=' e>8 <e g>8 8 <d f> | } | <c e> <b d> <c e> c |
  e='16 g, c e f a, c f | e g, c e d b g' f |
  e='16 g, c e f a, c f | e c e g d g b d |
  <g,=' c e>8 <c e g> <b d g>8.( <b d f>16) |
  <c='' e>16 g <e' g> g, <b g'> g <b f'> g |
  <c='' e>16 g <c e> g <a c f>4 | <g b e>8 <g b d> <e=' g c>8 8 |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass cM! g gM! | \rep 2 { c=8 cM! g=, gM! | } | g g7! c cM! |
  \rep 2 { c=8 cM! f, fM! | c' cM! g=, g7! | } \rep 2 { c=8 cM! g=, g7! | }
  c=8 cM! f, fM! | g g7! c= cM! |
}
{{ end }}

{{ define "lyrics" }}
\lyrOneColOne
"1." \column {
  "Ходім хлопці до криниці,"
  "Там нап'ємося водиці."
  \line { "А водиця чудова," \hspace #8 \italic (Двічі) }
  "Чиста, зимня, здорова."
}
{{ end }}
