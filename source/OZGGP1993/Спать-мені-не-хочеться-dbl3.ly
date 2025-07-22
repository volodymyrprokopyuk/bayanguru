{{ define "rh1" }}
  {{ .a }} fis16) e8 e | e g b g | fis g fis e | dis b b=4 |
{{ end }}

{{ define "lh1" }}
  \duo { b=4 c=' | } { {{ .a }} | } b=4 a | <e g> <b=, a'> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key e \minor
  \time 2/4
  <g'=' b>4\f <fis a> | <e g> <dis fis> | <b e>8 g' <dis fis> dis |
  <b= e>2 \barFermata |
  {{ template "rh1" (w `g'='8.(\mp`) }}
  {{ template "rh1" (w `g'='8.(`) }}

  \tempo Adagio
  g'='8_\dCre g g <g b> | <b d>8 8 8 g | fis a <a d> <a c> |
  b='8 a g fis | g g g b | d e16( d) c( b) a( g) |
  fis='8^\tRit a d c | b a b b=' \fermata |

  \tempo Allegro
  <g=' b>8\f r <fis a> r | <e g> r <dis fis> r |
  <b= e>8 g' <dis fis> dis | e e e e |
  <g=' e'>8\f r <g b> r | <e g> r e r |
  <e=' fis>8 c' b dis, | e e e e=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  {{ template "lh1" (w `e=2-\frBass`) }} | <e= g>4 e,=, |
  \rep 2 {
    \duo { \rep 2 { r8 <g= b>4 8 | } r <ais cis>4 8 | r <fis= a>4 8 | }
    { \rep 4 { e=2 | } | }
  }

  \rep 2 { g=,8 d' b' d,= | } | g,=,8 d' fis d | g, d' b' dis |
  \rep 2 { g,=8 <b= d>4 8 | } | a=8 <c d>4 8 | g <b d> fis <a= b dis> \fermata |
  {{ template "lh1" (w `e=2`) }} | <e= g>2 |
  \rep 2 { e=8 b' e, b'= | } | a=4 b, | <e g> e,=, |
}
{{ end }}
