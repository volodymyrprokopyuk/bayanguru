{{ define "rh1" }}
  {{ .a }} e16( f e c' b8) | e, e16( f e b' a=''8) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} c-. gis-. d'-. | b-. d-. a-. c=''-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `e''=''8\mp`) }}
  c='''8( b16 a) g( a g8) | f16( g f8) e4-> |
  {{ template "rh1" (w `e=''8`) }}
  c='''8( b16 a g f e d) | c8-. b-. a( d='') |

  c=''8(\p b16 a b_\dCre e d8) | d( c16 b c f e8) |
  e=''8( dis16 cis b cis dis e | fis8\mf a \af 4\! gis4)\> |
  {{ template "rh1" (w `e=''8`) }}
  c='''8(^\tRit b16 a g f e d) | c8-. b-. a='-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  {{ template "lh1" (w `a'='8-.-\frBass`) }}
  d=''8-. f-. c-. r | g-. b-. c16( d c b) |
  a='8-. c-. e,-. gis-. | b-. d-. a-. c-. |
  f,='8-. a-. d-. r | e,-. gis-. a='-. r |

  d,='8[-> f-. g]-. r | c,[-> e-. g]-. r |
  b,=8[-> fis'-. a]-. r | r4 e16( d' c b) |
  {{ template "lh1" (w `a='8-.`) }}
  f,='8-. a-. c-. r | e,-. gis-. a='-> r |
}
{{ end }}
