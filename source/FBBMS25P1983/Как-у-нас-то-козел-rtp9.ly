{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  \partial 4 { f'='8\mf f | }
  <d=' f bes>4 <f bes d>8 8 | <f a c>4 <e f>8 <ees f> | <d f bes>4 <f aes d> |
  <f=' a c>4 <e a c>8 <ees a c> | <d g bes>8 8 <bes e g>8 8 |
  <c=' f a>4 <a d f>8 8 | <bes d g>4 <g c e>8 8 | <a c f>4 <f' a c>8\mp <e a c> |
  <d=' g bes>8 8 <bes e g>8 8 | <c f a>4 <a d f>8 8 |
  <bes= d g>4 <g c e>8\>^\tRit 8 | \af 4\! <a= c f>4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \partial 4 { r4 | }
  \meter 1/2 #'(1)
  r8 bes=8-\frBass a g | r a g f | r bes c d | r c a fis | r g a bes |
  r a=8 g f | r d c bes | r c bes a | r g a bes | r a g f | r g e c |
  f=,4 \fermata %
}
{{ end }}
