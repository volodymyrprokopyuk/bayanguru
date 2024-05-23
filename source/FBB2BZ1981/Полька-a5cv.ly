{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  g'='8-.\p e'16( dis e8) g,16( fis | f8) d'-. d4-> |
  f,='8-. d'16( cis d8) g,16( f | e8) c'-. c4-> |
  e,='8-. c'16( b c8) e,16( dis | d8) b'-. b4-> |
  d,='16( e f g a8) b | a-. g16( fis  g gis a b=') |

  g='8-. e'16( dis e c g e | f8) d'16( cis d4) |
  f,='8-. d'16( cis d b g f | e8) c'16( b c4) |
  e,='8-. c'16( b c a e c) | d8-. b'16( ais b a f d) |
  b=16( c d e f g a b | c8) c16( b c=''4)-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='8-\frBass <e g> c <e g> | b <f' g>8 4 |
  b,=8 <f' g> b, <f' g> | c <e g>8 4 |
  a,=8 <e' a> a, <e' a> | d <f a>8 4 |
  b,=8 <f' g> b, <f' g> | <c e>4 <b= f'> |

  c='8 <e g> g, <e' g> | \rep 2 { g,=8 <f' g> b, <f'=' g> | }
  g,=8 <e' g> c <e g> |
  a,=8 <e' a> c <e a> | a, <f' a> d <f a> |
  g,=8 <f' g> b, <f' g> | c <e g> <c=' e g>4 |
}
{{ end }}
