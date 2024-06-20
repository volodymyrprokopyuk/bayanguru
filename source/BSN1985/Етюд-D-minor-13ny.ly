{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 4/4
  d'='8(\mf\< e f g a bes \af 4\! a4) | g8( a g4) f8(\> g f \af 8\! e) |
  d='8(\< e f g a bes a \af 8\! d) | c(\mf bes a g a2) |
  d=''8( c bes a bes g a bes) | c( bes a g a f g a) |
  d,='8(\< e f g a bes \af 4\! a4) | g8(\>^\tRit a g e \af 2\! d='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  <f= a d>1-\frBass | <g bes d>2 <g a cis> | <f a d>1 | <e bes' c>2 <f a c> |
  <f= a d>2 <g bes d> | <e bes' c> <f a c> | <f a d>1 | <g bes d>4 <g a cis> <f= a d>2 |
}
{{ end }}
