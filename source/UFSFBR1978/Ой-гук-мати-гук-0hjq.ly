{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  \partial 4 { g'='8(\mf c='' | }
  d=''4\< <g, ees'>8 \af 16\! <b d> \af 2\! c2)\> |
  \time 6/4
  <ees='' g>4(->\f <d f>8 <c ees> <b d>4 <g g'>8\> b \af 4..\! c=''2) |
  \repeat volta 2 {
    \time 4/4
    <c='' ees>8(\f <ees g> <d fis> <ees g> <b ees>\> d \af 4\! c4 |
    b='8\mf g c <g bes> aes g f4) \fermata |
    \time 6/4 <bes=' d>4(\< <g ees'>8 c b \af 16\! g <f c'>)\> %
    <aes=' c>8-- \af 2\! \af 4.\p g='2 \fermata |
  }
  \time 4/4 r4\f <g=' g'>4.(->\> <g b f'>8 \af 4\! <g c ees>4) \fermata |
  \duo {
    \time 6/4 g''=''4(\pp f8 ees d4 g8 b, c=''2) |
    \repeat volta 2 {
      \time 4/4 ees=''8(\< g fis \af 16\! g ees\> d \af 4\! c4^\tTen |
      b='8\p\< g c <g bes> aes \af 16\! <e g> f4)\mf^\tTen |
      \time 6/4 d'=''8(\< ees16 f ees d c8 b \af 16\! g %
      c=''8)\f\> c-- \af 2\! \af 4.\p g='2 \fermata |
    }
  } {
    bes'='4.( c8 b4. g8 c2) | c8 ees d ees b4 c | s1 |
    bes='4( g8 aes b g f) aes='-- s2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  \meter 1/4 1,1,1,1
  \partial 4 { g,=,8(-\puBass c= | } d=4 g,8 g c2) |
  c+cm!4( b8 c g4 gM!8 g c2) | c4( c g c | g aes8 g f' e f4) \fermata |
  bes,=,4( c8 ees g,4 aes8) f-- g2 \fermata |
  g=,8-> c-> d4-> ees8-> d-> c4 \fermata | ees( d8)-. c-. g4. d'8-. c2 |
  c=8( c c4 g c^\tTen | g8 b c e f c f4)^\tTen |
  bes,=,8( c16 d ees8 f g,4 aes8) f-- g=,2 \fermata |
}
{{ end }}
