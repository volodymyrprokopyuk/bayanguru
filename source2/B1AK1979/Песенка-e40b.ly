{{ define "rh1" }}
  {{ .a }} c e4 | c2) | c8( a c4 | a='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `e''=''8(\p`) }}
  a='8(\< c e \af 8\! a | g\> e \af 4\! e4) |
  fis=''8( d d fis | e2) |
  {{ template "rh1" (w `e=''8(`) }}
  a='8( d f a | e c c4) | c8( a a c | a2) |
  a'=''4.( g8 | a2) | g4.( f8 | g2) |
  a,='8( d f a | e c c4) | c8(^\tRit e, e b' | a2) |
  <f'='' a c>4.( <b, d g>8 | <c='' e a>2) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4 am! | e' e7! | a, am! | d dM! |
  a=,4 am! | e' em! | b gm! | e em! |
  a,=,4 am! | e' e7! | e a@m! | d4 dM! |
  g,=,4 g7! | c cM! | d dM! | a am! |
  e'=4 a@7! | d4 dm! | g, g7! | c cM! |
  d=4 dm! | e a@m! | e4 e7! | a, am! |
  d=4-- dm!-- | a+am!2 \fermata |
}
{{ end }}
