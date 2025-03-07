{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key d \minor
  \time 2/4
  d''=''4\f \rep 2 { a='8. b16 | c4 a( | \acc { bes='16 c } d=''4) } a8. b16 |
  c=''4 <a d>8. 16 | <gis e'>2 | a4( g)-> | f-> <f a>8. <bes g>16 |
  <a=' c>4 <bes d> | <a c> <g bes>8. <f a>16 | <e g>4 <g bes> |
  <f=' a>4 <d d'>8. 16 | <bes' d>4 <g bes>8. 16 | <cis,=' a'>2( |
  d='4) <g e' g>4-> | <f f'>-> <a f' a>8. <bes g' bes>16 |
  <c='' a' c>4 <d bes' d> | <c a' c> <bes g' bes>8. <a f' a>16 |
  <g=' e' g>4 <bes g' bes> | <a f' a> <d a' d>8. 16 |
  <d='' bes' d>4 <bes g' bes>8. 16 | <a a'>2( | <d,=' d'>4) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d+dm!4-\stBass r | r a+am! | d+dm!4 r | r a+am! |
  d+dm!4 r | r f+d@m! | r4 e+d7! | a+am! c+c7!-> |
  f+fM!4-> f+fM | f+fM! bes+besM! | f+fM! f+fM | c+cM! cis |
  d+dm! f+d@m! | g+gm!4 e+g@m! | r4 a+a7! | d+dm! c+c7!-> |
  f,=,8[ fM! fM fM] | f fM! bes besM! | f[ fM! fM fM] | c' cM! cis a@7! |
  d=8 dm! f, d@m! | e=,8[ g@m! gm8 gm] | r4 a+a7! | d+dm! r |
}
{{ end }}
