{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 3/4
  \meter 1/4 1,1,1,1
  <g'=' b>4\mf 8 <fis a> <g b> <a cis> | <b d>4 <a cis> <g b> |
  \duo { a'='4 g fis=' | } { d'='2. | } | <g b>4 <d a'> <b g'> |
  <cis=' e>4 <cis e>8 <b d> <cis e> <d fis> | <e g>4 <b fis'> <cis e> |
  d='8 a e' b eis b | <ais= fis'>4 %

  \duo {
    fis'='4\( d | b b d | fis e d | cis b e~ | e\) g\( fis |
    cis=' g' fis | cis e d | b=4.\) %
  } { s2 | \rep 2 { b=2.~ | b= } | b2. | ais | s4. } %
  ais=8( b cis | d4) b\( b | c c c  | b b a | g b=2\) |

  r4 \duo {
    e'='4\( fis g e fis | g fis e | d2. | d4\) a'\( a | a g fis | a g fis |
    b='4 e,2~ | e4\) b'\( b | b gis ais | b ais b |
    <e,='_~ fis_~ cis'~>2. | 4\)
  } {
    d'='2~ | d2. | cis | d~ | d | d | dis | b2.~ | b4 e2 | eis2.~ | eis |
    s2. | s4
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
