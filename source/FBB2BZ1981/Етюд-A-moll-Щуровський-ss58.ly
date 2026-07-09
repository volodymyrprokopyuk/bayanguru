{{ define "rh1" }}
  {{ .a }} a-. gis-. gis-. a-. a-. e=''4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} b-. c-. b-. a-. gis-. a=''4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `a''=''8-.\p`) }}
  {{ template "rh1" (w `a=''8-.`) }}
  c=''8-. c-. d-. d-. b-. b-. e4 |
  c=''8-. c-. d-. d-. b-. b-. c=''4 |

  {{ template "rh2" (w `a'=''8-.\mf`) }}
  {{ template "rh2" (w `a=''8-.`) }}
  c,=''8-.\p c-. d-. d-. b-. b-. e4 |
  c=''8-.^\tRit c-. d-. d-. e-. e-. a=''4-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  c''=''4-\frBass b c a | c b c a | e f g c, | e fis gis a |
  \rep 2 { c=''4 e c8-. b-. c=''4 | } | e, f g c, | b'8-. a-. g-. f-. e4 a,= |
}
{{ end }}
