{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 4/4
  a'='4(\mf a a8 g f e | g4. f8 e4 e) | a( a c b8 a | g4. f8 e4 d) |
  \rep 2 { e='4( e d c8 d=') | }
  \duo {
    e'='4( e g g | a2 a4)\< \af 4\! b | a8(\f b c d e2) |
    b='8( c d b c4 a) | d( a f' g8 f | e4.\> d8 c4 \af 4\! b) |
    a='2(\mp\< b4 e8 d) | c4( e f g8 \af 8\! f='') |
  } {
    e'='4( e d2 | c f) | e( c'4 a) | f2( g) | f( a4 g~ | g1) |
    g='2( f) | a( b=') |
  }
  <c'='' e>2.( <d e b'>4 | <c e a>2)\f <a=' a'>4-> \fermata r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  R1 | R1 | r4 d'='2( f4 | e d c b=) \clef bass |
  r4 c='4( g2) | r4 c( f,2) | c'4( e, b' e, | a e d) g |
  a=2( a8 g f e | g4. f8 e4 c) | r a'( c b8 a | g4. f8 e4 d) |
  r4 e=4( d c8 d) | e4( e b c8 d) | e4( e g g | a2) a,=,4-> \fermata r |
}
{{ end }}
