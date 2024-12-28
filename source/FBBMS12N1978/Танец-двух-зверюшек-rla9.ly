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
      cis=''8 e cis e | d16( e d cis b8) fis' | e16( fis e d b8) gis' |
      fis=''16(\< gis gis e cis8) \af 8\! e | a(\mp gis16 fis e8) cis |
      d=''16( e d cis b8) b'16( fis | e fis e d b8) a16( gis |
      \alternative {
        \volta 1 { a='4) r8 e'='' | }
        \volta 2 { a,='4( e'=''8) r \fine \bar "||" }
      }
    }
    % \volta 2
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  \partial 8 { r8 | }
}
{{ end }}
