{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  e''=''8\mp c d b | c4 c8 d | e c d b | c4 e |
  a,='8 a g b | c c c c | a a g b | c4 c |
  <e='' g>4\mf <d f> | <c e>4. <d f>8 |
  <e='' g>4-- <d f>16( <f a> <e g> <d f>) |
  \duo { e''=''2 | } { c''=''4( d='') | } | <c='' e a>4 <d e gis> |
  \duo {
    <c''='' a'>2 | c'='''16(^\tRit b a8)~ a16( b g8)~ | g( f e=''4) \bar "|."
  } { e''=''4( f) | <d f>2 | <c='' c'> | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \duo { g'='4( f | e f) | g( f | e g) | f2( | e | f | e=') | }
  { c'='2~-\frBass | c | c~ | c | c4( b8 a | g4 a~ | a b | c='2) | }
  r16 g'='16( a g) r g( a g) | r g( a g a g b g) |
  r16 g='16 e c a'8 b | a16 b a8~ a16 b gis8 |
  \duo { b'='16 \rest a='16~ a8 b16 \rest b16~ b8 | a='2 | }
  { s16 e'='16( f e) s16 e( f e) | e( f e f d e d f=') | }
  g='8 \clef bass g,=8 g f | e d c=4 |
}
{{ end }}
