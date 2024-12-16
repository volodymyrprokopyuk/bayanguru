{{ define "lh1" }}
  d=4 e,8 fis g f ees4 {{ .a }} | {{ .b }} c8 %
  \duo { r8 g@m! r8 d7! | } { d=4 d= | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 4/4
  g'='4\mf <ees' g>4 4 <d f>8 ees | d4 <ees g>8 <d f> c4 <c ees> |
  <bes=' d f>4 4 4 <ees g> | <bes d>2 <d f>8 <c ees> <bes d> <a c> |
  \repeat volta 2 {
    <bes=' d>4 4 4 <c ees> | <bes d>8 <a c> <g bes> a g4 <ees' g> |
    <d='' f>8 <c ees> <bes d> <a c> <g bes>4 <fis a> |
    \alternative {
      \volta 1 { g='2 g8\< <d a'> <g bes> \af 8\! <a=' c> | }
      \volta 2 { g='2 g='8 r r4 | }
    }
  }

  <g=' g'>4\f <g' ees' g>4 4 <f f'>8 <ees ees'> |
  <d='' g d'>4 <g b g'> <c, c'>8-> 8-> 8-> <ees c' ees>-> |
  <f='' bes d f>4 4 4 <g bes ees g> |
  \af 2\! <d='' f bes d>2\< <f d' f>8 <ees c' ees> <d bes' d> <c a' c> |
  \repeat volta 2 {
    <d='' bes' d>4 4 4 <ees c' ees> |
    <d='' bes' d>8 <c a' c> <bes g' bes> <a a'> <g g'>4 <g' ees' g> |
    <f='' d' f>8 <ees c' ees> <d bes' d>8 <c a' c> <bes g' bes>4 <a fis' a> |
    \alternative {
      \volta 1 { \af 2\! <g=' g'>2\< 8 <a d a'> <bes g' bes> <c='' a' c> | }
      \volta 2 { \af 2\! <g=' g'>2\< 8\sf r r4 | }
    }
  }

  g,=4\mf <ees' g>4 4 f8 ees | d4 <ees g>8 <d f> c4. <c ees>8 |
  <bes= d f>4 4 4 <bes ees g> | <bes d>2 <d f>8 <c ees> <bes d> <a c> |
  g=4 <bes d>4 4 <c ees> | <bes d>8 <a c> <g bes> <fis a> g4 <g' ees> |
  <d=' f>8 <c ees> <bes d> <a c> <g bes>4 <fis a> |
  g=2 g'8\> <d a'> <g bes> \af 8\! <a c> |
  <bes=' d>4\p 4 4 \acc { f'=''8 } <c ees>4 |
  <bes=' d>8 <a c> <g bes> <fis a> g4\> \af 4\! <ees' g> \fermata |
  <d='' f>8\pp <c ees> <bes d> <a c> <bes d bes'>4 <a c a'> |
  <g=' g'>2~ 8 r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,4-\stBass ees@M! eesM4 d'8 c | b4 g c cm! | bes besM! bes ees@M! |
  bes=,4 besM! bes8 c d4 | g, gm! g c@m! | d'4 e,8 fis g f ees4 |
  bes'=,4. c8 d4 dM! | \rep 2 { g,=,2 g+gm!8 r r4 | }

  \meter 1/4 1,1,1,1
  g=,8 gm! ees' eesM! ees eesM d c | b g@7! g8 g7 c cm! c cm |
  bes=,8 besM! bes besM bes besM ees eesM! |
  bes=,8 besM!16 besM besM8 besM16 besM bes8-> c-> d4-> |
  g,=,8 gm! g gm g gm c cm! | {{ template "lh1" (w `` `d'=4.`) }}
  \rep 2 { \duo { r8 gm!16 gm gm8[ gm16 gm] gm8 } { g,=,2~ g=,8 } r8 r4 | }

  \meter 1/2 1,1
  r2 ees=4 d8 c | b a g4 c8 g c4 | bes8 a bes f bes a g ees' |
  bes=,8 a bes c d ees, e fis | g c bes a g f g a |
  bes=,8 c cis d ees d c bes | a c g a bes c d4 | g,8 f' ees d c r f= r |
  \duo { r8 besM! r bes@M! r8 gm! r cm! | } { bes,=,4 a g c= | }
  {{ template "lh1" (w ` \fermata` `bes'=,4.`) }} |
  g=,8 gm!16 gm gm8[ gm16 gm] g+gm8 r r4 |
}
{{ end }}
