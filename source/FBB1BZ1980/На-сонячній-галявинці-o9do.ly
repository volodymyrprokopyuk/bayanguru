{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \minor
  \time 2/4
  \meter 1/2 #'(1)
  d'='8\(\p e f g | a4 d | bes d | a2\) |
  d,='8\( e f g | a4 f' | e d | a2\) |
  a='8(\mf c bes a | d4 g,) | g8( bes a g | c4 f,) |
  f='8( a g f | bes4 e,) | a(\> \af 4\! g | f2)\p |
  a='8(\mf ees' d c | bes4 g) | g8( d' c bes | a4 f) |
  f='8( c' bes a | bes4 e,) | f(\> \af 4\! e | d='2)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  \meter 1/2 #'(1)
  R2 | R2 | g'='2(-\frBass | d) | R2 | R2 | c8( d e4 | f2) |
  fis='4( d | g8 f e d) | e4( c | f8 e d c) |
  d='4( bes | g d') | cis2( | d) |
  d='4( fis | g8 f e d) | c4( e | f8 e d c) |
  bes=4( d | g, gis) | a8( b cis4 | d='2) |
}
{{ end }}
