{{ define "rh1" }}
  {{ .a }} b c d e4 \af 4\! e) | e8(\> d g f {{ .b }} |
{{ end }}

{{ define "rh2" }}
  e=''8(\< d g f e4 \af 4\! d='') | c8(\> {{ .a }} b e d {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `a'='8(\p\<` `e4 \af 4\! d='')`) }}
  {{ template "rh1" (w `a='8(\<` ` \af 2\! e=''2)`) }}
  {{ template "rh2" (w `` `a4 \af 4\! c='')`) }}
  {{ template "rh2" (w `^\tRit` ` \af 2\! a='2)`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  r4 <a= c e>8-\frBass r r4 4 | r <a b f'>8 r r4 4 |
  r4 <a= c e>8 r r4 4 | r <g b f'>( <c=' e>2) \clef treble |
  r4 b=4( c d | e f c e) | f( b, c d) | r8 e( f[ g] a4 a,=) |
}
{{ end }}
