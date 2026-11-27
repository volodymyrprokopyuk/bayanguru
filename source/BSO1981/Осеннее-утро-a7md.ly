{{ define "rightHand" }}
\relative {
  \tempo "Adagio espressivo"
  \clef treble
  \key a \minor
  \time 4/4
  a=1(\p | gis8 a b d c4 b8 c) | a2(~ a8\< b c \af 8\! d | <b e>1) |
  c='1( | b8 c d e g4 f8 g) | e2.( d8 c | <a d>2~ 8 c b a=) |
  \time 2/4
  \duo { b=4.(\> \af 8\! a=8) | } { a=4 gis= | }
  \time 4/4
  a=1 | gis4 gis c8(\< d dis \af 8\! e=') |
  \duo { g'='8( f4 g8) e2 | e8( d4 e8) d2 | c\> b4.( \af 8\! a=8) | }
  { c'='2~ c8( b4 c8) | a2 bes8( a4 bes8) | a2 a4 gis= | }
  a,=1\p \time 2/4 gis4 gis | \time 4/4 a1 \time 2/4 gis4 gis |
  \time 4/4 a=1 | gis | \af 1\! a=\pp\>-\fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \duo {
    e=1_\frBass | f | fis | g | a-> | gis-> | g | f | e4 d |
    c=1-> | b8 c d e g4 f8 g | e1 | f~ | f8( e4 dis8 e4 d=) |
    \rep 2 { c=1 | b8[( c d e=]) | } | c1 | b | c= \fermata |
  } {
    \rep 7 { r4 a,=,4 a a=, | } | r a a a~ | a=,2 |
    r4 a=,4 a a | a1~ | a4 a a a | r a a a~ | a1 | r4 a a a |
    \rep 2 { a=,2 | a4 a a a=, | } | a a a a | a a a a=, \fermata |
  }
}
{{ end }}
