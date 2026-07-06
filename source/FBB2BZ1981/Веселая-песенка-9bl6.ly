{{ define "rh1" }}
  {{ .a }} c8 | f,4. a8) | d,4.( e8 | f)-. f-. {{ .b }} |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a-. a( c) | f,-. f-. f( a) | d,-. d=''-. %
{{ end }}

{{ define "lh1" }}
  {{ .a }} f-. f( e) | d-. d-. d( c) | bes-. bes='-. %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `a'='4.(\mf` `f='( g)`) }}
  {{ template "rh1" (w `a='4.(` `f='4--`) }}

  {{ template "rh2" (w `a'=''8-.\mp`) }} d( e) | f-. f-. f( g) |
  {{ template "rh2" (w `a=''8-._\dCre`) }} d( e | f=''2)\f |
  d=''8-.\p d-. d( e | f2) | d8-.\f d-. d( e | f2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  f'='4.(-\frBass e8 | d4. c8) | bes4.( c8 | d)-. d-. d( e) |
  f='4.( e8 | d4. c8) | bes4.( gis8 | a)-. a-. a=4-- |

  {{ template "lh1" (w `f''=''8-.`) }} bes( c) | d8-. d-. d( e) |
  {{ template "lh1" (w `f=''8-.`) }} bes( c | d=''2) |
  bes='8-. bes-. bes( c | des2) | bes8-. bes-. bes( c | a='2) |
}
{{ end }}
