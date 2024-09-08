{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key e \minor
  \time 2/4
  e''=''4-.\f b-> | c8( a) b4-> | e16( fis e8) b-. b-. | c( a) b4-> |
  r8 e=''8-. r b-. | g( b) a16( b a8) | g-. g-. fis16( g fis8) | r g( a c) |
  r8 e=''8-. fis16( e fis8) | g( b) a16( b a8) | g-. g-. fis16( g fis8) | e4 <e='' e'> |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
