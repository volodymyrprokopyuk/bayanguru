{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \major
  \time 3/8
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      a'='8[\mp r b] | a4 r8 | a16( b a8) a | d cis b | a[ r a] |
      b='8\< cis \af 8\! d |
      \alternative {
        \volta 1 { cis=''8[\> r \af 8\! b] | a='4 r8 | }
        \volta 2 { fis'=''8\> b, \af 8\! cis | d=''4 r8 \fine \bar "||" }
      }
    }

    \volta 2
    \repeat volta 2 {
      cis=''16( d cis8) a16( b | cis8)-. a-. fis-. |
      <eis=' b' cis>4 <fis b d>8 | <eis b' cis>4. |
      fis='16( gis fis8) a16( b | cis8)-. b-. a-. |
      \alternative {
        \volta 1 {
          gis='16(\< a b cis d \af 16\! e | gis\> fis e d cis \af 16\! b=') |
        }
        \volta 2 { gis='16( a b d cis b | a8)\> gis \af 8\! fis=' \bar "||" }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \major
  <d'=' fis>8-\frBass a a | <d fis> a a | <ees' g> a, a | <e' gis> a, <cis g'> |
  <d=' fis>8 a a | <d fis> b b | <e gis> e, <d' gis> | <cis a'> fis e |
  <e=' gis>8 a, <ees' g> | <d=' fis>4 r8 \clef bass |

  <fis,= cis'>4 8[~ | 8] 4 | gis16( a gis8) fis16( a | gis8) eis-. cis-. |
  <d= a'>4 8[~ | 8] 4 | <e b'>4. | <e d'> | <e b'>4 <e d'>8 | <fis= cis'>4. |
}
{{ end }}
