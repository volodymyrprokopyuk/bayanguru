{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    e'='16(\mf f e f g8) g | e16( f e f g8) e | a16( g f e d8) e16( f |
    \alternative {
      \volta 1 { e='16 f e f <e=' g>4) | }
      \volta 2 { e='16 f e f e='4 \sSlur ub #'((wb . 3) (ww . 4)) ( | }
    }
  }

  \repeat volta 2 {
    b=16)( c d e f8) f | e16( f e f <e g>4) |
    b=16( c d e f8) f | e16( f g f e4) |
    gis,=16( a b c d8) d | c16( d c d c d e c) |
    fis,=16( g fis g a8) c | b <c fis> <b d g>4 |
    e='16(\f f e f e f g8) | e16( f e f e f g8) |
    a='16( g f e d8 e16 f |
    \alternative {
      \volta 1 { e='16 f e f <e=' g>4) | }
      \volta 2 { e='8 \sSlur ub #'((wb . 3)) ( <d f b>)-> <e=' g c>4-> \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
}
{{ end }}
