{{ define "rh1" }}
  e='16( f <e g>8) <e g>16( fis <e g>8) |
  f='16( g <f a>8) {{ .a }}16( gis {{ .a }}8) |
  {{ .b }} <d g b> <d a' d> <f=' a b> |
{{ end }}

{{ define "rh2" }}
  <f= a>16( <g bes> <a c>8) 8 8 | <g bes>16( <a c> <bes d>8) <g d'>8 8 |
  \duo { c'='8 e g e=' | } { bes=4 <g= d'> | } |
{{ end }}

{{ define "rh3" }}
  {{ .a }} e, g c) e( c g e=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} c4 cis8 | d c b4 | g8 f fis g=, |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  <e'=' c'>8\mf <e g> <c' e>4 | \rep 2 { <e,=' c'>8 <e g> <c'='' e>4 | }
  \duo { d''=''16 c b a=' } { fis'='4 } <b,= d g>4 |
  e='8 <e g>8 8 8 | f <f a>8 8 8 | <d g> <d g b> <f a d> <f a b> |
  <e=' g c>8 8 4 |
  {{ template "rh1" (w ` <d=' a'>` `<b= d g>8`) }} <e=' g c>8 8 8 r \bar "||"

  \key f \major
  <a,= c f>8\f <f a c> <c' f a>4 | <a c f>8 <f a c> <c' f a>4 |
  <a= c f>8 <f a c> %
  \duo { <f'=' a>4 | g16( f e d) c='4 | } { e'='8( d) | bes4 a= | }

  {{ template "rh2" }} | <a= c f>8 8 4 |
  {{ template "rh2" }} | <a= c f>16 c <bes e a> g' <a,= c f>8 r %
  \keyCancelBarChange \bar "||"

  \key c \major
  {{ template "rh3" (w `c'=''16(\mf`) }}
  c'=''16( e, g c) \acc { dis=''8 } e16( c g e) |
  {{ template "rh3" (w `c'=''16(`) }} | d'=''16( c b a g f e d) |
  {{ template "rh1" (w ` <f=' a>` `<b,= d g>8`) }} | <e=' g c>8 8 4 |
  {{ template "rh1" (w ` <f=' a>` `<b,= d g>8`) }}
  <e=' g c>8^\tRit <f a c> <e=' g c> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  c'='8-\frBass <c e>4 8 | c8 <c e>4 8 | c d e fis |
  a,=8 d g16 f e d | c8 <c e>4 8 | d8 <d f>4 8 |
  b=8 a g g | c g a b | c <c=' e>4 8 \clef bass |
  a=8 g f fis | g f fis g | c g c=' r |

  \key f \major
  \rep 4 { f,=8 c f c= | } | f,4 fis | g bes | c bes |
  a=,8 g f g | f4 fis | g bes | c bes | a8 g f=, r |

  \key c \major
  <c''=' e>8 r8 r8 8 | <a c e>8 r8 r8 8 | <fis a c e>8 r8 r8 8 |
  <a= c d fis>8 r8 r8 <g b d f> |
  {{ template "lh1" (w `c,=8`) }} | c=8 g a b |
  {{ template "lh1" (w `c=8`) }} | c=8 g c= r |
}
{{ end }}
