{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 4/4
  \acc { b'='8 } <f=' c'>1->\f \clef bass |
  \acc { b,,=,8 } <f=, c'>1-> \clef treble |
  \rep 2 { c'''=''8 c c d c4 a8 f=' | }
  c'=''8 c c d c4 \duo { a'='8 g=' | } { f'='4 | }
  <f,=' a>8\p <d a'> <f g>[ g] f4 c8 c=' |

  \duo {
    c''=''4 c c c | a g f c | c'\< c c \af 4\! c |
    g='8(\f\> bes) a[( g]) f4 \af 4\! c=' |
  } {
    a'='8 bes a g f g f e | f e d c bes a g d'' |
    a='8 bes a g f g f e | d4 e f c=' |
  }
  <c=' f a>8[-.\mf 8]-. <b f' g>8-. 8-. <bes d f>4 <a c>8 8 |
  <a= f'>8[-.\p 8]-. <b f' g>8-. 8-. <bes d f>4 %
  \duo { f'='8 f=' \bar "|." } { c'='4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \duo {
    \grace { s8 } \rep 8 { a=8 bes= } | \rep 2 { a=8 bes a bes a bes c d=' | }
    e='8 f e f d e c4 | a b8 g c='2 |
  } { f=1-\frBass | f | f2 f | f2 f | a bes4 f8 e | d2 f= | }

  \acc { b,=,8 } <f=, c'>1 | \duo { \acc { b,=,8 } c=2 d4 e= | } { f,=,1 | }
  \acc { b=,8 } <f=, c'>1 | \duo { bes,=,4 c d c= | } { f,=,1 | }
  f'=8-. e-. d[-. g,]-. bes4 <f c'> | f'8-. e-. d[-. g,]-. bes4( f=,) |
}
{{ end }}

{{ define "lyrics" }}
\lyrTwoColTwo
"1." \column {
  "Іди, іди, дощику,"
  "Зварю тобі борщику"
  "В полив'янім горщику!"
  "Іди, іди, дощику,"
  "Цебром, відром, дійницею"
  "Над нашою пашницею!"
  "Іди, іди, дощику,"
  "Зварю тобі борщику!"
}
"2." \column {
  "Іди, іди, дощику,"
  "Зварю тобі борщику!"
  "Зварю тобі борщику"
  "У полив'янім горщику!"
  "Винесу на дуба,"
  "Покличу голуба."
  "Голуб буде пити,"
  "Дощик буде лити!"
}
\lyrOneColOne
"3." \column {
  "Іди, іди, дощику,"
  "Зварю тобі борщику!"
  "Зварю тобі борщику"
  "У полив'янім горщику!"
  "Поки голуб прилетить,"
  "То голубка відлетить."
  "Тобі кашка, а нам борщ,"
  "Щоб ішов густенький дощ!"
}
{{ end }}
