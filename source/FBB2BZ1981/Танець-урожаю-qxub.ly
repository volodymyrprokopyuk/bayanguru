{{ define "rh1" }}
    {{ .a }} c-> | e8-. g-. e4-- | d8( g) g-. f-. | e-. d-. c=''4-- |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a) e-. a-. | gis4( e) | b'8( d) c-. b=''-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} 4-> | 4 4 | b g | a8-. b-. c='4-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 { {{ template "rh1" (w `g'='4->\f`) }} | }
  {{ template "rh2" (w `e=''8(\p`) }} | c-. d-. e4 |
  {{ template "rh2" (w `e,=''8(\p`) }} | a2-- |
  \repeat volta 2 { {{ template "rh1" (w `g,='4->\f`) }} | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `<c'=' e>4->-\frBass`) }}
  <a= c>2 | b8-. c-. d4 | d8-. f-. e-. d-. | e-. d-. c4 |
  c='8( a) c-. a-. | b-. c-. d4 | d8( f) e4 | a( a,) |
  {{ template "lh1" (w `<c=' e>4->`) }}
}
{{ end }}
