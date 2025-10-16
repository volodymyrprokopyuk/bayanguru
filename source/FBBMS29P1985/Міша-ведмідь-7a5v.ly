{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 4/4
  R1\mf | \rep 3 { R1 | } | e'='4-- <e g>4-- 4-- <f a>-- |
  <e=' g>2_\aSim <c e> | e4 <e g>4 4 <f a> | <e g>2 <cis e> |
  <d=' f>4 4 4 <f a> | <e g> <c e>4 4 <a c> | <c d>4 4 <b f'> <b d> |
  c='4 <g' bes>(->\<^\tRit <f a>-> \af 4\! <e g>)-> |
  <d=' f>4\f^\tATem 4 4 <f a> | <e g> <c e>4 4 <a c> \fermata |
  <c=' d>4 4 <b f'> <b d> | c2 <e=' c'>4-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c'='4---\frBass g-- c-- b-- | c_\aSim g a g |
  \rep 3 { c='4 g c b | c g a g= | } | f a g b |
  c='4 g a e | a aes g f | e c'( cis2)-> | d4 c b2 |
  c='4 g fis2 \fermata | a4 aes g f | e d c=-> r |
}
{{ end }}
