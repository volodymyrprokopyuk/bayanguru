{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \major
  \time 2/4
  d''=''8->\mf d d16( cis b8) | a a a a | d-> d d16( cis b8) |
  a='4 \duo { d''=''4 | } { r8 cis''='' | } b8-> b b16( a b8) |
  fis='8( g16 a) b8 a | b b cis cis | d4\< \af 4\! cis='' |

  \duo { fis''=''2 | e | d4 e | d16\< a b a b a b \af 16\! a=' | }
  {
    b'='16 d cis d b a b8 | fis16( g a8) b a |
    b='16 a b fis cis'( b cis8) | fis,='2 |
  }

  <fis,=' a d>8\f 8 <fis g b d> <e g b d> |
  \duo {
    <g'=' a>8 8 a,16 <fis' a>16 8 | a16 b a d d cis b8 |
    <cis,=' e a>8 <e a cis> d'( cis) | b b b16( a b8) |
    fis='8( g16 a) b8 a | b b cis16( b cis=''8) |
  } {
    r16 a=16 cis b r8 e | fis fis <e g>8 8 | s4 <e fis>4 |
    b=16( cis d8) dis4 | e fis | g16( fis e8) g='4 |
  }
  <fis=' d'>8 <a fis'>16 <g e'> <fis d'>8 fis16 e=' |

  d='16\mp e d e fis_\dCre g fis g | e fis g b b a b cis |
  d=''16 fis d a b a g fis | g a b cis d e d cis='' |
  \duo {
    fis''=''2(\mf | g) | a4 g | fis a | \af 2\! a=''2\> \fermata \bar "|."
  } {
    d''=''16 cis d b dis cis dis b | a( b cis8) b a |
    b='16 d cis d b d cis e | d a d a fis' d fis d | <b=' d fis>2 \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=8-\stBass dM! g, e@m! | a8 a7! g a@7! | fis8 d@M! g8 e@m! |
  a=,8( g fis) fis7! | b bm! fis b@m! | b8 a@M! b8 a@M! |
  b=,8 bm! b a@M! | b8 a g fis=, |

  b=,8 bm! fis b@m! | a8 aM! fis a@M! | b8 bm! a a7! | d[ dM! dM] a=, |

  d=8 dM! g, e@m! | a8 a7! g a@7! | d'8[ dM!16 dM] e,8[ g@M!16 gM16] |
  a=,8( g fis) fis7! | b bm! b( a | g) e@m! g8 d@M! |
  e=,8[ em!16 em] a8[ a7!16 e7] | d8 dM! d= r |

  fis,=,8 d@M! g8 e@m! | a8 a7! g a@7! | fis8 d@M! e8 em! |
  a=,8( g fis) fis7! | b bm! b b7! | b a@M! cis8 a@M! |
  d=8 b@m! b=,8 a@M! | d@M!16[ dM16 dM dM] dM[ dM dM dM] |
  d@M!16[ b@m!16 d@M!16 b@m!16] d@M!4 |
}
{{ end }}
