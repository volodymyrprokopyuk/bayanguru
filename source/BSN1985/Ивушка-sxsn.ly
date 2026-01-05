{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key e \minor
  \time 4/4
  a'='4.(\p\< b8 c4 \af 4\! a | b\> g e \af 4\! e) |
  c'=''4.(\< d8 e4 d8 c | b2 e4 \af 4\! d) |
  c=''4(\mf b8 c d4 c | b g g g) |
  a='4(\>^\tRit c b a | \af 1\! e'=''1)\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  R1 | r2 r8 d'='8-.-\frBass c-. b-. | a4.( b8 c4 b8 a | g4)-. e'-. d-. e-. |
  e='2( fis | g b,4) e8-. d-. | c-. b-. a4( g fis | g fis e=2) |
}
{{ end }}
