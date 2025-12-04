{{ define "rh1" }}
  r4 <d= c'> r | r4 <d= bes'> r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 3/4
  g'='8(\mf bes d4 d) | ees8( d c4 bes8 a) | g( bes g2) |
  g='8(\p bes g2) | g8(\mf bes d4 d) | ees8( d c4 bes8 a) |
  g='8( bes g2) | g8(\p bes g2) | d8(\mf\< fis a4 fis | g8 bes d4 \af 4\! bes) |
  a='8( d d2) | a8( d d2) | d,8(\< fis a4 fis | g8 bes d4 \af 4\! bes) |
  a='8( bes g2) | a8(\p bes g='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  r4 bes=2-\frBass | c8( bes a4) r | <ees g bes>2. | <g, bes d> | r4 bes'2 |
  c='8( bes a4) r | <c, e g>2. | <c ees g>4 <bes d g>2 | {{ template "rh1" }}
  <d= a'>2. | <d fis a>2. | {{ template "rh1" }}
  \duo { d=4 \rest bes'=( a) | d, \rest c( bes=,) | } { s4 ees=2 | s4 g,=,2 | }
}
{{ end }}
