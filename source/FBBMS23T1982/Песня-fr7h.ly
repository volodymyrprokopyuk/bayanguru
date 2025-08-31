{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 4/4
  \partial 4 { d'='8(\p f | }
  a='4. f8 e4 g | f8 e d2) d8( f | e g g e d4) d8( f |
  a='4. f8 g4 bes | a8 g f2) g8( a | bes d d bes a4) b8 cis='' |
  \duo { d''=''4. a8 f'4. d8 | e8. f16 e2 d8 e | d4. d8 bes4 d, | <e=' a>2~ 4 } %
  { f'='2 a | gis1 | d2 s2 | d2( cis='4) } d,='8( f | a4. f8 e4 g | f8 e d2) %
  \duo { d'='8( f | e[^\tRit g] g e' <f,=' d'>2) \bar "|." } { s4 | e'='4 g=' s2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \partial 4 { r4 | } d=8(-\frBass f a4 bes2) |
  \duo { a=1( bes2 a=4) } { r4 f=8( e d2)~ | d2~ d=4 } r4 |
  d,=8( f a4 bes c | f8 c a g f=4) r \clef treble | g'='8 f e d=' \clef bass %
  \duo {
    cis'='2 | r8 f, a f r f a f | r e gis e r e gis e |
    r8 d=8 g d r d g d | a d e g a=4 %
  } { a=8 g f e | d2 c | b b | bes bes | a~ a=,4 } r4 |
  d,=8( f a4 bes2) | \duo { a=2~ a | bes( a=) | } { r4 f=8( e d2) | d~ d= | }
}
{{ end }}
