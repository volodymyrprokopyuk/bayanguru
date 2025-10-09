{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 4/4
  g'='4(\mp d' c g8 a | bes4 a8 g fis4 d) | g4( bes d2) |
  c=''8(\< bes a g c4 \af 4\! ees='') |
  \duo {
    d''=''4(\mf d c g8 a | bes4 a8 g fis4 d) |
    g='4( d' c g8 a | <g bes>4)\>^\tRit a8( c \af 2\! g='2) \bar "|."
  } {
    g'='4 f ees2 | d c | d4 f ees2 | d4 c8( c bes=2) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  bes=2( ees | d c) | bes4( g bes f) | ees( c ees c) |
  bes=,2( a | g a) | bes( c | d4) fis( g=2) |
}
{{ end }}
