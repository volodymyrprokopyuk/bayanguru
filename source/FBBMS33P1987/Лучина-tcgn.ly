{{ define "rightHand" }}
\relative {
  \tempo Cantabile
  \clef treble
  \key g \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  bes'='4(\mf g ees'4. d16 c | d4~ d16 a bes a g4) g8( a |
  bes='4 g g'4. f16 ees | d4 g, c2) | bes8( g ees' d c d16 ees d8 c |
  bes='4. a16 g f4 d) | g4.( ees'8 d c bes a | \af 2.\! g'=''2.)\> r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/4 1,1,1,1
  R1 | R1 | g=4(-\frBass g ees'4. d16 c | bes4 g c4. bes16 a |
  g=4) g8( bes a g f a | g4 d d2) | g8( ees d c d a' g f | g=2.) r4 |
}
{{ end }}
