{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  a'='8\p a a a | a( c b a | gis) gis gis gis | gis( b a gis) |
  a='8 a a a | a\( c b a | gis b e gis, | a c16 b a8[\) b]( |
  \repeat volta 2 {
    c=''8)\mf c c c | c( e d c | b) b b b | b(\> d c \af 8\! b) |
    a='8\p a a a | a\( c b a |
    \alternative {
      \volta 1 {
        gis='8 b  e gis, | a c16 b a8[\) b='] \sSlur nf #'((wb . 1)) ( |
      }
      \volta 2 {
        gis='8)^\tRit b  e gis, \sSlur nb #'((wb . 1.5) (ww . 3) (wh . 2)) ( |
        \duo { a'='8[ c16( b]) a='8 } { e'='8[ f] e=' } %
      }
    } r8) \fermata
  }

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
