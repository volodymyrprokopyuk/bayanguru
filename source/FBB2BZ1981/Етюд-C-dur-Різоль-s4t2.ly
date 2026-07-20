{{ define "rh1" }}
  \rep 2 { <e=' g>8) r r <c e>16( <d f> | }
  <e=' g>8) <f a>16( <g b> <a c>8) <g b>16( <f=' a> |
{{ end }}

{{ define "lh1" }}
  r16 {{ .a }} b-. a-. g8-- r | r16 c16-. b-. a-. g8-- r |
  c=8-- r f,=,-- r |
{{ end }}

{{ define "lh2" }}
  r16 {{ .a }} e-. c-. g'=8-- r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 2/4
  \partial 8 { <c'=' e>16(\mf <d f> | }
  {{ template "rh1" }}
  <e=' g>8) r r <b d>16( <c e> | <d f>8) r r <c e>16( <d f> |
  <e=' g>8) r r <b d>16( <c e> | <d f>8) d16( f e8) c16( e |
  d='8) r \acc { fis='8 } <b, g'>8-> \noBeam <c e>16( <d f> |
  {{ template "rh1" }}

  <e=' g>8) r r <e gis>16(\p <fis a> | <gis b>4) r8 <fis a>16( <gis b> |
  <a=' c>4)_\dCre r8 <g b>16( <a c> | <b d>4) r8 <a c>16( <b d> |
  <c='' e>4) r8 <f a>16(\f <g b> | <a c>8[) 8 8] <g b>16( <f a> |
  <e='' g>8[) 8 8] <b d>16( <c e> | <d f>8[) 8 8] <c e>16( <d f> |
  <e='' g>4.) <f aes>16(\p <g bes> |
  <aes='' c>8[) 8 <aes, c>] <g' bes>16( <f aes> |
  <e='' g>8[) 8 <e, g>] <e' g>16(-> <d f> |
  <c='' e>8) <d f>16(-> <c e> <b d>8)^\tRit <c e>16( <g d'> |
  <e=' c'>4~ 8) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 8 { r8 | }
  {{ template "lh1" (w `c=16-.-\frBass`) }}
  r16 c'16-. b-. a-. g8-- r |
  r16 g'=16-. f-. e-. d8-- r |
  {{ template "lh2" (w `c=16-.`) }}
  g,=,8 r <d' fis>4( | <f g>8) a,-. g=,-. r |
  {{ template "lh1" (w `c=16-.`) }}
  {{ template "lh2" (w `c'=16-.`) }}

  r16 e=16-. gis-. e-. d8-- r | r16 d16-. c-. b-. a8-- r |
  r16 g=,16-. b-. d-. g8-- r |
  {{ template "lh2" (w `c,=16-.`) }}
  f,=,16( g) a b c[ d] dis r | c( d) e f g a r8 |
  g,=,16( a) b c d e r8 | r16 c-. b-. a-. g8-- r |
  r16 f=,16-. g-. aes-. bes-. c-. r8 |
  r16 c=16-. d-. e-. f[-. g]-. gis8( |
  a=8) d,16( e f) g-. a-. b-. | c8-- g-- c,=-- %
}
{{ end }}
