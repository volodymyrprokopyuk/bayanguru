{{ define "vocal" }}
\relative {
  \tempo Moderato
  \clef treble
  \key ees \major
  \time 2/4
  \meter 1/8 1,1,1,1
  \rep 4 { R2 | }
  \repeat volta 2 {
    bes'='8 ees d c | bes c bes aes | g f ees g | bes4 bes |
    bes='8 ees d c | bes c bes aes | g g f bes | ees,4 ees=' |
    \duo {
      R2 | R2 | aes'='8 aes g f | bes4 bes | R2 | R2 | c8 c d d | ees4 ees='' |
    } {
      f'='8 bes, bes bes | g' ees ees ees | R2 | R2 |
      f='8 bes, bes bes | g' ees ees ees | aes8 g f bes | ees,4 ees=' |
    }
  }
  \acc { s8 } \rep 8 { R2 | } \bar "|."
}
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key ees \major
  \duo {
    r8\f ees''=''16 ees f( g) ees8 | bes'2~-> |
    bes=''8 ees,,16[ ees] f( g) ees8 | bes'='2-> |
  } {
    R2 | r8 <c''='' ees>8[-. <bes d>-. <aes c>]-. |
    bes='8 r r4 | <bes, f'>16-. <ees g>-. <f aes>8-. <ees g>-. <bes= f'>-. |
  }

  <g'=' bes>8\f <c ees> <bes d> <aes c> | <g bes> <aes c> <g bes> <f aes> |
  <ees=' g>8 <d f> <c ees> <c g'> |
  \duo { bes'='2 | } { r8 bes=16-> c-> bes8-> bes=-> | }
  <g''='' bes>8 <c ees> <bes d> <aes c> | <g bes> <aes c> <g bes> <f aes> |
  <ees='' g>8 8 <d f> <d bes'> | ees d c bes |
  \duo { f'='2\p | g | aes4 g8 f=' | }
  { f'='8[ <aes, bes>8 8 8] | g'[ <g, bes>8 8 8] | r ces[ r ces='] | }
  bes='8\< ees16 ees f( g) \af 8\! ees8 |
  \acc { e'='''8 } f='''8 r r4 | \acc { fis='''8 } g='''8 r r4 |
  <ees,='' aes c>8 r <f aes d> r | <ees='' g ees'> r8 4-> |

  \acc { e=''8 } f=''8[(\mf bes,) bes-. bes]-. |
  \acc { fis'=''8 } g=''8[( ees) ees-. ees]-. |
  \acc { g=''8 } <aes,=' aes'>[ 8 <g g'> <f f'>] |
  \duo { bes'='2 | } { r8 ees'='16 ees f( g) ees='8 | }
  \acc { e''='''8 } f='''8[( bes,) bes-. bes]-. |
  \acc { fis'='''8 } g='''8[( ees) ees-. ees]-. |
  \ottava #1 <aes,='' aes'>8 <g g'> <f f'> <bes bes'='''> \ottava #0 |
  <ees,='' ees'>4 <ees='' g bes ees> \arpeggio |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  \rep 4 { R2 | }

  \rep 2 { ees@M!8 r8 r4 | } | aes@M!8 r8 aes@M r8 |
  r8 bes,=,16-> c-> bes8-> bes-> | ees@M! r8 aes@M! r8 |
  ees@M!8 r8 f@m! r8 | aes@M! r8 bes@7! r8 | ees@M! r8 ees@M r8 |
  \rep 2 { r8 d=8[-. c-. bes=,]-. | } | r bes+besM! r bes+bes7! |
  r8 ees@M!8[ eesM8 eesM] | bes@M![ besM8 besM besM] |
  ees@M!8[ eesM8 eesM eesM] | bes+aes@M! r8 bes+bes7! r |
  ees@M!8 r8 ees+eesM!4-> |

  d=8 bes@7! d8 bes@7 | ees8 eesM! ees eesM |
  ees=8 f@m!8 ees8 f@m | ees@M!8 r8 r4 |
  bes@M!8[ besM8 besM besM] | ees@M![ eesM8 eesM eesM] |
  r8 f+fm! r bes+besM! | r4 ees+eesM! |
}
{{ end }}

{{ define "lyrics" }}
\lyrTwoColFour
"1." \column {
  "Два півники, два півники"
  "Горох молотили."
  "Дві курочки чубарочки"
  "До млина нисили."
}
"2." \column {
  "Цап меле, цап меле,"
  "Коза насипає."
  "А маленьке козенятко"
  "На скрипочці грає."
}
"3." \column {
  "Танцюй, танцюй, козуленько,"
  "Ніженьками туп, туп."
  "Татусенько з матусею"
  "Принесуть нам круп, круп."
}
"4." \column {
  "А вовчок-сірячок"
  "З лісу виглядає"
  "Та на біле козенятко"
  "Скоса поглядає."
}
{{ end }}
