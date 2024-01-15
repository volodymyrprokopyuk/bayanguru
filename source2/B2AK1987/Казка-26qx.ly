{{ define "lh1" }}
  r8 {{ .a }} r | r cis+a@M! r8 | r8 b+bm! r | r cis+a@M! r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 3/8
  b'='8(\p fis) fis | a(\> \af 4\! fis4) |
  b='8( fis) fis | a(\> \af 4\! fis4) |
  d'=''8(\mp cis b) | b(\< \af 16.\! ais) ais |
  b='8( a g) | g(\>^\tRit \af 4\! fis4) |
  cis='8\(^\tATem d e | fis b, b\) |
  e='8\(_\dCre fis g | a d,4\) |
  a'='8\( b d | cis b a\) | b\( cis d | e a, a\) |
  fis='8\(\mf e d | a' e\) e | d\( cis b | cis a b |
  cis='8 d e\) | fis\(_\dDim^\tRit cis cis |
  cis'=''8 fis, fis' | fis4.\) \fermata |
  b,='8(\p^\tATem fis) fis | a( fis4) |
  b='8( fis) fis | a( fis4) | d'8( cis b | cis a) a |
  d=''8(_\dDim^\tRit b e | fis b,) b=' \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  {{ template "lh1" (w `b+bm!-\stBass`) }}
  r8 d+b@m! r8 | r cis+fis@7! r8 |
  r8 b+bm! r | r ais+fis@7! r8 |
  e=8[( fis@M!) fisM8] | d+b@m!4 r8 |
  g,=,8[( a@M!) aM8] | fis+d@M! r8 dM |
  f=,8[( d@m!) dm8] | e+a@7! r8 r |
  d'=8[( e@M!) eM8] | cis+a@M! r8 r |
  b+e@m!4 r8 | a+aM!4 r8 | a+d@M!4 r8 | a+aM!4 r8 |
  g+e@m!4 r8 | fis+fis7!4.~ |
  fis+fis74.~ | fis+fis74. \fermata |
  {{ template "lh1" (w `b+bm!`) }}
  b+bm!4 r8 | a+aM!4 r8 |
  g+gM!4 r8 | b+bm!4 r8 \fermata |
}
{{ end }}
