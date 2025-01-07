{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  \duo {
    c''=''4.(\f a8) | bes4(\> a8 \af 8\! g) | f2 |
    c'=''4(\< a8 \af 8\! c) | bes(\> c16 bes a8 \af 8\! g) |
    f='4 c'8(\mf c | d\< c bes \af 8\! a) | g4(\> c8 \af 8\! c) |
    a='4\< c8( a | d c bes \af 8\! a) | g4(\> c8 c) | \af 4\! f,='4 b \rest |
  } { f'='2 | f4 e | f2 | f | f4 e | f f | f2 | e | f | f | e | f='4 s4 | }

  \duo {
    <a'=' c>4.(\p a8) | bes4( \acc { c=''16 bes } a8 g) | f2 |
    <a=' c>4( a8 c) | bes( c16 bes a8 g) | f4 c'8( c |
    d=''8 c bes a) | g4(_\dCre c8 c) | a4 c8( a | d c bes a) |
    g='4 c8 c | <a,= c f>2\f \bar "|."
  } {
    % f'='4 e | <d f> <c e>8 bes | <a c>2 | r8 f' e ees |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
}
{{ end }}
