{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  c''=''4\mf c8( bes a4) | c4( bes g) | c( f, d' | c2.) |
  bes='4\p bes8( a g4) | c( a f) | g( d a' | g2.) |
  r4\mf c=''8( bes a4) | c( bes g) | c( f, d' | c2.) |
  r4\p bes='8( a g4) | c( a f) | a( g) g-. | f='2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f=2.\(-\frBass | g | a2 bes4 | a2.\) |
  g=2.\( | a2. | bes2 b4 | c2.\) | f,\( | g | a2 bes4 | a2.\) |
  g=2.\( | a | bes4 b c | f,=2.\) |
}
{{ end }}
