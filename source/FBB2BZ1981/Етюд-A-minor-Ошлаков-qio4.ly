{{ define "rightHand" }}
\relative {
  \tempo Andantion
  \clef treble
  \key a \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  a'='8(\mf e' d e c d b c | f, c' b c a b gis gis) |
  a='8(\> e d e c e b \af 8\! e | a,\< c e gis a c^\tRit e \af 8\! a) |
  g=''8(\mf^\tATem a f g e f d e | c d b c a b gis4) |
  a='8^(\> e d e c e b \af 8\! e | a, c e gis a='4) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \meter 1/4 1,1,1,1
  a'='8-\frBass c b c a b f e | d a' gis a f4 e8 d | c4 b a gis | e8 a c e a, a' g f |
  e='4 d c b | a gis= \clef bass f= e8 d | c4 b a gis | a c8 e a4 a,=, |
}
{{ end }}
