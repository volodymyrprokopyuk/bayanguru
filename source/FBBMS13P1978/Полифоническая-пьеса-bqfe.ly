{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  \repeat segno 2 {
    \volta 1
    a'='8(\p b c a d4 c8 b | a2) f'8( g e4) | d( a8 b c4 d8 c | b c b a gis2) |
    a='8( b c a) a'4( g) | g8( f e d) a4.( b8) | c4 c e8( d a b) |
    c=''8( d b4 a='2) \fine \bar "||"

    \volta 2
    a='4(\mf f g) d8( e | f g a bes) %
    \duo {
      c''=''2~ | c4 a8( g) a4( g8 f) | aes4( g8 f) bes2~ |
      bes='8 bes( g f) g( c g4) | fis8( b fis4~ fis8) f( bes aes) |
      fis='8(\> g ees d ees f fis \af 8\! g) | gis='1 \bar "||"
    } {
      d'='4( e) | f e d2 | ees2. d4 | c1 | b1~ | b1 |
      d='8( e c b) g'(^\tRit f) f( e=') |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  R1 | a'='8(-\frBass g f e d4 c) | f2 e4( a,) | d2 e8( f e d) |
  c='2 cis | d2 g8( f e d) | e4( a,) f'2 | e2( a,=) |

  f'='8( e d c) <bes= d>2 \clef bass | <a= c>2 %
  \duo { bes=2 | a f~ | f4 aes~ aes2 | g2 ees( | d cis=) | }
  { g=4( c,) | d4( c) bes2 | b bes | ees aes,~ | aes=,1 | }
  <g,=, d'>2 r2 | <e b'> <e'= b'> |
}
{{ end }}
