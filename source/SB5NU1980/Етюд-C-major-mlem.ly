{{ define "rh1a" }}
  {{ .a }} f | g2. f4 | e g c, e |
  a,='16 b a b a d cis d g, g' fis g d f e d |
  e=''2_\dCre g | fis4 c'2 b4 | b2\mf a | fis2 g=''8 %
{{ end }}

{{ define "rh1b" }}
  {{ .a }} a ais b c d c a bes b c cis d e d |
  b='16 c b ais b c d e f e d c b a b g |
  c=''16 d c d c b c b a b a b a gis a gis |
  e='4 fis g2 | g16 gis a ais b c d c b c cis d cis d e d |
  c=''16 cis d ees d ees e f fis g gis a fis a g fis |
  g=''16 fis g a g fis e dis e dis e fis e d c b |
  a='16 ais b c cis d e d g,='8 r r4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 4/4
  \duo {
    {{ template "rh1a" (w `e''=''2^\aLeg`) }} fis16\> g e f cis \af 16\! d='' |
    {{ template "rh1a" (w `e=''2`) }} g16\> fis g f e \af 16\! d='' |
  } {
    {{ template "rh1b" (w `g'='16\p gis_\aLeg`) }}
    {{ template "rh1b" (w `g='16\p gis`) }}
  }

  \repeat volta 2 {
    \duo {
      cis''=''2\p d4 e | f e f2 | gis,_\dCre c4 a' | a a gis_\dDim g |
      e=''2\p d | b c4 g | g f d g | e g c e_\dCre |
      g=''2. f4\< | e \af 4\! g c e=''' |
      \ottava #1 g='''2.\f f='''4 \ottava #0 |
      e='''4\ff
    } {
      g'='16 f e f g bes a f f g gis a b a gis a |
      gis='16 a bes b d cis b cis d e d c b c b a |
      gis='16 e dis e f fis g gis a gis a b cis b cis a |
      d=''16 cis d a dis cisis dis a e' dis e b f' e f b, |
      c=''16 d c b c d b c a b g a f g e f |
      d='16 e f fis g a f g e g d e c d b c |
      a=16 b c cis d e d c b c b a b c a b |
      c='16 g b c e c dis e g e fis g c g b c |
      b='16 ais b c cis d dis e f e d c b c a b |
      c=''16 g b c e c dis e g e fis g c g b c=''' |
      \ottava #1 b=''16 ais b c cis d dis e %
      f='''16\< e d c b c a \af 16\! b='' \ottava #0 |
      c='''16
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
