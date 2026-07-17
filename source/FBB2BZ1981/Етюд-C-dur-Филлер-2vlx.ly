{{ define "rh1" }}
  f=''16( g a f d4) e16( f g e c4) | d16( e f d c b a b=' %
{{ end }}

{{ define "lh1" }}
  {{ .a }} a, g16 a b d) e8( g, f16 g a c='') |
{{ end }}

{{ define "lh2" }}
  {{ .a }} e f c b4) c16( d e b a=4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 4/4
  \meter 1/4 1,1,1,1
  \repeat segno 2 {
    \volta 1
    e'='16(\mf f g a g a g f e8)-. f16( c' e8) r |
    e,='16( f g a g a g e f8)-. a16( d f8) r |
    {{ template "rh1" }} c=''16 d e f g4) |
    {{ template "rh1" }} c=''16 g e' g, c=''4) \fine \bar "||"

    \volta 2
    c=''8( b a e a)-. a16( c e8) r | c( b a e f)-. a16( d f8) r |
    {{ template "lh1" (w `f=''8(`) }} | d8( f, g f e16 f g a g4) |
    {{ template "lh1" (w `f'=''8(`) }} |
    d=''8( f, f16 g a c b c d e f=''4) \fermata \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \meter 1/4 1,1,1,1
  c'='8(-\frBass b a g c)-. c16( e g8) r | c,( b a g d')-. d16( f a8) r |
  d,='8( f g16 f e d) c8( e f16 e d c ) | f8( a f d c g' c16 b a g) |
  d='8( f g16 f e d) c8( e f16 e d c) | f8 a f g, %
  \duo { c'='8 g' e='4 | } { c'='2 | }

  a=16( b c d c d c b a8)-. c16( e a8) r |
  a,=16( b c d c d c b a8)-. d16( f a8) r |
  {{ template "lh2" (w `d,='16(`) }} | b16( c d c b g a b c d e f e4) |
  {{ template "lh2" (w `d='16(`) }} | b16( c d c b8 a g16 a b c d='4) \fermata |
}
{{ end }}
