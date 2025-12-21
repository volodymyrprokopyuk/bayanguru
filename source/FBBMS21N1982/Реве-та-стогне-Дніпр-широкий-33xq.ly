{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 3/4
  e'='4\(\p g b | e2 b4 | a2 g4 | g2. | fis\) |
  a='4\( b c | b2 a4 | g2 fis4 | e2.\) |
  \repeat volta 2 {
    b'='4\(\< e \af 4\! fis | g2\mf fis4 | e2 b4 |
    d=''2 c8 b | \af 2.\! a2.\)\> | a4\(\p  c e |
    b='2 a4 | g2\> fis4 |
    \alternative {
      \volta 1 { \af 2.\! e='2.\) | }
      \volta 2 {
       \hSpace e='2.^\tRit \sSlur nb #'() ( | \af 2.\! e'='')\> \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  R2. | r4 e=4\(-\frBass g | b e2~ | e4 b a~ | a g fis~ | fis2\) a4\(~ |
  a=4 b c~ | c b a | g fis e~ | e=2\) \clef treble b'=4 |
  e='4 fis g~ | g fis e~ | e b d~ | d c8 b a4~ |
  a=4 a c | e b c~ | c b a= \clef bass | g= fis \sSlur nf #'((ws . 3)) ( e) |
  g=4 fis e~ | e=2. |
}
{{ end }}
