{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  a'='4(\p a e' e | d8 c b a g4 g) | a8( a a a g4 a8 b | c2~ c8 d e g) |
  <f='' a>4(\< 4 \af 8.\! 4 <c e>8 <d f> | <e g> <d f> <c e> <b d> <c e>4 a) |
  <e'='' g>8 <d f> <c e> <b d> <a c>4 <b=' b'> |

  \duo {  \af 1\! a''=''1\> | a~ | a~ | a2. b4 | a=''1 | }
  { a'='2~ a8 b c e | f4( f f c8 d | e d c b c4 a) | e'8( d c b a4 g | a='1) | }

  r8\mf <a=' c e>8[ r8 8] r <gis c e>8[ r8 <g c e>] |
  r8 <fis=' c' d>8[ r8 8] r <g b d>8 8 <b d g> |
  r8 <c='' e fis>8[ r8 8] r8 <b d e>[ r8 <b f' g>] |
  r8 <c='' e g>8\< 8 \af 16\! 8 \duo { r8 <e''='' g>8[ r8 8] | } { b'='4 bes=' | }
  r8\f <a=' c f>8[ r8 8] r8 8[ r8 8] |
  r8 <aes=' c f>8[ r <f a d>] r <e a c> <c f a>8 8 |
  r8 <c=' f aes>[ r <a d f>] r <a c e>[ r <g b e>] |
  r8\> <a= c e>8 8 8 a b c \af 8\! e=' |

  \duo { a'='1~\p | a~ | a2. b4 | a='1 \bar "|." }
  { f'='4 f f c8 d | e d c b c4 a | e'8 d c b a4 g | \af 1\! a=1\> | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  R1 | R1 | a'='2( g | e4 g8 f e2) | a1~ | a~ | a2. g4 | a='1 |

  a='4( a a e8 f | g f e d e4 a,) | g'8( f e d  c4 b | a=1) |

  a=4 a e' e | d8 c b a g4 g | a8 a a a g4 g' | e1 |
  a='4 a a e8 f | g f e d c4 a | g'8 f e d e4 b' | a='2. r4 |

  a='4( a a e8 f | g f e d e4 a,) | g'8( f e d c4 b | a=1) |
}
{{ end }}
