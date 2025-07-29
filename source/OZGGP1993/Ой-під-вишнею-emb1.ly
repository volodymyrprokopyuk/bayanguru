{{ define "rh1" }}
  \duo { a'='8 fis d='4 | } { c'='4 c=' | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key g \major
  \time 2/4
  d'='8-.\f d-. d e16( fis) | g8-. g-. b-. b-. |
  <cis,=' g' a>8( b') <g a>( b) | <fis a>4-> <fis d'>-> |
  <b,= g'>8 8 <d b'>8 8 | {{ template "rh1" }} |
  <b= g'>8 8 <g' b>( <b d>) | {{ template "rh1" }} |

  \repeat volta 2 {
    <b,= g'>8 8 g' a16( b) | <g c>8 c <g e'>8 8 |
    <g=' b d>8 8 c, e16( fis) | <b,= d g>8 8  4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  d=8-.-\frBass d-. d e16( fis) | g8-. g-. b-. b-. |
  <a,=, g'>4 4 <d c'>2 | \rep 2 { g,=,8 d' d, d' | a d d, d'= | }
  g,=,8 d' f, d' | e, e' c, c' | d, d' d, d' | g, d' g=4 |
}
{{ end }}
