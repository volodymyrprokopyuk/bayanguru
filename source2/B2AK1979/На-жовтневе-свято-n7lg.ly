{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key d \major
  \time 2/4
  \repeat volta 2 {
    d'='8-.\mf e-. d-. d-. | fis-. g-. a4 |
    b='8-. a-. g-. b-. | <d, fis a>4-- <c e a>-- |
    d='8-. e-. d-. d-. | <d fis>-. <e g>-. <d a'>4 |
    fis='8-. a-. g-. e-. | d4 d=' |

    <gis,= b e>8[\mp r <a cis fis>] r |
    <b= d g>8-. <b d e>-. <a cis fis>8-. 8-. |
    <b= d g>8-. 8-. <b d fis>-. <d fis b>-. |
    <e=' a>4 <dis=' a'> |

    b'='8-.\f \acc { cis=''8 } d-. a-. \acc { gis='8 } a-. |
    b='16( cis d b a8)-. fis-. | g-. g-. fis-. a-. |
    e='4 d16(\< e fis \af 16\! a) |
    b='16(\f cis d b) a( a' gis a) |
    b,='16( cis d b) a( gis a d,) |
    g='16(\mp a g_\dCre g) fis( g fis dis) |
    \alternative {
      \volta 1 { e='16( fis e cis) d='8\f r | }
      \volta 2 { e='16( fis e cis) d8 d16 d=' | }
    }
  }
  g='16( a) g g fis( g fis dis) |
  e='16( fis e cis) d8 <fis=' d'>\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=8-\stBass dM! d dM | a d@M! fis8 d@M |
  g=,8 gM! g gM | d' dM! d+dM4 |
  d=8 dM! b bm! | d dM! fis,=, d@M |
  b+bm!8 r r a+a7! | d+dM!4 d+dM |

  d'=8-\puBass d16 d d8 d16 d |
  \rep 2 { d=8 d16 d d8 d16 d= | } cis8 c b=,4 |

  g=,8-\stBass gM! fis d@M! | g8 gM! fis d@M! |
  e'=8 em! e fis@m! | r8 e@m![ d+dM!8] r |
  r8 g+gM![ d+dM!] r | r g+gM![ fis+d@M!] r8 |
  r8 g@M![ r8 b@7!] | e@M!8[ a@7!8] d@M!8 r8 |
  e@M!8[ a@M!8] d@M!8 r8 | r8 g@M![ r8 b@7!] |
  e@M!8[ a@7!8] d=8 d+dM! |
}
{{ end }}
