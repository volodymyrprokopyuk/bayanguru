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
}
{{ end }}
