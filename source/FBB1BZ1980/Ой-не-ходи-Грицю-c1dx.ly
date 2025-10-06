{{ define "rh1" }}
  {{ .a }} b8 c4 a | e' c b a | gis b e4. gis,='8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andantino tranquillo"
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `a'='4.\(\p`) }} | a2 a4\) r |
  {{ template "rh1" (w `a='4.\(`) }} | a2 \af 2\! <g=' b>\)\< |

  \duo {
    <e'=' c'>4.\(\mf g8 \stemDown c4 e_~ | <e g>2 f8 e d c |
    b='4 d \stemUp g a \stemDown | e4 d c\> \af 4\! b='\) |
  } { s1 | s1 | s2  b'='2 | s1 | }

  \duo { {{ template "rh1" (w `a'='4.\(\p`) }} | a2 a='\) \bar "|." }
  { s1 | s1 | s1 | r2 c'='2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  R1 | a,=,4.\(-\frBass b8 c4 d | e d c b | a f' e8 d c b\) | a4 r r2 |
  a=,4.\( b8 c4 d | e d c b | a e' g8 f e d=\) |

  c=4 r r2 | c4.\( g8 c4 e | g2 f8 e d4 | c d e8 fis gis4\) |
  a=4 r r2 | a4.\( b8 c4 d | e d c b | a2 a,=,\) |
}
{{ end }}
