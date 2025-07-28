{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key e \minor
  \time 2/4
  \rep 2 { R2 | } | b'='8.(\mp a16) g8 g | b8.( a16) g8 g |
  <fis=' d'>8 8 8 <fis c'> | <g b>8.( a16) g='8 r |
  \repeat volta 2 {
    e='8 <e g>8 8 8 | fis16( g) <c, a'>8 8 8 |
    <dis=' b'>8. a'16 g8 fis | e r <g,= b e>4 |
  }

  \rep 2 { r8 <d'=' g b>[ r8 8] } | r <fis c' d>[ r8 8] |
  r8 <d=' g b>[ r8 8] | e <e g>8 8 8 | fis <e fis a>8 8 8 |
  <dis=' b'>8. a'16 g8 fis | e r <g,= b e> r |
  e'='8 fis g gis | a b <a c> e' \fermata |
  <g,=' b>8. <fis a>16 <e g>8 <dis fis> | e r <g=' e'> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  g=8-.\p-\frBass <b d>-. d,-. <b' d>-. | g-. <b d>-. d,-. <b' d>-. |
  g=8 d' d, d' | g, d' d, d' | a <c d> d, <c' d> | g <b d> d, <b'= d> |
  e,=8 b' b, b' | a, a' e a | b, a' dis, a' | e b e,=,4 |

  \rep 2 { b''=8. a16 g8 g= | } | d'='8 d d c | b( a) g4 |
  e=8 <g b> d <g b> | c, a' c, a' | b b, cis dis | e b e, r |
  e''='8 dis d d | c b <a c e> fis \fermata | b b, bes' <a, a'> |
  <e'= g>8 r <e,=, b'> r |
}
{{ end }}
