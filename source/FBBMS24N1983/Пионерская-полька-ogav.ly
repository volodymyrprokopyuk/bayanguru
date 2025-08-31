{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key bes \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      d''=''16(->\mf c bes8) bes(-> f) | c'16(-> bes g8) g4-> |
      c=''16(-> a g8) g(-> f) | a16(-> g f8) g16 a bes c |
      d=''16(-> c bes8) ees16 d c b | d c b c g8 c |
      \alternative {
        \volta 1 {
          <ees='' f>8-> f,16 g f g f g | f(-> g f8) g16 a bes c='' |
        }
        \volta 2 {
          <ees='' f>8-> f,16 g f g f g | f ees' d c bes='8 r \fine |
        }
      }
    }

    \volta 2
    \repeat volta 2 {
      \acc { cis=''8 } d=''8 g, g16 bes a g | <ees g> a <ees g>8 4 |
      \acc { d'=''8 } ees=''8 a, a16 c bes a | <bes d>16 16 <a bes d>8 16 16 <g bes d>8 |
      \acc { cis=''8 } d=''8 g, g16 bes a g | <ees g> a <ees g>8 8 <c ees> |
      \alternative {
        \volta 1 {
          <c=' d>16(-> ees <c d>8) <c a'> <c d> | <bes d>16(-> ees <bes d>8) <bes= g'> r |
        }
        \volta 2 {
          <c=' d>16 ees <c d> ees <c d>8 <c a'> | <bes g'>4-> <c=' ees a>-> \bar "||"
        }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  bes,=,8-\stBass besM! d bes@M | c8 cm! ees c@m | f8 f7! ees f@7 |
  d=8 bes@M! c8 f@7! | bes8 besM! b g@7! | c8 cm! ees c@m | f8 f7! des4 |
  c=8 f@7! f+f78 r | f8 f7! des4 | c=8 f@7! bes+besM!8 r |

  g=,8[ gm! gm] r | c cm! a c@m | fis'8 d@7! d8 d7 |
  g@m!8[ g,=,8] ees@M![ g8] | g@m![ g8 gm] r | c cm! a c@m |
  d=8[ d7! d7] r | g,[ gm! gm] r | d' d7! r d+d7 | g,=, gm! f+f7!4 |
}
{{ end }}
