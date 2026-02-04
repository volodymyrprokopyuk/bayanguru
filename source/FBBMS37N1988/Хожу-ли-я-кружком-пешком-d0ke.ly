{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  c''=''8->\mf <c e> d-> <f g> | c-> <c e> g-> <d' f> |
  c=''8-> <c e> d-> <f g> | c-> <e g> g,-> <d' f> |
  c=''8(-> e) d4 | c8 c g g | c8(-> e) d4 | c8 c g4 |
  c=''8 c b b | a a g4 | c8 c b b | a\< a g a16( \af 16\! b=') |

  c=''8->\mf <e g> d-> <f a> | c-> <a c e> g-> <d' f> |
  c=''16(-> d) <e g>8 <f a>16(-> e) d8 |
  c=''16(-> <e g>) c <e g> <d f>16 g, <d' f>8 |
  c=''16(-> e) g,8 b16(-> d) g,8 | a16 c b a g f e d=' |

  \duo { r8 <e'=' g c>8[ r8 <g=' b d>] | } { c'='4-> d='-> | }
  <e=' a c e>8-> <fis fis'> \duo { r8 <b'=' d>8 | } { <g'=' g'>4-> | }
  c'=''16-> d e8 d16 f e d | c b c a g f e d |
  c='16 d e c d f e d | c b c a g a b d |
  c='8-> <e g a> b16 d g b | a c b a g a b d |
  <c='' e>16(-> e,) <a c> g <b d>(-> d,) <g b> e |
  fis='16 e fis a=' %

  \duo { g'='4-> | } { r8 <b= d>8 | }
  r8\f <g,= c e>8[ r <b d g>] | r <c e g a>[ r <d g b>] |
  r8 <e=' g c>8[ r <g b d>] | r8 <g a c e>[ r <b d e g>] |
  <c='' e>16(-> <b d>) <a c>8 <b d>16(-> <a c>) <g b>8 |
  \duo { a'='16 c b a=' } { fis'='8 r } g='16 a g f |
  e='16 d c e g a b d | c d e fis \duo { g''=''4-> \bar "|." }
  { r8 <b'=' d>8 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8-\stBass cM! g g7! | c cM! d g@7! | c8 cM! g g7! |
  e'=8 c@M! f,8 d@m! | c'8 cM! f, d@m! | g8 c@M! g8 g7! |
  c=8 cM! f, d@m! | g8 c@M! g8( f) | e' c@M! d8 g@M! |
  d=8 d7! g,( f) | e' c@M! d8 g@M! | d8 d7! g,=, r |

  c=8 cM! f, d@m! | g8 c@M! g8 g7! | e' c@M! d8 dm! |
  g,=,8 c@M! g8 g7! | e' c@M! d8 g@M! | d8 d7! g,( a) |
  e'=8-> c@M! d8-> g@M! | d8 d7! g, gM! | c cM! f, d@m! |
  g=,8 c@M! g8 g7! | e' c@M! f,8 d@m! | e'8 c@M! d8 g@7! |
  g,=,8 c@M! d'8 g@M! | a8 d@7! b8 g@M! | a8 am! d g@M! |
  d=8 d7! g,=, gM! |

  c=8-\puBass e d4 | c8 c g g | c e d4 | c8 c g=,4 |
  a=,8-\stBass am! d g@M! | d8 d7! g, g7! | c cM! b g@M! |
  a=,8 d@7! g=,4 |
}
{{ end }}
