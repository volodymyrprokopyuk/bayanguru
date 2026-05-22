{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 3/4
  \meter 1/4 1,1,1,1
    <g'=' b>4\mf 8 <fis a> <g b> <a cis> | <b d>4 <a cis> <g b> |
    \duo { a'='4 g fis=' | } { d'='2. | } | <g b>4 <d a'> <b g'> |
    <cis=' e>4 <cis e>8 <b d> <cis e> <d fis> | <e g>4 <b fis'> <cis e> |
    d='8 a e' b eis b | <ais= fis'>4 %

    \duo {
      fis'='4\( d | b b d | fis e d | fis g e~ | e\) g\( fis |
      cis='4 g' fis | cis e d | b=4.\) %
    } { s2 | \rep 2 { b=2.~ | b= } | b2. | ais | s4. } %
    ais=8[( b cis] | d4) b\( b | c c c  | b b a | g b=2\) |

    r4 \duo {
      e'='4\( fis g e fis | g fis e | d2. | d4\) a'\( a | a g fis | a g fis |
      b='4 e,2~ | e4\) b'\( b | b gis ais | b ais b |
      <e,='_~ fis_~ cis'~>2. | 4\) d'\( cis='' |
      \repeat volta 2 {
        b='4 a g | b a g | fis d2~ |
        d='4\) a'\( a | a g fis | e d e | fis2.~ | fis4\) cis'\( d | e d cis |
        b='4 ais cis | fis,2. | b4\) b\( b | b2.~ | b4 a g | fis d cis |
        \alternative {
          \volta 1 { b=2.\) | }
          \volta 2 {
            \hSpace b=2._~ \sSlur nf #'((wb . 0) (ws . -2) (ww . 4.5)) ( |
            b=2.) \bar "|."
          }
        }
      }
    } {
      d'='2~ | d2. | cis | d~ | d | d | dis | b2.~ | b4 e2 | eis2.~ | eis |
      s2. | s4 fis='4 e | d2. | cis | a~ | a4 d2~ | d2. | cis4 b a | d2.~ |
      d='4 a'2 | <e b'>2. | e | d2 cis4 | b g' a | g2 fis4 | e2 b4 | ais=2. |
      \rep 3 { s2. | }
    }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  g,=,4-\stBass gM! gM | e g@M! gM4 | fis e d | g gM! gM | a a7! a7 | a a7! a7 |
  d+dM! g+e@m! cis+cis7!4 | fis fis7! fis7 | b bm! bm | d b@m! bm4 | e em! em4 |
  cis=4 e@m! em4 | fis, e@m! em4 | fis fis7! fis7 | b bm! bm4 | fis b@m! bm4 |
  a=,4 am! am | b b7! b7 | e em! em | b e@m! em4 | bes e@m! em4 | a a7! a7 |
  d=4 dM! dM | d dM! dM | c d@M! dM4 | b b7! b7 | e em! em | d e@m! em4 |
  cis=4 cis7! cis7 | gis cis@7! cis74 | ais fis@7! fis74 | fis fis7!2 |
  g=,4 gM! gM | a aM! aM | d dM! dM | fis d@M! dM4 | e em! em | a, a7! a7 |
  d=4 dM! dM | a d@M! dM4 | g e@m! em4 | fis=, fis7! fis7 |
  \duo { r4 bm! r | r gM! r | r em! r | r e@m! r4 | }
  { b,=,2 a4 | g2 fis4 | e2 d4 | cis2 cis'=4 | }
  fis=,4 fis7! fis7 | b bm! a | b bm! fis | b=,2. |
}
{{ end }}
