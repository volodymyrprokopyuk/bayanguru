{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  \duo {
    c''=''4.(\f a8) | bes4(\> a8 \af 8\! g) | f2 |
    c'=''4(\< a8 \af 8\! c) | bes(\> c16 bes a8 \af 8\! g) |
    f='4 c'8(\mf c | d[\< c bes \af 8\! a]) | g4(\> c8 \af 8\! c) |
    a='4\< c8( a | d[ c bes \af 8\! a]) | g4(\> c8 c) | \af 4\! f,='4 b \rest |
  } { f'='2 | f4 e | f2 | f | f4 e | f f | f2 | e | f | f | e | f='4 s4 | }

  \duo {
    <a'=' c>4.(\p a8) | bes4( \acc { c=''16 bes } a8 g) | f2 |
    <a=' c>4( a8 c) | bes( c16 bes a8 g) | f4 c'8( c | d[ c bes a]) |
    g='4(_\dCre c8 c) | a4 c8( a | d[ c bes a]) | g4 c8 c='' |
  } {
    \rep 4 { s2 | } | f'='4 e | s4 f8 <ees f> | f[ fis g a] |
    d,='4 <e a>8 <e g> | f4 f8 <ees f> | f[ fis g a] | d,4 e=' |
  }
  <a= c f>2\f \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \duo {
    a=4-\frBass c | bes2 | a | a | bes | a4 a | s2 |
    bes=2 | a | s2 | bes2 | a=4 d, \rest |
  } {
    f=2 | d4 c | f2 | f | d4 c | f a | bes g | c,2 | f |
    bes=4 g | c,2 | f=4 s4 |
  }
  \meter 1/2 #'(1)
  \clef treble
  f'='4 e | <d f> <c e>8 bes | <a c>2 | r8 f'[ e ees='] \clef bass |
  d='8 g, c <c, bes'> | a' c, r f, | bes a g d' | bes' g, c bes' |
  r8 f,=,8 c' a' | bes, a g d' | bes' g, r <c bes'> | r4 f,=, |
}
{{ end }}
