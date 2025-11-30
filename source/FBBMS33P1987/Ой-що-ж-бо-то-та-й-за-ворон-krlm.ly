{{ define "rh1" }}
  <a=' f'>4(\f 4 e' g) | f8( e d cis d4 a=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Risoluto
  \clef treble
  \key d \minor
  \time 4/4
  a'='4(\mf cis8 a d4) a8( f' | e d a bes16 a g4) d'( |
  c=''4 c8 d a4 f) | g8( f g bes a2) |
  {{ template "rh1" }} | c=''4( d a f) | g8( f g bes a4) r |
  {{ template "rh1" }} | <g=' c>4( d' a f) |
  g='8(\> f g a \af 2\! <f=' d'>2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
