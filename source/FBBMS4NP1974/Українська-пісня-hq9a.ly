{{ define "rh1" }}
  {{ .a }} b-> | c8( a) b4-> | e16( fis e8) b-. b-. | c( a) b='4-> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} fis g e]) | r <e fis> r <e g> | r8 e[( g e]) | r <e fis>4( dis='8) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key e \minor
  \time 2/4
  {{ template "rh1" (w `e''=''4->\f`) }}
  r8 e=''8-. r b-. | g( b) a16( b a8) | g-. g-. fis16( g fis8) | r g[( a c]) |
  r8 e=''8-. fis16( e fis8) | g( b) a16( b a8) |
  g=''8-. g-. fis16( g fis8) | e4 <e='' e'> |

  e=''4( g) | <b, d>8-. d16( c d8 b) | c4( e) | <g, b>8-. b16( a <g b>4) |
  a='8( c) c( g) | a-. c16( b c4) | r8 a[ a( c]) | b^\tRit b16( a b4) |
  {{ template "rh1" (w `e=''4->^\tATem`) }}
  r8 e=''8-. fis16( e fis8) | g( b) a16( b a8) |
  g=''8-. g-. fis16( g fis8) | e4 <e='' e'>\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  {{ template "lh1" (w `e'='8[(-\frBass`) }}
  e='8(-> g) fis(-> dis) | r e r <c e> | r <b c>[( cis dis]) | e4( fis) |
  g='8( e) dis( fis) | e( g) a( c) | r <b c>[( cis dis]) | r <a c> <e=' b'>4-> |

  c='8[( d e fis]) | g4 g | a,8[( b c d]) | e4 e |
  \rep 2 { f='4( <c=' e>) | } | <a e'>2( <b dis>) |
  {{ template "lh1" (w `e='8[(`) }}
  e='8( g) dis( fis) | e( g) c,( e) | r <b c>8[( cis dis]) | r <a' c> <e=' b'>4 |

}
{{ end }}
