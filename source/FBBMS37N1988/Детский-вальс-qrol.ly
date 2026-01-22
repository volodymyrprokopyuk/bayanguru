{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \major
  \time 3/4
  d'='4->\mf <fis a> r | cis-> <g' a> r | d-> <fis a>4 4 |
  cis='4-> <g'=' a> r \bar "||"

  \repeat segno 2 {
    \volta 1
    d='4\f fis a | d2 a4 | d, fis a | cis2 b4 | e, g b | a2 e4 | fis2.~ | fis |
    d='4 fis a | d2 cis4 | e d b | e, g b | cis d e | cis b a | d r fis |
    d=''2. \fine \bar "||"

    \volta 1
    b='4(->\p <d fis>4) 4 | <e g>-> <d fis>2 | ais4(-> <cis e>4) 4 |
    <d='' fis>4-> <cis e>2 | b4 d fis | b fis d | e g, fis' | e=''2. |
    <e='' g>8-> 8 4 4 | <fis a>4-> <e g>2 | <d fis>8-> 8 4 4 |
    <e='' g>4-> <d fis>2 | b'4(-> g) e | fis b, d | cis(-> fis) fis, |
    b='2. \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  d=4-\stBass dM! r | e a@7! r4 | d dM! dM | e= a@7! r4 |

  d=4 dM! r a d@M! r4 | fis d@M! r4 | e' em! r | g, e@m! em4 |
  a=,4 a7! a7 | d cis b | a b cis | d dM! r | fis, fis7! r |
  g=,4 e@m! r4 | b e@m! r4 | a a7! a7 | g a@7! a74 |
  fis=,4 d@M! r4 | d'= dM!2 |

  b=,4 bm! bm | fis b@m! bm4 | cis' fis@7! fis74 | ais fis@7! fis74 |
  b=,4 bm! bm | fis b@m! bm4 | g e@m! em4 | b e@m! em4 | a a7! a7 |
  cis=4 a@7! a74 | \rep 2 { fis,=,4 b@m! bm4 | } g e@m! r4 |
  fis=,4 b@m! r4 | fis fis7! fis7 | b=,4 bm!2 |
}
{{ end }}
