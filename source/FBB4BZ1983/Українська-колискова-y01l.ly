{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key a \minor
  \time 4/4
  \duo {
    e'='8(\pp a b d16 c b4 a) | e8( a b d16 c b4 a) |
    d=''8(\p d d c b4 a) | d8( d d c b4 a) |
    \rep 2 { e'=''8( a b d16 c b4 a='') | }
    \rep 2 { d='''8( d d c b4 a='') | }
    e,='8(\p a b d16 c b a b8 a4) |
    e='8(\> a b d16 c b a b8 \af 4\! a4) |
    c'='''4.(\pp a8 e'='''2) \fermata \bar "|."
  } {
    s1 | c'='4( d) dis8( e c4) | \rep 2 { d='4( dis) dis8( e c='4) | }
    e'=''4( f fis e8 c) | e4( f fis e) | f8( fis f4) f( e) |
    f=''8( fis f4) a8( a a b) | s4 e,,8( a b d16 e c4) |
    s4 e,='8( a b d16 e c4) | s2 <a'='' e'>2 \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  R1 | a,=,8-\frBass e'4 e e e8 | \rep 2 { fis=2( f4 a8 g=) | }
  \rep 2 { c,=4( d) dis8( e c=4) | }
  \duo { \rep 2 { d=2 dis8( e c=4) | } | }
  { a,=,8( bes a4) a8( a a bes) | a( bes a4) fis( e=,) | }
  r2 r4 fis,=,-- | r2 r4 f-- | r2 a=,2 \fermata |
}
{{ end }}
