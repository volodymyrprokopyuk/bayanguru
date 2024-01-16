{{ define "rh1" }}
  a='8( cis e cis) | d( e f d) |
  e=''8\( g bes8. a16 | a16 g f e d=''4\) |
{{ end }}

{{ define "lh1" }}
  a=,8 aM! g a@M | f'8 d@m! d8 dm |
  g,=,8 gm! e' g@m | a,8 a7! d= dm! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 2/4
  d''=''8(\mf f a) a | bes( a g4) |
  c,=''8( e g) g | a16( g f e d4) |
  {{ template "rh1" }}
  {{ template "rh1" }}
  d=''8.( f16 a8) a | bes bes16( a g4)-> |
  f=''16( e d8) e16( d cis8) |
  d=''8 \acc { e=''8 } d16( cis d=''4)-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=8-\stBass dm! f d@m | g,8 a bes g@m! |
  c=8 cM! bes c@M | a8 a7! d dm! |
  {{ template "lh1" }}
  {{ template "lh1" }}
  d=8 dm! f, d@m | g8 gm! gm4-> |
  a+d@m!8 r8 a+a7! r | d+dm! a=, d+dm!4-> |
}
{{ end }}
