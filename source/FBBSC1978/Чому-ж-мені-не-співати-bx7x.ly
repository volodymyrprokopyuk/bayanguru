{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 4/4
  \repeat volta 2 {
    f'='4(\p f e a | d,2. e4) | f(_\dCre f e a d,2. e4) |
    a='4( a bes bes | a2 g4 g) | f(_\dDim f e a | d,2. e4) |
    a='4(\p a bes bes | a2 g4^\tRit g) | f(^\tATem f e a | d,='1) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d'='2\(-\frBass c | b bes | a g | f e\) | f\( c | f e | d c | bes a\) |
  f'=2( g | a bes) | a( g | f4 e d=2) |
}
{{ end }}
