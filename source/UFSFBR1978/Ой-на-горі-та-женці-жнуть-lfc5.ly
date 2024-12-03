{{ define "rh1" }}
  <a=' c>8 <g bes> <f a> <e g> | <d f> <e g> <f a>4 | <d=' d'>2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato con moto"
  \clef treble
  \key d \minor
  \time 2/4
  \meter 1/2 #'(1)
  <d'=' d'>4\mf a' | c8 bes a g | <d f> <e g> <f a>4 | <d d'>2 |
  \acc { a'='16 bes c } d=''4 a | {{ template "rh1" }}
  f='8 f f a | \duo { c''=''4 f8-> ees='' | } { f'='2 | }
  <bes=' d>8\f 8 8 8 | {{ template "rh1" }} | <bes'=' d>2-> |
  <a=' c>8 <g bes> <f a> <g bes> | <a c>2-> | <f c'>4 <bes d>4 |
  {{ template "rh1" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \meter 1/2 #'(1)
  d+dm!4-\stBass r4 | R2 | r4 a+a7! | d+dm!2 | d+dm!4 r | g+gm! r |
  r4 a+a7!4 | d+dm!2 | f+fM!8 f+fM f+fM c= | f+fM!4 a-> |
  bes=,8 bes bes bes | f g a4 | bes a | d2 | bes+besM! |
  f+fM!8 f+fM f+fM c= | f+fM!2 | f+fM!4 bes+besM! | f,8 g a4 | bes a | d=2 |
}
{{ end }}
