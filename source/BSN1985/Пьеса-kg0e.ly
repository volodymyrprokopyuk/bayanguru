{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 4/4
  e'='4\mf fis g e | fis dis b b | e fis g a | b b b d |
  \repeat volta 2 {
    c=''4 b a fis | b a g b | a g fis b |
    \alternative {
      \volta 1 { e,='4 e e' d='' | }
      \volta 2 { e,='4 e e'=''2 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=4-\stBass em! b e@m | dis4 b@7! fis4 b@7 | e4 em! e d | g, gM! d' g@M |
  a=,4 am! d d7! | g, gM! b g@M | c4 a@m! b4 b7! | e em! e e7! | e= em! em2 |
}
{{ end }}
