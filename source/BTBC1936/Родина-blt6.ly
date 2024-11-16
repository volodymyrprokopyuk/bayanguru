{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key d \minor
  \time 2/4
  \partial 4 { a=8\mf d | }
  f='4 a,8 f' | e4 a,8 e' | d4 a4~ | a a8 d |
  f='4 a,8 f' | e4 a,8 e' | d2~ | d4 d8 c |
  f='4 <f a>8 <g bes> | <a c>4 8 <f a> |
  <d=' d'>8 <a' c> <bes, d g>4~ |
  4 <d=' d'>8 <g bes> | <f a>4 <d f>8 <f a> |
  <e=' g>4 <f a>8 <e g> | <d=' d'>2~ | 4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \partial 4 { r4 | }
  d+dm!4-\stBass d+dm_\aSta | a+a7!4 a+a7 |
  d+dm!4 d+dm | \rep 2 { d+dm!4 d+dm | }
  a+a7!4 a+a7 | d+dm!4 d+dm | d+dm! c+c7! |
  \rep 2 { f+fM!4 f+fM | } bes+besM!4 bes+g@m! |
  bes+g@m!4 e+g@m4 | f+d@m!4 f+dm4 | g+gm!4 a+a7! |
  d+dm!4 d+dm | d+dm! %
}
{{ end }}
