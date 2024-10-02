{{ define "rh1" }}
  {{ .a }} dis e4)-. b-. b-. | c-. c-. b2 | a4-.\> a-. g-. g='-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r4 4-. r | <e a>-. r <e g>2 |
  <c=' e>4-. r <b e>-. r | <b dis>-. r e='2 |
{{ end }}

{{ define "lh2" }}
  <a= c>4-. r <e b'>-. r | <f= a>-. r %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key e \minor
  \time 4/4
  {{ template "rh1" (w `e''=''8(\mf`) }} | fis-. fis8( g \af 2\! e2) |
  {{ template "rh1" (w `e'=''8(\mf`) }} | fis8( a g fis \af 2\! e='2) |
  fis='8(\p e fis4)-. g-._\dCre g-. | a8( g a4)-. b2 |
  a='8( g a4)-. b-. b-. | cis8(^\tRit b cis4)-. dis=''2 |

  {{ template "rh1" (w `e=''8(\f^\tATem`) }} | fis-. fis8( g \af 2\! e2) |
  {{ template "rh1" (w `e'=''8(\mf`) }} | fis8( e fis4)-. \af 2\! g='2 |
  f='4-.\p f-. e-. e-. | d(-> c8 d e4)-. e-. |
  f='4-. f-. e-. e-. | d(-> c8 d e='2) |
  c='4-._\dDim c-. b-. b-. | a( g8 a b4)-. b-. |
  a=4-. a-. g-. g-. | fis-.^\tRit fis8( g e2) | <b''=' e>1\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  {{ template "lh1" (w `<e'=' g>4-.-\frBass`) }}
  {{ template "lh1" (w `<e=' g>4-.`) }}
  d='4-. r <b d>-. r | <a d>-. r <g d'>2 |
  <c=' e>4-. r <g d'>-. r | <e' g>-. r <b= fis'>2( |

  {{ template "lh1" (w `<e=' g>4)-.`) }}
  <e=' g>4-. r4 4-. r | <e a>-. r <e g>2 |
  <c=' e>4-. r <b d>-. r | <d, c'>-. r <g= b>2 |
  {{ template "lh2" (w ``) }} <e b'>-. r |
  {{ template "lh2" (w ``) }} <e= b'>2 \clef bass |
  c=4-. c-. b-. b-. | a( g8 a b4)-. b-. |
  a=,4-. a-. g-. g-. | fis-. fis8( g e=,2) \clef treble |
  <e''=' g>1 \fermata |
}
{{ end }}
