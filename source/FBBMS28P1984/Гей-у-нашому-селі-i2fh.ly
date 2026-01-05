{{ define "rh1" }}
    {{ .a }} a8 | bes\< bes a g | \af 2\! c2 | bes4 d='') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key f \major
  \time 2/4
  c''=''4(\mp a8 c | bes4 a8 g | f e f d | c2) |
  \duo {
    bes'='4(\< d | d c8 \af 8\! bes | a\> c g4 | \af 2\! f2) |
    {{ template "rh1" (w `g='4.(\mf`) }} | c=''4.( a8 | f e f4 | \af 2\! g2)\> |
    {{ template "rh1" (w `g='4.(\mp`) }} | c=''4.( bes8 |
    a='8\>^\tRit c g4 | \af 2\! f='2) \fermata \bar "|."
  } {
    d'='4 f | e2 | c4 bes | a2 | d | des | r8 a'8[( g f]) |
    g='4 f | e2 | d | c | d | e | f8( f e ees) | d4 e | <d f>2 |
    <bes= e>4( <bes d>) | <a= c>2 \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  R2 | R2 | c'='4(-\frBass a | bes a8 g | f e f d | c2) |
  e=4( d8 e | f4 d8 c) | bes4( f') | ees( e) | f( a) | g( bes) |
  a=4( c) | b( g8 f | e4 c) | bes( a | g c) | a( f) | g2 | bes |
  c=4 c, | f=,2 \fermata |
}
{{ end }}
