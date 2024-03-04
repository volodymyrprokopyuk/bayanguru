{{ define "rh1" }}
  {{ .a }} d d | d8( c b a g4) | c8( d e2) | e4( d=''2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/4
  {{ template "rh1" (w `d''=''4\mp`) }}
  {{ template "rh1" (w `d=''4`) }}
  c=''8(\p b a4) a | b8( a g4) g | c8(_\dCre b a4) a | b8( a g2) |
  \duo { c''=''4( b c | d2\mf^\tRit c=''4) | } { g'='2.~ | g=' | }
  b='8(\>^\tATem c b4) a | g \af 4\! g='\p r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g=4(-\frBass <b d>4)-. 4 | g( <b d>4)-. 4 |
  g=4_\aSim <c e>4 4 | \rep 3 { g=4 <b d>4 4 | }
  g=4 <c e>4 4 | g <b d>4 4 |
  r4 r <a= d>4 | r r <b d> | r r <c d> | r r <b d> |
  e='4( d <c e~> | <a e'>2.) | r4 <fis c'>4 4 | <g= b>4 4 r |
}
{{ end }}
