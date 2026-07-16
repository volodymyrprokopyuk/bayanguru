{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  f'='8-.\mf c-. gis'( a)-. | f(-> a)-. gis-. a-. |
  g='8-. c,-. a'( bes)-. | g(-> bes)-. a-. bes-. |
  g='8-. e-. cis'( d)-. | e-. e-. d-. d-. |
  c=''8-.\< a-. f-. \af 8\! des-. | des4(->\sf c=')-. |

  f='8-.\f c-. gis'( a)-. | f-.\mp a16-. a-. gis8-. a-. |
  g='8-.\f d-. a'( bes)-. | g-.\mp bes16-. bes-. a8-. bes-. |
  g='8-._\dCre d'16-. d-. cis8-. d-. | cis-. d-. e(-> d)-. |
  <bes=' c>8\mp\< <bes cis> <bes d> \af 8\! <bes e> |
  <a=' f'>4\f <f,= f'>-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
}
{{ end }}
