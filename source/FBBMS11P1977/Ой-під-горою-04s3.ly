{{ define "rh1" }}
  c=''4( e d8 c) | b4( d c8 b) | c4( a fis | g2 {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/4
  g'='4(\p\< g8 a b c | d2 \af 4\! g4) | e( g e | d2\> \af 4\! b4) |
  {{ template "rh1" (w `b='4)`) }} {{ template "rh1" (w `g='4)`) }}

  g='8(\mf fis g a b c | d g, b d g f) | e( d c g' fis e | d c b a g f) |
  e='8( g c a d c | b g d g a b) | c( a fis e' d c='') |

  \duo {
    b'='8--\<^\tRit c d-- e \af 4\! f4-- | e(^\tATem c d8 c) |
    b='4( d c8 b) | c4( e d | g4) fis,8_( g a d,) | g8(\f a b4) c |
    d=''8( e d c b a) | g( c e4) fis8( e | d4)\> d8( c \af 4\! b4) |
    a='4\mf c b8( a | g4) b a8( g | fis4) dis cis8( dis |
    e='8\< fis g a ais \af 8\! b) | c4\f e d8( c | b4) d <c e>8( <b d> |
    <e,=' a c>4)--^\tRit <e a>-- <c=' fis>-- |
  } {
    s4 b'='4 a | g2 a4 | g fis f | e a8 g fis4 | <g b> s2 |
    b,=8 d g4 fis | g2 f4 | e g d'8 c | b4 g8 e d4 |
    c='4 e dis | d2 e4 | cis b b | b dis8 e fis g |
    e='4 g fis | d fis f=' | s2. |
  }
  <b,= g'>2-- <b= d g>4-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  R2. | g'='4-\frBass g8( a b4) | c8( b a4) a8( ais | b4) b8( a g4) |
  e='2( fis4) | g( b, d) | e2( c='4 \clef bass | b= a g) | <e g>2( <fis a>4) |
  \duo { d'='2 e4~ | e2 d4~ | d='2. | } { g=2 gis4 | a( c2 | b4 a g=) | }

  r4 b=8( c d e) | f4 d b | c e c | b d b | c8( b a g fis4) |
  g=8( a b4) d | e8( c a4) fis | g-- a-- b-- | c8( b a4) fis |
  g=2 gis4 | a8( e c4) d4 | <g,=, d' g> r r |

  g=,4-\stBass gM! a | b g@M! gM4 | c cM! cM | g gM! gis |
  a=,4 am! fis | e g@M! c'4 | ais b a | g fis e | a am! d |
  g,=,4 gM! gis | a-- c-- d-- | g,=,-- gM! g+gM-- |
}
{{ end }}
