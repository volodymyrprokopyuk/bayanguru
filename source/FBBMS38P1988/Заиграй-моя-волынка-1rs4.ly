{{ define "lh1" }}
  {{ .a }} r | <c f> r | <c=' e> r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \meter 1/2 #'(1)
  \repeat volta 2 {
    c''=''4(\mf g' | a8\> g f e | \af 8.\! g4) c,8(\< e |
    g=''4 g8 \af 8\! e | a g f a | g4\> \af 4\! c,) |
    c=''4.(\mp c8 | f e d f | e4\> \af 4\! c) |
    c=''4.(\< \af 8\! c8 | f e d f |
    \alternative {
      \volta 1 { e=''4\> \af 4\! c) | }
      \volta 2 { \hSpace e=''4 \sSlur nb #'((wb . 2.5)) ( <e='' c'>) \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `<c'=' g'>4-\frBass`) }}
  {{ template "lh1" (w `<c=' g'>4`) }}
  \rep 2 { <f='~ a>2^( | <f aes>) | <c g'> | } | <c=' g'>4 4 |
}
{{ end }}
