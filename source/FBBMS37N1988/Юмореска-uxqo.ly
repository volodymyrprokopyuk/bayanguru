{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key e \minor
  \time 2/4
  \repeat volta 2 {
    <g'=' b>8\mf <fis ais> <g b> <fis ais> | <g b>4 <b g'> |
    <a=' fis'>4 <g e'> | a8..[_(-> ais64 b] c4)-.-> |
    <dis,=' fis>8 <e g> <dis fis> <e g> | <fis a>4 <a fis'> |
    <a=' fis'>4 <g e'> | fis'8..[(-> e64 b] g='4)-.-> |

    <g=' b>8 <fis ais> <g b> <fis ais> | <g b>4. <g e'>8 |
    <fis=' d'>4 <e c'> | <c e>8 <e fis> <a c>4 |
    <g=' b>8-> <g, b>8 8 <g' b> | <fis ais> <fis, ais>8 4 |
    <fis'=' a>8-> <fis, a>8 8 <fis' a> | <e g>-> <g, b> <a c> <b d> |
    <g= c e>8-> <c e g> <c e b'> <c e a> | <e g>-> <g, b>8 8 <e' g> |
    \alternative {
      \volta 1 {
        <dis=' fis>8->\< <e g> <fis a> \af 8\! <a c> |
        <a=' b>8->\> b, <cis a' b> \af 8\! <dis=' a' b> |
      }
      \volta 2 {
        <dis=' fis>8-> <e g> <fis a> <g b> |
        <g=' e'>8->^\tRit <b g'>16( <a fis'> <g=' e'>4)-- \fermata \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=4-\stBass em! | b e@m! | c4 a@m! | e4 a@m! | b4 b7! | dis b@7! |
  e=4 em! | b e@m! | e4 em! | b e@m! | c4 a@m! | fis,4 a@m! | g4 e@m! |
  fis=,4 fis@7!8[ c'8] | b4 b@7!8[ fis8] | e4 fis8 g | a4 am! | b e@m! |
  b=,4 b7! | b8-> b b b | b4 b7! | e8-> b e=4-- \fermata |
}
{{ end }}
