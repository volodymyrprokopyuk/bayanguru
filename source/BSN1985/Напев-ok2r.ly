{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  \meter 1/2 #'(1)
  e'='4\(\p g8 e | a4 g | fis e8\< fis | g4 \af 4\! fis\) |
  e='8\( fis g e | c'4 b | a\> b8 a | \af 2\! e2\) |
  \repeat volta 2 {
    a='4(\mf e8 fis | g4 d) | c'8( b d c | b c b a) |
    e'=''4.\( d8 | c d b4 | a8\> c b a | \af 2\! <e=' e'>2\) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \meter 1/2 #'(1)
  R2 | R2 | a=4(-\frBass c | b2) | d4\( c8 b | a4 g8 e | fis2 | e\) |
  c'='2( | b4) fis8( g | a4) e8( fis | g4. fis8) |
  e=8\( fis g e | a4 g | fis g8 fis | e=2\) |
}
{{ end }}
