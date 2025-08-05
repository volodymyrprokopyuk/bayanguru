{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  R2\f\> | R2 | f'='4(\mf c' | bes a8 g | f4) r |
  f='4(\p <a c> <g bes>4 <f a>8 <c g'> | f='4) %
  \duo {
    c''=''8(\mf <a c> | d c bes a | g4) c8( bes |
    a='4) f8(\p f | bes a g f | c4) d8( e | f4)\< \af 4\! b \rest |
    f='4(\mf c' | bes a8 g | f4) r | f( c' | bes a8 g | f4) c'8(\f c |
    d=''8 c bes a | g4) c8(\> bes | \af 4\! a4) f8(\mf <c f> |
    bes'='8 a g f | c4) d8(^\tRit e | f='2) \fermata \bar "|."
  } {
    s4 g'='4 f | s4 e4 | f s4 | e d | s4 bes | a s4 |
    f'='2~ | f4 e | f d8( e | f4) d~ | d e | s4 a8 g |
    fis='2 | g4 d | cis s4 | bes8 c d4 | c bes | \af 2\! a=2\> |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  f''=''8-\frBass f f f | \rep 3 { f=''8 f f f='' | } | f f f c |
  d=''8 d d d | c c c c | bes a g f | e c d c | e d=' \clef bass c=' g |
  c='8 f, <a d>8 d, | <g d'>8 d <g bes> d | <g bes> d e c |
  f=8 g a bes | c( a ees'4) | d8( c bes4) | a8( g f c) | d( e f4) |
  g=8( d c bes | a c) f( ees | d4 c | bes8 d e4 | a,) d4( |
  g,=,8 a bes4~ | bes8 a) g4( | <f=, c'>2) \fermata |
}
{{ end }}
