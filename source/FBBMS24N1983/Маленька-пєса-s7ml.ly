{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  c'='8(\mf e a c b4 a | g f e d) | g8( f e d) g( f e d) |
  c='8( b c d e2) | c8(_\dCre e a c d4 c) | e,8( a c e f4\f e) |
  d=''8(_\dDim c b a b c d e | f4) g-- a=''2--\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  r4 a'='4(-\frBass g f | e d c b=) \clef bass | a=( g f e |
  d=2) e8( d c b) | r4 a( b c) | r a( d e | f1~ | f4) e-- a=2-- |
}
{{ end }}
