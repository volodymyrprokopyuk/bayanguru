{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 2/4
  \partial 8 { e''=''8\p | }
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      cis=''8[ e cis e] | d16( e d cis b8) fis' | e16( fis e d b8) gis' |
      fis=''16(\< gis fis e cis8) \af 8\! e | a(\mp gis16 fis e8) cis |
      d=''16( e d cis b8) gis'16( fis | e fis e d b8) a16( gis |
      \alternative {
        \volta 1 { a='4) r8 e'='' | }
        \volta 2 { a,='4( a'=''8) r \fine \bar "||" }
      }
    }

    \volta 2
    \time 4/4
    \duo {
      <b= e gis>4\mf 4 fis'8.( gis16 fis4) |
      gis='8( a) b4 a8.( b16 a4) | gis8[( a=']) %
    } {
      s2 <a= d>2 | <b e>4 <cis gis'> <d fis>2 | <b= e>4 %
    }
    <b,,= e gis>4( <bis dis>) <b e gis>(-. |
    <bis= dis>4)-. <b e gis>(\> \af 2\! <bis= dis>2) |
    \duo {
      <cis'=' fis ais>4\f 4 gis'8.( ais16 gis4) |
      ais='8( b) cis4 b8.( cis16 b4) | ais8[( b=']) %
    } {
      s2 <b= e>2 | <cis fis>4 <dis ais'> <e gis>2 | <cis=' fis>4 %
    }
    <cis=' fis ais>4( <cisis eis>4) <cis fis ais>(-. |
    <cisis=' eis>4)-. <cis fis ais>( <cisis eis>2) |
    <a= d fis>2^\tRit <a cis e> | <a cis fis>2. r8 e''=''^\tATem \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \major
  \meter 1/2 #'(1)
  \partial 8 { r8 | }
  a=8-\frBass e' fis e | a, e' gis e | fis e gis e | b' e, a e |
  a,=8 e' fis e | a, e' gis e | b' e, gis e |
  \meter 1/4 1,1
  fis='8( e16 d cis8) b | fis' e16( cis a=8) r \clef bass |

  \rep 2 { e=4 e <b=, e>2 | } | e4 e( <gis, dis'>) e'(-. |
  <gis,=, dis'>4)-. e' <gis, dis'>2 |
  \rep 2 { fis'=4 fis <cis= fis>2 | } | fis4 fis( <ais, eis'>) fis'(-. |
  <ais,=, eis'>4)-. fis'( <ais, eis'>2) | d a4 g | <fis=, cis'>2. r4 |
}
{{ end }}
