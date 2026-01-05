{{ define "rh1" }}
  {{ .a }} fis e dis | e4 b) | a'8( g fis e | fis dis b4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `g''=''8(\p`) }}
  r8 a'=''8\( g fis | g e g b | a g fis e | \af 2\! dis2\)\< |
  R2\mf | {{ template "rh1" (w `g=''8(`) }}
  e=''8( g fis e | b' a g fis) | g(\>^\tRit fis) e( dis) | \af 2\! e=''2\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  \meter 1/2 #'(1)
  R2 | {{ template "rh1" (w `g'='8(-\frBass`) }} | e='4 d | c a' | b8( c b a) |
  {{ template "rh1" (w `g='8(`) }}
  r8 a'='8( g fis) | g( b a g | c4 a) | b b, | e='2 |
}
{{ end }}
