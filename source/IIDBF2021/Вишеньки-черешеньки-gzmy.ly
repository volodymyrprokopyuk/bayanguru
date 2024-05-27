{{ define "vocal" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 2/4
  \meter 1/8 1,1,1,1
  \repeat volta 2 {
    \partial 8 { a'='8 | }
    a='8. \noBeam 16 8 b | a( fis) d fis | a d cis b | a4 8 8 |
    g='4 e8 g | fis fis d fis | e fis gis e |
    \alternative {
      \volta 1,2,3,4 { a='4 8 8 | }
      \volta 5 { a='4 8 r \bar "|." }
    }
  }
}
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key d \major
  \partial 8 { a'='8\mp | }
  <fis=' a>8. 16 8 <g b> | <fis a>(\< fis d \af 8\! fis) |
  <fis=' a>8(\< <fis d'> <a cis> \af 8\! <g b> | <fis a>4) 8 8 |
  \duo { g'='4 e8 g | fis fis d( fis=') | } { d'='2~ | d='4 s4 | }
  e='8( fis gis e) | a4\> a8 \af 8\! a | a4 a='8 r |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \partial 8 { r8 | }
  a,=,8-\stBass d@M! d8 g@M! | a8 d@M! d8 dM! | d dM! g, gM! | d' dM! d dM |
  b=,8 g@M! g8 gM! | d' dM! b d@M! | d8 e@7! e8 e7! | a+aM!4 r | a+aM!~ a+aM8 r |
}
{{ end }}

{{ define "lyrics" }}
\lyrThree
"1." \column {
  "Поблискують черешеньки"
  "В листі зелененькім,"
  "Черешеньки ваблять очі"
  "Діточкам маленьким."
}
"2." \column {
  "Дівчаточко й хлоп'яточко"
  "Під деревом скачуть,"
  "Простягають рученята"
  "Та мало не плачуть."
}
"3." \column {
  "Раді б вишню з'їсти –"
  "Та високо лізти,"
  "Ой раді зірвати –"
  "Та годі дістати!"
}
\lyrTwo
"4." \column {
  "– Ой вишеньки-черешеньки,"
  "Червонії, спілі,"
  "Чого ж бо ви так високо"
  "Виросли на гіллі?"
}
"5." \column {
  "– Ой того ми так високо"
  "Виросли на гіллі –"
  "Якби росли низесенько –"
  "Чи то ж би доспіли?"
}
{{ end }}
