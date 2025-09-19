{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 4/4
  f'='8(\p g f g a bes a bes | c f e d c a g4) |
  c=''8( f e d c a g4 | a8 bes a c g2) | a8( bes a c g2) |
  f='8(\< g f g a bes a \af 8\! bes | c\> a' g e f d c \af 8\! a) |
  g='8( a g a bes d c a | g a g d f2) | g8(\>^\tRit a g c \af 2\! f,='2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  r4 <a= c>4-\frBass r <f c'> |
  \rep 2 { r <bes= f'>4 r \duo { e'='4 | } { e'='8( c=') | } | }
  r4 f'='4(~ f8 d e c) | r f,( c' f~ f d e c) |
  r4 \duo { c'='4( cis  d | ees e a, f'=') | } { a=4 r f | r bes( a=2) | }
  r4 <bes= d>4 r <a e'> | r bes(~ bes8 a g f) | r c'4( bes8~ bes g a f=) |
}
{{ end }}
