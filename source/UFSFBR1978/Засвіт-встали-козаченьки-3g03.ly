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
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
