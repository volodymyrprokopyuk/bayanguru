{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key g \minor
  \time 4/4
  g''=''4.(\mp d8 d4 d | ees d c bes) | c8( d ees4 d4. c8 | c bes a bes g2) |
  g'=''4.( d8 <bes d>4 4 | <d f>4. <c ees>8 <bes d>4 bes) |
  c=''8( d ees g <bes, d>4. c8 | c bes a bes g='2) |
  a='4.( a8 d4. fis,8 | g a bes d c bes a g) |
  a='4( ees' d4. c8 | c bes a bes g2) |
  a='4.( a8 <fis d'>4. <a c>8 | bes c d g <a, f'>4. <c ees>8) |
  <bes=' d>4.( c16 bes a4 <fis d'> | <g bes> a g='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,4-\stBass gm! g8( a bes4) | c( d ees) c@m! |
  a,=,4 c@m! bes4 g@m! | d4 d7! g, gm! |
  g=,4 gm! g8( a bes4) | a f@7! bes4 besM! |
  ees=4 c@m! d4 g@m! | d4 d7! g, gm! |
  d'=4 dM! c d@M! | bes4 g@m! g4 gm! |
  d'=4 d7! fis d@7! | g,4 gm! bes g@m! |
  d=4 d7! a d@7! | g8( a bes4) c cm! |
  d=4 g@m! d4 d7! | d+g@m! d+d7!4 g+gm!2 |
}
{{ end }}
