{{ define "rightHand" }}
\relative {
  \tempo "Adagio cantabile"
  \clef treble
  \key e \minor
  \time 3/8
  g'='8(\p fis e | b'4 b8) | c( d c | b4 b8) | fis( g a | g4 fis8) |
  e='8(\< fis g | a) r \af8\! r | b(\mf a g | d'4 d8) | e( fis e |
  d=''4 d8) | a( b c | b4 a8) | g(\> fis e) | \af4.\! r4. |
  g='8(\p fis e | b'4 b8) | c( d c | b4 b8) | fis(_\dDim g a | b4^\tRit a8 |
  e'=''4.~ | e='') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  r4. | g=8(-\frBass fis e) | <a c>4. | g | <c e>4 a8 | b( b, dis) | e4 r8 |
  d=8( e fis) | g4 r8 b8( a g) | <c e>4. | b | c4 a8 | d( d, fis) |
  g=4 r8 | b8( a fis) | e4 r8 | g( fis e) | <a c>4. | g | <c e>4 a8 |
  g=4 fis8 | e4. | e,=, |
}
{{ end }}
