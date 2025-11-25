{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 2/4
  b'='4\p b | a8 b fis g | e4.\< fis8 | g4 a8 \af 8\! e |
  b'='8\> a16 g fis8 \af 8\! g | e4\< \af 4\! d=' |

  \duo {
    d''=''4\mf d | c b8 d | a4. g16 fis | e4 d'8 c |
    b='8 c a b | g\> a fis \af 8\! g | \af 2\! e='2\< |
    d'=''4\f g8 f | e4 d8 c16 b | a8 c b16 a g fis |
    e='4 d'8 c | b c a b | g\> a fis \af 8\! g=' |
  } {
    g'='4 fis8 f | e2~ | e | e | e4 fis | e dis | s2 |
    <g=' b>4 4 | <g c> <e b'>8 <d e> | <c e>4 <b dis> |
    c='4 <e a> | <d g> <c e> | <b e> <a= dis> |
  }
  <g,= b e>2^\tRit | <e'=' g b e>\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \meter 1/2 #'(1)
  r4 b=4-\frBass | \rep 4 { r4 b= | } | r4 b8 c | b4. g8 |
  a=4 b | c8 b a4~ | a8 g fis4 | g a | b8[ b,] c b | e g fis e |
  d=8 f e d | c b a gis | a4 b | c16 b a g fis4 | g a | b b, |
  e=,4 b' | e=2 \fermata |
}
{{ end }}
