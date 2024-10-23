{{ define "rh1" }}
  d=''8( f e d) | c-. c-. c-. e-. | d( f e d) | c8( a gis e=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! g c@M | d'8 g@7! g,=,8 g7 |
{{ end }}


{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  c''=''8-.\mf c-. c-. e-. | {{ template "rh1" }}
  a='8-. a-. a( b) | c( a gis e) | a-. a-. a='4-- |
  c=''4(\f e) | {{ template "rh1" }} | a4 a8( b) |
  c=''8( a gis e) | a-. a-. a='4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `c=8-\stBass`) }} {{ template "lh1" (w `c=8`) }}
  a=,8 am! b e@7! | c8 a@m! d8 dm! | e a@m! e8 e7! | a,=, am! am4 |

  \rep 2 { {{ template "lh1" (w `c=8`) }} } | a=,8 am! b e@7! |
  a=,8-- g-- f d@m! | e'8 a@m! e8 e7! | a,=, d@m! a@m!4-> |
}
{{ end }}
