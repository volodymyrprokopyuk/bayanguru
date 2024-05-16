{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 2/4
  a'='4(\p f8 d | bes'4 g) | g( e8 c | a'4 f) |
  f='8( e bes4) | e8( d a4) | b(\< cis8 d | e4 f8 \af 8\! g) |
  a='4(\mf f8 d | c'4 bes) | g( e8 c | bes'4 a) |
  f='8( e bes4) | e8( d a4) | b(\>^\tRit cis8 f | \af 2\! d='2) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=2\(-\frBass | g, | c | f,\) | g\( | a | e' | cis4 a\) |
  d=2\( | g, | c | f,\) | g\( | a | e'4 a, | d d,=,\) \fermata |
}
{{ end }}
