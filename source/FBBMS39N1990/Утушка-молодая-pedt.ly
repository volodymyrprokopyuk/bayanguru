{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  R2\mf | \rep 3 { R2 | }
  e''=''4(\mp e | d c8 c | b4 a) | e'( e | d c8 c | b e a,4)-- |
  gis='8( e e gis) | a a a a | gis e e gis | a e' a e |
  gis=''8 e e gis | a a a a | e d e16( d c b | a8) e' a=''4 \barFermata \bar "||"

  \tempo Allegro
  \key a \major
  e=''4\mf e | d cis8 cis | b4 a | e'8 fis e a |
  e=''8 fis e d | cis(-> b a4) | b8(-> a) gis16( b fis8) |
  e='8( a) a16( b cis8) | b16( cis b a) gis( b fis8) |
  e='16 f fis gis a b cis d | e fis e fis e d cis b |
  a='16 gis fis e d cis b a | b cis b cis d e fis gis |
  a='16\<^\tRit b cis e a <a, cis>16 16 \af 16\! <b=' d> |

  \tempo Sostenuno
  <a=' cis e>8\f fis' <e, a cis>4 | <fis b d> <e a cis>8 e' |
  <d,=' fis b>4 <cis e a> | <e a cis> <a cis e>8 8 |
  <a=' d fis>8 a' <a, cis e> a' | <d, fis b> gis <a, e' a> <e a cis> |
  <d=' fis b>4 <cis e a> | <a d fis>8 gis' <cis, e a> cis' |
  <fis,=' b d>4. gis8 | <cis, e a> b' <e, a cis> e' |
  <b=' d fis>4. <gis b e>8 | <a cis e> fis' <a, cis e> a' |
  \rep 2 { <d,='' fis a>8 b'='' } | <cis, e a> cis' <cis,='' e a> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \duo {
    \rep 2 { r8 <c'=' e>8[ r <b e>] | r <b d>[ r <c ees>] | }
    r8 <c=' e>8[ r <b e>] | r <b d>[ r <d f>] | r <d e>[ r <c=' d>] |
  } {
    a=4-\frBass c | a e | a c | a e | a c | a a | e e= |
  }

  c'='8-. b-. c-. a-. | e-. b'-. e,-. a-. | gis4-- a-- |
  d='2( | c4) f8 e~ | e d~ d16 c b8 | a4 f8 g | \rep 2 { e=8 <d'=' e> } |
  c='8 b a c | e,4 gis | a8 e a,=,4 |

  \key a \major
  a=,8-\stBass aM! e' a@M! | b8 bm! e a@M! | e8 e7! a, aM! | a aM!4 aM8 |
  d=8 b@m! e8 e7! | a, aM! r aM | d dM! d dis | e a@M! cis8 a@M! |
  d=8 b@m! e8 e7! | gis, e@7! e'8 a@M! | b8 e@7! gis8 e@7! | e'8 a@M! b8 bm! |
  e=8 e7! b e@7! | cis8 a@M! a=,8 r |

  \meter 1/2 #'(1)
  a=,8-\puBass a a a | \rep 2 { a=,8 a a a=, | } | a gis fis e |
  d=,8 d e e | d d cis' cis= |

  \meter 1/4 1,1
  d=8-\stBass b@m! e8 a@M! | b8 bm! e a@M! | b8 bm! d b@m! |
  cis=8 a@M! e8 a@M! | d8 b@m! e8 e7! | a, aM! e' a@M! |
  b=,8 bm! e e7! | a, aM! a=, r |
}
{{ end }}
