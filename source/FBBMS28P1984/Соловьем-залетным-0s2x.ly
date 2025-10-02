{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 4/4
  g'='4(\p a <g bes> <a c> | <bes d> <a c g'> <g bes d>2) |
  \duo {
    d''=''4( c bes a | g bes a2) | g4( a bes <a c> |
    d=''4 <ees g> <d f> <c ees> | <bes d> <a c>8 <g bes> a4 bes8 a |
    <ees=' g>2 <d g>) | a'4\( bes c a | bes_\dCre c d bes | c d ees c |
    d=''4\< ees <d f> \af 4\! <d fis> | g\f d c d | f2 ees |
    d=''4_\dDim c8 bes a4 bes8 a | g2\)\< bes4 \af 4\! d |
    <bes=' g'>4(\mf d c d | f2 ees) | d4( c8 bes a4 bes8 a | g2 g | g=') %
  } {
    <e'=' g>2 <ees g> | g a | g1 | bes4 a g fis | g s4 g2 |
    c,='4 d8 ees f4 ees8 f | g2 g | f4 ees d f | ees d c ees |
    bes'='4 c bes c | <a c> bes g fis | <g c>1 | g | g2~ g4. a8 |
    g='2 g | <g c>1 | <ees g>2 2 | <bes ees> <c f> | <bes= d> %
  } <g=' bes d g>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  R1 | g'='4(-\frBass f ees d | c g c2) |
  <c=' ees>4( <d f> <ees g> f | g ees f2) |
  g='4 f ees d | <c ees> <g d'> <a cis> <bes d> |
  r4 <c,= g' bes>4 r <d a' c> | r8 d'4 g, ees' f,8[~ |
  f=8] d'4 f, bes, f'8[~ | f] a4 f bes, a'8 |
  <d=' f>4 <c ees g> <bes d f> <d fis bes> |
  <c=' ees g>4 <bes d g> <a c ees> <aes c d> |
  g=4 c d c | <a ees'>2 <bes d> | <c ees>4 <d f>8 <ees g> f4 ees8 f |
  <g,,=, d' bes'>2 ees''4 d | \duo { g=4 c d c | g2 g | g a= | }
  { <c= g'>1 | <a ees'>2 <bes d> | c4 d8 ees f4 ees8 f= | } g,2 <g,=, d' bes'> |
}
{{ end }}
