{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 3/4
  \partial 4 { e'='8(\p e | }
  \repeat volta 2 {
    e'=''4 d  c | b2) %
    \duo { e'='8( e | e'4 d c8 e | b='2) } { s4 | g'='4 g a | g='2 } %
    e,='8\( fis | g b a g16 fis e8 d | g4. b8\) <b d>8[( 8] |
    <a=' c>4 <g b> <fis a b> | <e=' g b e>2) %
    \duo { e'='8\( <e fis> | g b a g16 fis e8 d | g4. b='8\) } %
    { s4 | e'='4 e c | b4. d='8 } <b'=' d>8( 8 | <a c>4 <g b> <fis a b> |
    \alternative {
      \volta 1 {
        <e=' g b e>2) e8 \sSlur nf #'((ws . 1) (ww . 1.3)) ( %
        e='8) \sSlur nb #'((wb . 2.5) (ws . 7)) ( |
      }
      \volta 2 { \hSpace <e=' g b e>2) r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \partial 4 { r4 | }
  \meter 1/4 1,1,1,1
  c=4(-\frBass b a | g4. fis8) e'( d | c4 b a | g8 a g fis) e'( d |
  c=8 a@m!) c8( a@m!) d8( d7!) | g,_\aSim gM! b g@M! g8 gM! |
  a=,8 am! b e@m! b8 b7! | e( fis, g fis) e'( d |
  c=8 a@m!) c8 a@m! d8 d7! | g,( a b g) fis( e |
  a=,8 am!) b e@m! b8 b7! | \rep 2 { a=,8 am! am4 r | }
}
{{ end }}
