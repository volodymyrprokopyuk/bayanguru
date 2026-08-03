{{ define "rh1a" }}
  {{ .a }} e fis g | fis8 a e4-> d8 b {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \major
  \time 4/4
  \meter 1/4 1,1,1,1
  \duo {
    {{ template "rh1a" (w `d'='4\mf` `a=4->`) }}
    {{ template "rh1a" (w `d'=''4` `a='4->`) }}
    a='4\p e'_\dCre <a, d>2-- | cis8\f e cis e d cis b a |
    fis'=''8 a fis a g a b d | fis,4 e d=''2-> \bar "|."
  } {
    s4 cis'='4 c b | a g fis s4 | s4 cis''8 d, c' d, b' d, |
    a'='8 d, g d fis d s4 | cis8 e cis e d e fis4-- | s4 e fis2-- |
    d'=''4 c b8 a g4 | a b8 cis d=''2-> |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=1~->-\frBass | d2. a4-> | d e fis g | fis e d a | a2 fis'4 d-- |
  a'=2 d,-- | d g, | a4 a d=2-> |
}
{{ end }}
