{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  \partial 4 { e''=''8(\mf e | }
  f=''8 e d c | e d c b | a4) e'8(\mp e | f e d c | e d c b | a4) c8(\mf c |
  d=''8 c b a | e4 c'8 b | a4) c8(\mp c | d c b a | e4 c'8 b | a='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \partial 4 { r4 | }
  d=4-\stBass dm! | e eM! | a, am! | \rep 2 { d=4 dm! | e eM! | a,=,4 am! | }
  d=4 dm! | e= eM! | a+am! %
}
{{ end }}
