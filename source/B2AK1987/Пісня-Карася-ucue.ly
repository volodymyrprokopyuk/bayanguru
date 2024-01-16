{{ define "lh1" }}
  bes=,8 besM! bes besM | ees eesM! ees eesM | bes besM! bes=, besM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  bes'='8-.\mf 8-. 8-. 8-. |
  bes='16( a bes c d8)-. bes-. |
  ees=''8-. g,-. g16( f g a |
  bes='16 a bes c d8)-. bes-. |
  c=''8 c a a | g16( a bes a c bes a g) |
  f='16( g a bes c8)-. cis-. |
  d=''8-. bes-. bes16( a bes8) |
  ees=''8 g,16\( f g f g a |
  bes='16 a bes c d8\)-. bes-. |
  a='16\( bes c d ees f g a |
  bes=''8\) bes16( a bes=''8) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  bes,=,8-\stBass besM! bes besM |
  {{ template "lh1" }}
  f=,4( fis | g8) gm! e' c@7! | f,8 f7! f f7 |
  {{ template "lh1" }}
  f=,8 f7! f f7 | bes=, besM! bes+besM r |
}
{{ end }}
