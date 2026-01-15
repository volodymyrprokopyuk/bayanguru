{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 6/8
  g''=''8(\p\< fis e dis e \af 8\! fis | e4.\> \af 4.\! b) |
  c=''8(\< b c d a \af 8\! e' | \af 2.\! b2.)\> |
  g'=''8(\< fis e dis e fis | e b d~ d c \af 8\! b) |
  c=''8(\> e c~ c4 b8~ | b a b \af 4.\! e=''4.)\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  e'='4.(-\frBass fis | g8 fis e dis e fis) | e4.( fis | g8 fis g a g fis) |
  e='4.( fis | g gis) | a( g | fis e=') |
}
{{ end }}
