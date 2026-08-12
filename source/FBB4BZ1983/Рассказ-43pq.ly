{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  r8\p \duo {
    a'='8\( c e | d f e c | b d c b | g2~ | g8 a f g |
    e='8 c d e | c a b c | <gis_~ d'^~>2 | 4.\) \fermata
  } {
    a'='4.~ | a2 | a4 g8 f | e2~ | e8 c d4 | s2 | s2 | s2 | b4.
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
