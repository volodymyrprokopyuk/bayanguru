{{ define "rh1a" }}
  \time 3/4
  a='8 g d'4. c16 bes) |
  \time 2/4
  a='4 <a c> | c8( {{ .a }} bes) <f a> <e=' g> |
{{ end }}

{{ define "lh1a" }}
  f='8 e d4. e8 | f4 f | <d e> cis=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 2/4
  \repeat volta 2 {
    \duo {
      d'='4(_\markup \dAlt p mp d | bes'8 bes a g | a f f4) |
      f='4( c' | bes8 bes a g | a2) | c4\mf c8( a | d) d( c bes |
      {{ template "rh1a" (w ``) }} | \af 2\! d'=''2\< |
      <a=' c>4\f c8( a | <bes d>8) 8( <a c> <g bes> |
      {{ template "rh1a" (w `^\tRit`) }}| d'=''2~\> | d4~ \af 8\! d=''8 %
    } {
      s2 | d'='2~ | d4. d8 | <c f>2 | g'8 g f e | f4. e8 | <f a>4 f~ | f2~ |
      {{ template "lh1a" }} | d='2 | f4 f~ | f2 |
      {{ template "lh1a" }} | d='2~ | d4~ d='8 %
    } r8 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  R2 | r8 g=8(-\frBass f e | f a4 bes8) | a2( | d4. e8) |
  r8 e='8( d c) | r4 a8( c | bes4 a8 g | a4) r8 c16( bes a8 g) |
  f=4 d' | g, a | r8 c16( bes a g a bes) | c4 f8( e | d2) |
  a=4 r8 c16( bes a8 g) | f4 d' | g, a | r8 a16( c bes8 g | d4~ d=8) r |
}
{{ end }}
