{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 2/4
  c''=''8\p d16( c bes8) g | f a c, c | f f g g | a f bes d |
  c=''8\mf d16( c bes8) g | f a c, e | f a g e | f4-- f='-- |

  \repeat volta 2 {
    d'=''4--\f d8 d | d d16( e f8) d | c4 a8 bes | c4 f |
    g,='8\mf g16( a bes8) bes | bes d c bes | a c g c | f,4 f'=''-> |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f=8-\frBass r c_\aSta r | \rep 2 { f=8 r c= r | } | f r d bes |
  \rep 3 { f'=8 r c= r | } f4-- f=-- |

  <bes= d>4-- 8 8 | 4 d8 bes | <f c'>4 r4 | 4 4 | c4 c8 c |
  c=4 d8 e | f4 c8 c | f,4 f=,-> |
}
{{ end }}
