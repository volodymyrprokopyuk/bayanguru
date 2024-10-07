{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  g''=''8(\mf f e d c4) r | f8( e d c b4) r |
  e=''8( d c b a4) r | d8( c b a g4) r |
  \rep 2 { g='8( a b c='') } |
  a='4( f' e d) | c( b f' b, | c='') r r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c+cM!4-\stBass r r2 | g+g7!4 r r2 |
  a+am!4 r fis+d@7! r4 | g+gM!4 r r2 |
  e+c@M!4 r4 e+c@M r4 | f+d@m! r4 f+d@m r4 |
  g+g7!4 r g+g7 r | c+cM!4 r r2 |
}
{{ end }}
