{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 2/4
  e'='4(\p c' b8 g fis g | e4.) b8( | e4 c' | b8 g fis g | e4 d) |
  \duo {
    d''=''4( d8 d | e4 d) | e8( c b a | e'4. d16 c) |
    <g=' b>4.( <a c>8 | b4_\dDim b8 b | \af 2\! <e,=' e'>2)\> |
  } {
    b'='8( a g4 | g2) | fis4( g8 fis | e2) | s2 | g8 fis16 e fis8 fis=' | s2 |
  }

  <g'='' b>4\mf <fis a> | <e g> <a, b> |
  <g=' e'>8 <a c> \duo { b'='4 | } { g'='8 fis=' | }
  g='8 <b d> <c e> <e fis> | <d g>4 <e b'>8 <fis a> | <g b>2 |
  \duo { a''=''4 g | f'8 e d='''4 | } { f''=''2 | a='' | }
  <gis='' e'>4 <g d'>8 <fis c'> | <g b>4. <fis a>8 |
  <e='' g>8 <d fis> \duo { e''=''8\> fis | g fis16 e fis8 \af 8\! b,=' | }
  { c''=''4 | b a8 a=' | } <g,=' e'>4 e16\< fis g \af 16\! a=' |

  b='16\f g fis e fis g a c | b e fis g a b g fis |
  e=''16 c b a g fis g a | b g fis e c' a g fis |
  d'=''16 b a g e' a, g fis | g d e fis g a b c |
  d=''16 c b a gis f' e d | e c b a b g fis e |
  fis='16 g a b c d e fis | g e d c b g fis e |
  b=16 e fis g a b c a | b e fis g a_\dDim e g fis |
  e=''16^\tRit c b a e='4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \rep 3 { R2 | } b=4( a | g d | e fis) |
  g=4( a8 b | c4 b) | a( <b, b'> | <c g'> <d fis>) |
  \duo { e=2 | e8( g a16 b a8 | g=2) | } { e=4 c | b2 | e= | } \clef treble |

  g'='8( e a c | b g fis g | e4.) b8( | e4 a8 c | b g a d, | g a b c) |
  d=''8( c b a | g4 b8 f') | e( c b a | e g d' c) | b4( a | g b, |
  e='4) r \clef bass |

  \duo { g=4 c | b8 g fis a= | } { e=2~ | e4 d= | }
  <c,= e>4. <b fis'>8 | <e g>4 <fis a> | <g b> %
  \duo { c'='4 | b=2 | } { a=8 d, | g4. fis=8 | }
  <f= a>4 <e b'> | <a c> <b d> |
  \duo { e'='2 | e4 d8 c=' | } { c'='8 b a4 | g8 a b a= | }
  <g= b>8 <fis d'> <f ees'>4 | <cis g' e'>4 <c bes' e>~ | 8 <fis c' e> <e= b'>4 |
}
{{ end }}
