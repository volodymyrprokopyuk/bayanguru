{{ define "rh1" }}
  {{ .a }} fis g a bes a bes c | d cis d ees d c bes a) |
  g='16( fis g a bes a bes c | d cis d ees d=''8) r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `g'='16(\mf`) }}
    {{ template "rh1" (w `g,='16(\p`) }}

    g=''16(\mf fis g aes g f ees d) | ees( f ees d c d ees e) |
    f=''16( e f g f ees d c) | d( ees d c bes c cis d) |
    ees=''16(\mp d ees d ees c bes a) | d( cis d cis d bes g d) |
    \alternative {
      \volta 1 {
        cis='16(\< e g bes) ees,( fis a c) |
        e,='16( g bes cis) fis,( a c \af 32.\! d='') |
      }
      \volta 2 {
        ees,='16( g bes ees) d,( fis a d) | g,( bes d g g,='4) \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,8-\stBass gm! bes g@m | d8 d7! fis, d@7 | g8 gm! d' g@m | a8 d@7! fis8 d@7 |
  g=,8 dm! d' g@m | fis,8 d@7! a8 d@7 | bes8 g@m! g8 gm | fis d@7! d'=8 d7 |

  g,=,8 g7! b g@7 | c8 cm! ees c@m | f,8 f7! a f@7 | bes8 besM! bes+besM r |
  c+cm!8 r r a+c@m! | bes+g@m!8 r8 r g+gm! | a+a7! r b+b7! r |
  cis+a@7!8 r8 d+d7!4 | ees+eesM! d+d7! | g+gm! g=, |
}
{{ end }}
