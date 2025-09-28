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
    <ees=' g>2 <d g>) | a'4\( bes c a | bes c d bes | c d ees c |
    d=''4\< ees <d f> \af 4\! <d fis> | g\f d c d | f2 ees |
    d=''4_\dDim c8 bes a4 bes8 a | g2\)\< bes4 \af 4\! d |
  } {
    <e'=' g>2 <ees g> | g a | g1 | bes4 a g fis | g s4 g2 |
    c,='4 d8 ees f4 ees8 f | g2 g | f4 ees d f | ees d c ees |
    bes'='4 c bes c | <f, a> bes g fis | <g c>1 | g | g2~ g4. a8 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
