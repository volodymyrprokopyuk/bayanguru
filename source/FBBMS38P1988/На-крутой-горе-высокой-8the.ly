{{ define "rightHand" }}
\relative {
  \tempo Largo
  \clef treble
  \key fis \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  cis'='4(\mf fis8 gis a gis fis a | cis4 b8 a16 b cis8 a fis4) |
  cis='4( fis8 gis a fis b d | cis b a gis fis2) |
  a='4(_\dCre gis8 a b4. gis8 | e4 e'8 d cis4. cis8) |
  d=''8(_\dDim cis b d cis4. gis8 | b\> a gis cis \af 2\! fis,='2) |

  \duo {
    fis'='8(\mp cis fis gis a gis fis a | cis4 b8 a16 b cis8 a fis4) |
    cis='4( fis8 gis a fis b d | cis\<  b a b \af 2\! cis=''2) |
    a='4(\mf gis8 a b4. gis8 | e4_\dCre e'8 d cis4. cis8) |
    d=''8( cis b d cis4. gis8 | b\> a gis cis \af 2\! fis,='2) \bar "|."
  } {
    s1 | e'='4 fis eis fis | cis2 d4~ d8 fis | a gis fis e a='2 |
    e='2 d | e a4. gis8 | fis2 a8 gis fis e | fis4 eis fis='2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key fis \minor
  \meter 1/4 1,1,1,1
  fis=4-\frBass a fis cis' | fis, d' fis, cis' |
  \duo { a=1~ | a4 b a=2 | } { fis=4 e d b | cis2 fis8( d cis b=,) | }
  <cis,= e>2 <d fis> | <d gis> a'8( gis fis e) |
  <b=, fis'>4.( gis8) a( b cis d) | eis4 b' a8( gis fis=4) |

  fis,=,4-\stBass fism! cis' fis@m! | a4 b cis fis,8 gis |
  a=,4 fis@m! b4 bm! | e e7! a, b | cis a@M! b4 bm! |
  gis=,4 e@7! a8 gis fis e | b'4 bm! cis fis@m!8[ e8] |
  d=4 cis fis@m! fis,=,4 |
}
{{ end }}
