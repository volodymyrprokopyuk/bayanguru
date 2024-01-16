{{ define "rh1" }}
  {{ .a }} e-. c-. e-. | b16( d c b a b c d) |
  e=''8-. e-. c-. e-. | b16( d c b a='4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} e@7! e8 e7 | a, am! e'= a@m |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `e''=''8-.\mp`) }}
  {{ template "rh1" (w `e'=''8-.`) }}

  gis='4( e8)-. e-. | e'16( d c b a8)-. a-. |
  gis='4( e8)-. e-. | a16( b c d e4) |
  e=''4( b8)-. d-. | c16( d c b a b c d |
  e=''16 f e d c d c b | a8) a a='4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  <a,=, e'>4-\puBass r |
  \rep 3 { <a=, e'>4 r | }
  \rep 3 { <a=, e'>8 r <a=, e'> r | }
  <a=, e'>8 r <a e'>4 |

  {{ template "lh1" (w `b=,8-\stBass`) }}
  {{ template "lh1" (w `b=,8`) }}
  gis,=,8 e@7! e'8 e7 | a, am! e' a@m |
  b=,8 e@7! e8 e7 | a,=, d@m! a@m!4 |
}
{{ end }}
