{{ define "rh1" }}
  {{ .a }} d \af 4\! e | f2 e4 | d2 a4 | c2\> bes8 a | \af 2.\! g2. |
  g='4 bes d | <f, a>2 <e g>4 | <d f>2 {{ .b }} <cis=' e>4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 3/4
  R2.\p | d'='4_\aLeg f a | d2\< \af 4\! a4 | g2 f4 | f2.\> | \af 2.\! e |
  g='4\< a \af 4\! bes | a2 g4 | f2\> e4 | \af 2.\! d2. |
  {{ template "rh1" (w `a'='4\mp\<` `\>`) }} | \af 2.\! d2. |
  {{ template "rh1" (w `a'='4\mf\<` ``) }}
  \duo {
    d'='2\>^\tRit <aes' bes e>4 \fermata | \af 2.\! <f=' a d>2.\pp \bar "|."
  } { d'='2.~ \fermata | d=' | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  bes=8-\frBass a_\aNLeg bes a bes a | \rep 2 { bes=8 a bes a g f= | }
  bes=8 a bes a d a | c bes bes a bes a | bes a bes a b cis |
  d='8 cis d cis d e | f e d a c bes | a bes a bes a g | f bes d f e f=' \clef treble |
  a='8 g f e d cis | a' bes a bes g4 | f8 g f g f4 | fis8 g fis g fis4 |
  g='4 d c | bes g e | r4 a2 | r4 a=2 | r4 \clef bass d,= f |
  a=8 g f e d cis | d f g a g4 | f8 a f e d4~ | d8 cis d e fis4 |
  g=4 d= \clef treble bes'=~ | bes d8 e f e~ | e4 d bes~ |
  bes=8 a bes a bes a= \clef bass d,=( a bes a bes4 \fermata | d,=,2.) |
}
{{ end }}
