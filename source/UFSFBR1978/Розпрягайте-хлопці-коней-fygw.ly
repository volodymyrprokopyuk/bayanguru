{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 4/4
  \partial 4 { <bes= bes'>8 <a a'> | }
  \repeat volta 2 {
    <g= g'>4 d' g <c ees>8 <a c> | <bes d>4 4~ 8 r <d, bes'> <c a'> |
    <bes= g'>4 d g <c ees>8 <a c> | <bes d>2. bes8 bes |
    <ees='' g>4 <d f> <c ees> <bes d>8 g' | <a, c f>4 <c f a>2 <ees g>8 8 |
    <d='' f>4 \duo { g''=''8 ees='' } { c''=''4 } <bes d>4 <a d a'> |
    <g=' d' g>2. bes8 <aes bes> |
    <g=' bes ees g>4 <f bes f'> <ees g c ees> <d f bes d>8 <g g'> |
    <f=' a c f>4 <a c f a>2 <g bes ees g>8 8 |
    <f=' bes d f>4 <g g'>8 <c ees> <bes d>4 <a c d a'> |
    \alternative {
      \volta 1 { <g=' bes d g>2~ 8 r <bes, bes'>8 <a= a'> | }
      \volta 2 { <g'=' bes d g>2~ 8 r r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \partial 4 { r4 | }
  \meter 1/4 1,1,1,1
  g+gm!4-\stBass g+gm g+gm c+cm! | g+gm! g+gm g+gm8 d=8[ e fis] |
  g+d@m!4 a+a7!4 bes+g@m! c+cm!4 | g+gm! g+gm g+gm bes+bes7! |
  ees+eesM!4 bes+besM! c+cm! bes+besM! | f+fM! f+fM f+fM ees+eesM! |
  bes+besM!4 c+cm! d+g@m! d+dM!4 | \duo { r4 gm!8. gm16 gm4 } { g,=,2. } %
  bes,=,8 bes7! | ees eesM! d bes@M! c8 cm! bes besM! |
  f=,8 fM! \duo { r8 fM16 fM fM8 fM } { f,=,2 } ees=,8 eesM! |
  bes'=,8 besM! c cm! d g@m! d=8 dM! |
  \rep 2 { \duo { r4 gm!8. gm16 gm8 } { g,=,2~ g=,8 } r8 r4 | }
}
{{ end }}
