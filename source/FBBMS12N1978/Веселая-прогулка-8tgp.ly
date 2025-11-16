{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  \partial 8 { a'='16(\mf g | }
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      fis='8)(-> a)-. d fis | e(-> b)-. r g | a cis e(-> cis)-. |
      b='8(-> a)-. r a16( g | fis8)(-> a)-. d fis | e b e fis |
      g=''16(-> a b8)-. e,16(-> fis g8)-. |
      \alternative {
        \volta 1 {
          cis,=''16(-> d e8)-. a, a16[ \sSlur uf #'((ww . 2)) ( g=']) |
        }
        \volta 2 {
          cis=''16(-> d e8)-. <fis, d'>\f \fine \bar "!!" %
          <b,= d>16\p 16 \bar "||"
        }
      }
    }

    \volta 2
    \keyCancelBarChange
    \key g \major
    <b= d>8-> <b e>8 8 <b d>16 16 | 8 <d g> <g b> <b d>16( <a c> |
    <g=' b>8) <d a'> <b g'> <b d> | <c e> <e a> <a c> <c, d>16 16 |
    <c=' d>8 <c e> 8 8 <c d>16 16 | <d fis>8( <e g> <fis a>) <c' d>16 16 |
    d,='8-> <c' d>16 16 e,8-> <c' d>16 16 |
    fis,='8-> <c' d>16 16 <c e>8-> <c d>16 16 |
    <b=' d>8 <b e>8 8 <b d>16 16 | 8 <d g> <g b> <b, d>16 16 |
    <b=' d>8 <g b> <f a> <f b> | <e a> <e g>4-> 16 16 |
    \duo { g'='8 a16 g fis8 g=' | } { cis'='4 cis8 cis=' | }
    <b= g'>8 <b d>16 16 <b g'>8 <d b'> | \acc { dis'=''8 } e8 c a-. <c, fis>-. |
    <b= a'>8-> <b g'>4-> a'16 \sSlur uf #'((ww . 2)) ( g=') \bar "||"
    \keyCancelChangeBar
    \key d \major
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \partial 8 { r8 | }
  d=8-\stBass dM! a a@M | g8 e@m! b8 e@m | a8 a7! cis a@7 |
  d=8 dM! e a@7! | d8 dM! a d@M | g8 e@m! fis=,8 b@7! |
  e+em!8 r a+a7! r | e+a@7! r8 a+a7! r | e+a@7![ a+a78] d+dM! r |

  \keyCancelBarChange
  \key g \major
  g'=8-\frBass <b d> d, <g b> | \rep 2 { g=8( b d,=) r | }
  a'=8( c e,) r | d <fis c'> a, <fis' c'> | d( des c) r |
  c'='16(-> b a8)-. g16(-> fis e8)-. | d( e fis) r |
  g=8 <b d> d, <g b> | g( b d,) r | g g, g' g, |
  c=8 <g' c> b, <g' c> | bes,4( a | g8) <g' b> d <g b> |
  c,=8 <a' e'> <fis d'> d | g,[-> <g'= d'>8 8] r |
  \keyCancelChangeBar
  \key d \major
}
{{ end }}
