{{ define "rh1" }}
  {{ .a }} e, e'8 d c b) | a4( e d'8 c b a=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} em! em em g[-- e@m em8 em] |
  a=,8-- am! am am {{ .b }} a@m am8 am] |
  b=,8-- b7! b7 b7 dis[-- b@7 b78 b7] |
  e,=,8-- em! em em b'-- {{ .c }} |
{{ end }}

{{ define "lh2" }}
  g=,8[-- e@m! em8 em] gis[-- e@7! e78 e7] |
  a=,8[ am!] g a@m fis8 d@7! d'=8 d7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 4/4
  b'='4(\p e, e'8 d c b) | c4( a~ a8 g fis e) |
  fis='4( b, b'8 a g fis) | g( a b2)\> \af 4\! r4 |
  {{ template "rh1" (w `b='4(\mp`) }}
  g='4( e c'8 b a g=') | fis4.( e8 dis='4.)\> \af 8\! r8 |

  e='8(\mf b a b e d c b) | c( b a4~ a8 g fis e) |
  fis=8( g a4~ a8 c b a) |
  g=8( a b4) r8 fis'8--\>^\tRit g-- \af 8\! a-- |
  {{ template "rh1" (w `b='4(\p^\tATem`) }}
  g='4( e a8 g fis e) | dis4.(^\tRit e8) e='2-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `e,=,8---\stBass` `fis[--` `b7! b7 b7`) }}
  {{ template "lh2" }}
  c=8-- cM! cM cM a-- am! am am |
  ais=,8[-- fis@7! fis78 fis7] b=,-- b7! b7 b7 |

  {{ template "lh1" (w `e,=,8--` `c[--` `r8 r4`) }}
  {{ template "lh2" }}
  c=8-- cM! cM cM fis,[-- a@m! am8 am] | b=,8-- b7! b7 b7 e+em!2-- |
}
{{ end }}
