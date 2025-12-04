{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \acc { fis'='8 } g='8(-> b) b( d) | d(-> c) c( a) |
  fis='8(-> g) a( b) | a(-> g) d4-- | g16(-> a b8) b( d) |
  e=''8(-> c) a( e') | d(-> e) d( c) | b(-> c) b( a) |
  g='16(-> fis g8) b( d) | d(-> c) c( a) | fis16(-> g a8) a( b) |
  a='8(-> g) \acc { cis=''8 } d4-> | b16(-> a g8) b( d) |
  e=''8(-> c) a( g) | fis e d c | b a b b | b(\p\< e) e \af 8\! g |
  fis='8( c) fis g | fis( e) \acc { ais='8 } b4-> | b,8( e) e g |
  fis='8( c) fis e | fis( b,) g' fis | b e, e16( fis g a=') |

  \duo {
    b'='8 e e g | fis cis fis e | fis b, fis' g | fis e c d |
    b='8 e e g | fis cis fis e | fis b, g' fis | e b d c='' |
  } { b'='2\( | ais | a | g4 a\) | b2\( ais | a | g4 fis='\) | }

  b='16 a g d b' a b g | a e c b c e a b | a b c e fis, g a b |
  a='16 b a g d c' b a | g fis e d b' a g b | a e c e a b c e |
  d=''16 e fis e d e d a | d e fis g fis g a b | g fis e d b' a g d |
  a'=''16 e c b c e a b | a b c e fis, g a b | a b a g d c' b a |
  g=''16 fis e d b' a g d | a' e c e a b c e | d e d e d, e d e |
  d,='16 e fis a <b,= g'>8 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \acc { s8 } g,=,8[-\stBass gM! gM] r | c[ a@m! am8] r |
  d=8 d7! c d@7! | b8 g@M! a8 d@7! | g8[ gM! gM] r |
  c=8 a@m! e8 a@m! | d8 d7! a8 d@7! | d8[ d7! d7] r |
  g,=,8 gM! d' g@M! | c8 a@m! e8 a@m! | d8 d7! c d@7! |
  b=,8 g@M! b8( a | g) gM! d' g@M! | c8 a@m! e8 a@m! |
  d=8 d7! a d@7! | b8 b7! b b | b e@m! b8( bes |
  a=,8) am! c a@m! | g8 e@m! fis8 b@7! | b8 a@m! b8( bes |
  a=,8) am! c a@m! | b8 b7! a b@7! | g8 e@m! fis=,8 b@7! |

  e'=8[ em! r em] | fis[ fis7! r fis7] | b,[ b7! r b7] |
  c=8 cM! a am! | b[ e@m! r8 em] | fis'[ fis7! r fis7] |
  b,=,8[ b7! r b7] | e em! d= d7! |

  g,=,8 gM! d' g@M! | c8 a@m! e8 a@m! | d8 d7! c d@7! |
  b=,8 g@M! a8 d@7! | g8[ gM! r gM] | c a@m! e8 a@m! |
  d=8 d7! c d@7! | b8 g@M! a8 d@7! | g8[ gM! r gM] |
  c=8 a@m! e8 a@m! | d8 d7! c d@7! | b8 g@M! a8 d@7! |
  b=,8[ g@M! r8 gM] | c a@m! e=8 a@m! | r8 d+d7![ r a+d@7!] |
  r8 d+d7![ g+gM!] r8 |
}
{{ end }}
