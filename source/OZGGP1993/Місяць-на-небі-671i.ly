{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 3/4
  \duo {
    b'='4\(\p g e | fis2 a4 | <e a>4\< b' \af 4\! c |
    <a=' b>2.\)^\tRit \fermata |
  } { \rep 3 { s2. | } e'='2 dis='4 \fermata }
  b'='4^\tATem g e | fis dis b | <g' b>\( <a c> <g b> |
  <fis=' a>4 <e g> fis\) | b,( dis fis | <e c'>2 <g b>4) |
  <fis=' a>4( <e g> <dis fis> | <b= e>2.) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
