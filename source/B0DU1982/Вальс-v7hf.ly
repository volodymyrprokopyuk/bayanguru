{{ define "rh1" }}
  r4 {{ .a }} a | g2 e'4 | c2 a4 | a2 g='4\) |
{{ end }}

{{ define "rh2" }}
  r4 g='4\( a | g2 f'4 | a,2 b4 | {{ .a }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! cM | g c@M! cM4 | d'= g@7! g74 |
{{ end }}

{{ define "lh2" }}
  g,=,4 g7! g7 | b g@7! g74 | g g7! g7 | c= cM! cM |
{{ end }}

{{ define "lh3" }}
  {{ .a }} e@7! e74 | e' e7! e7 | a,=, am! am |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key c \major
  \time 3/4
  {{ template "rh1" (w `g'='4\(\mf`) }}
  {{ template "rh2" (w `c=''2.\)`) }}
  {{ template "rh1" (w `g='4\(`) }}
  {{ template "rh2" (w `c=''2.~`) }}

  c=''4\) e\(\mp e | e2 d4 | c2 b4 | c2 a4\) |
  r4 e'=''4\( e | e2 d4 | c2 b4 | a2.~ |
  a='4\) c\(\p c | c2 a4 | c2 aes4 | c2 g4\) |
  r4 g='4\( g | a2 c4 | b2 d4 | c2.~ | c=''4\) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  R2. | {{ template "lh1" (w `c=4-\stBass`) }}
  {{ template "lh2" }}
  g=,4 c@M! cM4 | {{ template "lh1" (w `c=4`) }}
  {{ template "lh2" }}

  c+cM!4 r r | {{ template "lh3" (w `gis=,4`) }}
  e'=4 a@m! am4 | {{ template "lh3" (w `gis,=,4`) }}
  a=,4 r r | f' fM! fM | f fm! fm |
  \rep 2 { e=4 c@M! cM4 | }
  f=4 fM! fM | g, g7! g7 | c cM! cM | c= r r |
}
{{ end }}
