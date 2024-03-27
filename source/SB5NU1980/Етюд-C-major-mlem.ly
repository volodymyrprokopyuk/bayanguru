{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 4/4
  \duo {
    e''=''2^\aLeg f | g2. f4 | e g c, e |
    a,='16 b a b a d cis d g, g' fis g d f e d |
    e=''2_\dCre g | fis4 c'2 b4 | b2 a |
    fis=''2 g8 fis16\> g e f cis \af 16\! d='' |
  } {
    g'='16\p gis_\aLeg a ais b c d c a bes b c cis d e d |
    b='16 c b ais b c d e f e d c b a b g |
    c=''16 d c d c b c b a b a b a gis a gis |
    e='4 fis g2 | g16 gis a ais b c d c b c cis d cis d e d |
    c=''16 cis d ees d ees d f fis g gis a fis a g fis |
    g=''16 fis g a g fis e dis e dis e fis e d c b |
    a='16 ais b c cis d e d g,='8 r r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
}
{{ end }}
