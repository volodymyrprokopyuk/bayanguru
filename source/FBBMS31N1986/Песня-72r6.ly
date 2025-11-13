{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key d \minor
  \time 4/4
  d'='8(\mf e f d a'4 a) | g8( a g d f4 e) | d8( e f d g4 g) | g8( a bes d d4 c) |
  c=''8( c f e g4 d) | a8( a d c c2) | bes8( bes bes d d4 a8 bes16 a) |
  f='8(^\tRit d f d d4)  d'='' \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  r8 d+dm!8[-\stBass r d+dm] r f+d@m![ r8 f+dm] |
  r8 e+g@m!8[ r8 e+gm] r a+a7![ r a+a7] |
  r8 d+dm![ r a+d@m!] r8 bes+g@m![ r8 c+c7!] |
  r8 e+c@7![ r8 g+c@7!] r8 c+c7![ c( bes] |
  a=,8) f@M! a8 a7! bes[ g@m!8 r8 gm] |
  c=8[ f@M! r8 c@7!] f,8[ fM!] d' d7! |
  g,=,8[ gm!] e g@m! a=,8[ d@m! r8 dm] |
  r8 bes@M![ r8 g@M!] r8 d@m!8 dm4 \fermata |
}
{{ end }}
