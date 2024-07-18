{{ define "rh1" }}
  a=8\f e' f4-> e8 d | \rep 3 { a=8 e' d4-> c8 b= | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Vivo"
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 1,1,1
  {{ template "rh1" }}
  a=8 e' f4-> e8 d | \rep 2 { a=8 e' d4-> c8 b= | } | a4 a=2-> %
  \keyCancelBarChange \bar "||"

  \key d \minor
  d='8\p a' bes4-> a8 g | \rep 3 { d='8 a' g4-> f8 e=' | }
  d='8 a' bes4-> a8 g | \rep 2 { d='8 a' g4-> f8 e=' | } | d4 d='2-> %
  \keyCancelBarChange \bar "||"

  \key a \minor
  {{ template "rh1" }}
  a=8 e' f-> g e d | \rep 2 { a=8 e' d e c b= | } | a4 a=2-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass d@m! e@7!4 | \rep 6 { a=,4 d@m! e@7!4 | } | a=,4 am! am |

  \key d \minor
  \rep 7 { d=4 g@m! a@7!4 | } | d=4 dm! dm |

  \key a \minor
  \rep 7 { a+am!4 d+dm! e+eM! | } | a+am!4 a+am2 |
}
{{ end }}
