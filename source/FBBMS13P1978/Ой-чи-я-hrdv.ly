{{ define "rh1" }}
  {{ .a }} fis8 gis a4.) e8( | a a g f e2) |
  e='8( c' b a gis4 e8 e) | e8( c' b4 \af 2\! {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  {{ template "rh1" (w `e'='4(\p` `a='2)\>`) }}
  \duo {
    {{ template "rh1" (w `e'='4(\mf` `a='2)\<`) }}
    b='8 \rest \mf e,='8\< e' d c e fis \af 8\! gis | a c b a g4. gis8 |
    a=''8( c b a gis4 e8 e) | e(\> c' b4 \af 2\! a=''2) \bar "|."
  } {
    e'='4 d c2 | d4 b c4. d8 | e4 f e d | c8 e gis f e='2 |
    s4 c'=''8 b a4 d | c8 e d4 c4. d8 | c e dis4 e e8 e |
    e=''8 ees d4 c=''2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \meter 1/4 1,1,1,1
  r2 e=4(-\frBass fis8 gis | a4.) b8( c a g f |
  e=2) e8( c' b a | gis4 e8 e) a2 | e'8 d c b a4 g |
  f=4 g c b | a d, e fis8 gis | a4 d, c c'8( d=') \clef treble |
  e='4( fis8 gis a2~ | a4 g8 f e d c bes) | a4 b e8 d c b= \clef bass |
  a=8 g f e a4 a,=, |
}
{{ end }}
