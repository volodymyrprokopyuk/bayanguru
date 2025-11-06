{{ define "rh1" }}
  <f= a>16( <g bes> <a c>8) 8 8 | <g bes>16( <a c> <bes d>8) <g d'>8 8 |
  \duo { c'='8 e g e=' | } { bes=4 <g= d'> | } |
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
  <e=' g c>8 8 4 | e16( f <e g>8) <e g>16( fis <e g>8) |
  f='16( g <f a>8) <d a'>16( gis <d a'>8) |
  <b= d g>8 <d g b> <d a' d> <f a b> | <e=' g c>8 8 8 r \bar "||"

  \key f \major
  <a,= c f>8\f <f a c> <c' f a>4 | <a c f>8 <f a c> <c' f a>4 |
  <a= c f>8 <f a c> %
  \duo { <f'=' a>4 | g16( f e d) c='4 | } { e'='8( d) | bes4 a= | }

  {{ template "rh1" }} | <a= c f>8 8 4 |
  {{ template "rh1" }} | <a= c f>16 c <bes e a> g' <a,= c f>8 r %
  \keyCancelBarChange \bar "||"

  \key c \major
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
}
{{ end }}
