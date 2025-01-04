{{ define "rh1" }}
  g='8-. g( a b) c4( b8 d) | a4-. <fis a>-. g-. g-. |
  g='8-._\dCre g( a b) c4( b8)-. b-. |
  a='8( g a b) c4( b8)-. b-. | a(_\dDim g a b) c4(^\tRal b8)-. b='-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key e \minor
  \time 4/4
  d''=''4.(\mp c8) b4-. d-. | <fis, a>4 4 g g |
  {{ template "rh1" }} | a='8-. g-. a4-- <fis a>8-. 8-. g='4-- |

  r2\p e4-.^\tATem g-. | \duo { fis'='4( g8 a=') } { e'='2 } %
  <dis=' g>4-. <dis fis>-. | <e g>4.(_\dCre a8) b4-. g-. |
  \duo { a'='4( b8 c) } { g'='2 } <fis b>4-. <fis a>-. |
  d'=''2--\mf cis8( b b4)-. | d2-- cis8( b cis4)-. |
  d=''2--_\dDim c8( b a4)-. | b2 a8( g fis4)-. | <fis=' b>1~\p | 1^\tRal |

  r2\mp <g=' d'>4-.^\tATem <g b>-. |
  <g=' c>4-. \duo { d''=''8( c='') } { fis'='4 } <g b>4-. g-. |
  {{ template "rh1" }}
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
