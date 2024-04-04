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

{{ define "rh2b" }}
  {{ .a }} b a g fis g f g e f g e d e f d |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r cM! r c r d@m! r8 | c r g@7! r8 c r g@7! r8 |
  c+cM! r g+gM! r a+am! r e+eM! r | c+a@m! r8 d+d7! r g+gM! r r4 |
  c=8 r cM! r g r gM! r | d' r d7! r d4( dis) |
  e=8 r em! r c r a@m! r8 | d= r d7! r g+gM! r r4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 4/4
  \duo {
    {{ template "rh1a" (w `e''=''2`) }} fis16[\> g] e f cis \af 16\! d='' |
    {{ template "rh1a" (w `e=''2`) }} g16[\> fis] g f e \af 16\! d='' |
  } {
    {{ template "rh1b" (w `g'='16\p gis^\aLeg_\aLeg`) }}
    {{ template "rh1b" (w `g='16\p gis`) }}
  }

  \repeat volta 2 {
    \duo {
      cis''=''2\p d4 e | f e f2 | b,_\dCre c4 a' | a a gis_\dDim g |
      e=''2\p d | b c4 g | g f d g | e g c e_\dCre |
      g=''2. f4\< | e \af 4\! g c e=''' |
      \ottava #1 g='''2.\f f='''4 \ottava #0 |

      e='''4\ff d c g | e d c g | e' d c g | g g2 g4~ | g='8 %
    } {
      g'='16 f e f g bes a g f g gis a bes a gis a |
      gis='16 a bes b d cis b cis d e d c b c b a |
      gis='16 e dis e f fis g gis a gis a b cis b cis a |
      d=''16 cis d a dis cisis dis a e' dis e b f' e f b, |
      c=''16 d c b c d b c a b g a f g e f |
      d='16 e f fis g a f g e f d e c d b c |
      a=16 b c cis d e d c b c b a b c a b |
      c='16 g b c e c dis e g e fis g c g b c |
      b='16 ais b c cis d dis e f e d c b c a b |
      c=''16 g b c e c dis e g e fis g c g b c=''' |
      \ottava #1 b=''16 ais b c cis d dis e %
      f='''16\< e d c b c a \af 16\! b='' \ottava #0 |

      {{ template "rh2b" (w `c='''16`) }}
      {{ template "rh2b" (w `c=''16`) }}
      c'=''16 b a g fis g f g e g f e d f e d |
      c='16_\dDim e d c d f e d c e d c d f e d | c='8 %
    }
    e'='16\< g c, e g c e g c e g, c e \af 16\! c |
    g'='''16\f\> e c g e c g e \af 8\! c='8-. r r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8-\stBass`) }}
  {{ template "lh1" (w `c=8`) }}

  bes=,8 r a r d, r cis r | d r a+a7! r d+dm! r r4 |
  e=,8 r e7! r a+am! r g+a@7! r8 | fis+d@M! r8 a+f@M! r8 e+eM! r g+g7! r |
  c'=8 r cM! r f, r d@m! r8 | g r gM! r c+cM! r e+c@M! r8 |
  f=,8 r d r g r g+gM! r |
  \rep 2 { c,=,8 r g' r e r c r | g' r g7! r g=, r g7! r | }

  \rep 3 { c+cM!8 r g+gM! r c+cM! r g+g7! r | }
  c+cM!8 r g+g7! r c+cM! r g+g7! r |
  c+cM!8 c,=,16[ e] g c e g c,, e g c e g c g |
  e=16 c g e c g' e c c=,8-. r r4 |
}
{{ end }}
