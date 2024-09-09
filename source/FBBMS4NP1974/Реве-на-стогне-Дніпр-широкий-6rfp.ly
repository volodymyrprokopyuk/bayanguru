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
}
{{ end }}
