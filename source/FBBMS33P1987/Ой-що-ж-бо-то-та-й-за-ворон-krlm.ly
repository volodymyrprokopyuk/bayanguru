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
  \clef treble
  \key d \minor
  r4 g'='4(-\frBass f d) | cis8( d e4) r bes( | c e f) r |
  e='4( d <a cis>2) | d4( f g8 bes a g) | a4( a, bes f') |
  e='8( f e d c4) r | bes( e8 d <a= cis>4) r \clef bass |
  d,=4( f g8 bes a g) | a4( <a, g'> <bes f'> <d f>) |
  e=8( f e d c4) r | bes( a <d,=, a'>2) |
}
{{ end }}
