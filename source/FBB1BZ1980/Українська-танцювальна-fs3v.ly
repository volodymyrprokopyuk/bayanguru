{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \minor
  \time 2/4
  g'='8[(\mf d' bes d] | ees4 d8 c | bes c d4) |
  g,='8[( d' bes d] | c4 bes8 a | g g g4) |
  g='8[( bes g bes] | c4 bes8 a | g f bes4) |
  g='8[( bes g bes] | c4 bes8^\tRit a | g g g='4) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  g'='2-\frBass | fis | f | e | ees | d |
  c='4( bes= \clef bass a= g8 f | ees4 d) |
  ees=8[( g bes d='] \clef treble ees='2 | f8 ees d='4) \fermata |
}
{{ end }}
