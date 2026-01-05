{{ define "rightHand" }}
\relative {
  \tempo Largo
  \clef treble
  \key e \minor
  \time 2/4
  e''=''4.\(\p d8 | c4. a8 | b4. a8 | g fis e4\) |
  e'=''4\(_\dCre g8 e | d4. b8 | c d16 c b8 a | b4\< \af 4\! dis\) \fermata |
  e=''4\(\f e | c4. a8 | b4. a8 | g fis e4\) |
  a='4\(_\dDim c | b a8 g | fis4\> b | \af 4\! e,='2\)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  \rep 4 { R2 | } | c'='4\(-\frBass c | b c8 d | e4 fis | g fis\) \fermata |
  e='4( fis8 gis | a4) r | b,( cis8 dis | e4) r8 d( | c4 a | b2~ | b | e=') |
}
{{ end }}
