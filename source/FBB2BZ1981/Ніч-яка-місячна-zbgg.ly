{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 3/4
  <d'=' d'>4\(\p c' bes | <d, bes'> <c a'> <bes g'> |
  <c=' a'>4 a' a | <c, a'> fis d\) |
  \duo {
    d'='4\( fis a | c bes a | g2.~ | g\) |
    \repeat volta 2 {
      bes='4\(\mf bes bes | 4 a g | c c c | c d ees\) |
      d=''4\( d d | d a bes | g2.~ | g='\) |
    }
  } {
    d'='2. | ees4 d c | bes2. | f'4( ees d) | d2.~ | d | g~ | g |
    g='2. | fis | r4 d( ees | d='2.) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \duo {
    d'='2.~-\frBass | d | d2 4 | 4( a fis) |
    fis=4( a c | r d2) | r4 <bes ees>4 <bes= d>4 | 2. |
  } { g=2.~ | g | fis~ | fis4 r r | fis2. | fis | g~ | g= | }
  g=2.\( | g4 a bes | <ees, c'>2. | ees4 d c\) |
  <d= bes'>2. | <d c'> | \duo { r4 bes=4( c=' | bes=2.) | } { g=2.~ | g= | }
}
{{ end }}
