{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key e \minor
  \time 4/4
  e'='4.(\p g8 a g fis a | b4. a16 b g4 fis) |
  e='4.(\mp g8 a\< b c \af 8\! e | d e g, a \af 2\! b2)\< |
  \duo {
    g''=''4\mf fis e4. g8 | fis( e d e) d4\> b8( a |
    \af 8\! e='8) r g_(\p e) a4.( c8) | b( g a b) e=''2 \bar "|."
  } { b'='2. a4~ | a8 b c4 b b8 a | s2 a8 g fis e~ | e4\> fis \af 2\! e='2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R1 | R1 | e'='4(-\frBass d c8 b a4 | b8 c e d g a g fis) |
  e='4( d8 b c2) | d4 e8( d) g( a g fis) | e4( d c a) | g8( b d4 e='2) |
}
{{ end }}
