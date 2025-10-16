{{ define "rh1" }}
  {{ .a }} b8 c4 a | e' c b a) | gis( b {{ .b }} gis,8 | {{ .c }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `a'='4.(\mp` `e4.` `a='1)`) }}
  {{ template "rh1" (w `a='4.(` `e4.` `a='1)`) }}
  c=''4.\(\mf\< g8 c4 \af 4\! e | g2 f4 e | d2 g4. f8 |
  e=''4\> d c \af 4\! b\) |
  {{ template "rh1" (w `a='4.(\mp` `e4.^\tRit` ` \af 1\! a='1)\> \fermata`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  r2 a=4.(-\frBass b8 | c4 a e' c | b a) gis( b | e4. gis,8 a2~ |
  a=2) a4.( b8 | c4 a e' c | b a) gis( b | e4. gis,8 a=2) |
  r2 \clef treble c='4.\( g8 | c4 e g2 | f4 e d2 |
  g='4. f8 e4 d | c b=\) \clef bass a=4.( b8 | c4 a e' c |
  b=4 a) gis( b | e4. gis,8 a=2) \fermata |
}
{{ end }}
