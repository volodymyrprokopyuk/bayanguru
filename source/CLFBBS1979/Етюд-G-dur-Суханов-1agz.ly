{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      g''=''16\mf d cis_\aLeg d e d cis d | g d cis d e d cis d |
      \rep 2 { a'=''16 c, b c d c b c='' | }
      \rep 2 { g'=''16 d cis d e d cis d='' | }
      \alternative {
        \volta 1 { c=''16 d e d c d c b | c d e d c d e fis='' | }
        \volta 2 {
          c=''16 d e d c d c b | c d e fis %
          \duo { g''=''4 \fine \bar "||" } { r8 b'='8 | }
        }
      }
    }

    \volta 2
    \rep 3 { r16 b,='16( d cis c b ais b=') | }
    b='16( a gis b a8) r | r16 a( c b a g fis a) |
    r16 g='16( b a g fis e g) | r16 fis( a g fis e dis e |
    fis='16 g a b c d e fis='') \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  g'='16-\frBass b ais b c b ais b | g b ais b c b ais b |
  \rep 2 { fis='16 a gis a b a gis a=' | }
  \rep 2 { g='16 b ais b c b ais b=' | }
  a='16 b c b a b a gis | a b c b a b c d |
  a='16 b c b a b a gis | a b c d='' \duo { r8 d''=''8 | } { g'='4 | }

  <e,=' g>4. r8 | <dis fis>4. r8 | <d f>4. r8 | <cis e>4. r8 |
  <c=' ees>4. r8 | <b d>4. r8 | <ais= cis>4. r8 |
  \duo { c'='8 e=' } { a=8 c=' } r8 <d=' c'>8 |
}
{{ end }}
