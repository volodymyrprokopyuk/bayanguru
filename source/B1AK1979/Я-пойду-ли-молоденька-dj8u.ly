{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 2/4
  c''=''8\(\mf g' g e | f16 e d8 c g\) | c\( g' g e | c d e g\) |
  \repeat volta 2 {
    d=''8\( d16 f e8 e | f16 e d8 c g\) | b\( b a16 g a8 |
    \alternative {
      \volta 1 { g='4 g='\) | }
      \volta 2 {
        \hSpace g='4 \sSlur nb #'((ws . 5) (ww . 2.5) (wh . 1.5)) ( g='4) \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass cM! c cM | g g7! c cM! |
  \rep 2 { c=8 cM! g=, c@M | }
  g=,8 gM! c cM! | d g@7! e8 c@M! |
  d=8 g@M! d8 d7! | g,-. f-. e'-. d-. | g,=,8 gM! g+gM4 |
}
{{ end }}
