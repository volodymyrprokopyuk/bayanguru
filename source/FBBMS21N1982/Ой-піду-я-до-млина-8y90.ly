{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  e'='8(\mp g b b | b b b4) | a8( b c4 | b8 a g4) |
  b='8( a g fis | e fis g4) | fis8( g a4 | e e) |
  b'='8(\f a g fis | e fis g4) | fis8(^\tRit g a4 |
  e='4 <g=' b e>) |

  \trio { e''=''8 g~ g4_~ | g=''2 | } { e''=''2~ | e='' | }
  { s4 b''=''8 b | b b b=''4 | }
  \duo { <fis''='' a>8 <g b> <a c>4 | <g b>8 <fis a> <e='' g>4 | }
  { e''=''2~ | e='' | }

  r8 <c='' e a>8[-. r8 8]-. | r8 <c e ais>-. <b e b'>-. <e, b' e>-. |
  r8 <e=' c' e>[-. r8 8]-. | r8 <g b e>8~->\> \af 4\! 4 |
  b='16( c a b g a fis g | e fis e fis e fis g8) |
  \duo {
    r8^\tRit <dis'=' g>8[ r8 <dis fis>] | r8 <ais e'> <b= e>4 \fermata \bar "|."
  } { a=4 a | g=2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
