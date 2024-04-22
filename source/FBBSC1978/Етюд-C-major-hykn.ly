{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  c'='8\mf d_\aSta e d | c4 d8 e | f g f e | d2 |
  d='8 e f e | d4 e8 f | g a g f | e2 |
  e='8 f g f | e4 f8 g | f g a g | f4 g8 a |
  g='8 a b a | g4 a8 b | c d e d | c=''4 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8-\frBass r <e g c> r | c r <e g c> r |
  \rep 2 { d=8 r <f= a d> r | } \rep 2 { g=8 r <b= d> r | }
  \rep 4 { c,=8 r <e= g c> r | }
  \rep 2 { d=8 r <f= a d> r | } \rep 2 { g=8 r <b= d> r | }
  <c,,=, e g>8 r r4 | 4 r |
}
{{ end }}
