{{ define "rh1" }}
  <e=' g>8) r r <c e>16( <d f> | <e g>8) r r <c e>16( <d f> |
  <e=' g>8) <f a>16( <g b> <a c>8) <g b>16( <f=' a> |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} cM!] r | r c[ cM!] r | c-- r f,-- r | r8 c'=8[ cM!] r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  \partial 8 { <c'=' e>16(\mf <d f> | }
  {{ template "rh1" }}
  <e=' g>8) r r <b d>16( <c e> | <d f>8) r r <c e>16( <d f> | <e g>8) r r %
  \duo { <b= d>16_( <c e> | <d f>8) d16( f e8) c16( e | d='8) } %
  { s8 | s4 fis=4( f=8) } r8 r <c e>16( <d f> |
  {{ template "rh1" }}
  <e=' g>8) r r <e gis>16(\p <fis a> | <gis b>8) r r <fis a>16( <gis b> |
  <a=' c>8) r r <g b>16(\< <a c> | <b d>8) r r <a c>16( <b d> |
  \af 4.\! <c='' e>4.) <f a>16(\mf <g b> |
  <a='' c>8) 8 8 <g b>16( <f a> | <e g>8) 8 8 <b d>16( <c e> |
  <d='' f>8) 8 8 <c e>16( <d f> | <e g>4.) <f aes>16(\p <g bes> |
  <aes='' c>8) 8 <aes, c> <g' bes>16( <f aes> |
  <e='' g>8) 8 <e, g> <e' g>16( <d f> |
  <c='' e>8) <d f>16( <c e> <b d>8) <c e>16(^\tRit <g d'> |
  <e=' c'>4~ 8) r \bar "|."

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 8 { r8 | }
  {{ template "lh1" (w `c=8[-\stBass`) }}
  r8 g=,8[ g7!] r | r c[ cM!] r | g r d4( | g8) r g+g7!4-> |
  {{ template "lh1" (w `c=8[`) }}
  \duo { r8 e7![ e7] r | r am![ am] r | r g7![ g7] r | r cM![ cM] r | }
  { e=4~ 8 s | a,4~ 8 s | g4~ 8 s | c=4~ 8 s | }
  f,=,8[( fM!) fM] r | c'[( cM!) cM] r | g[( gM!) gM] r |
  \duo { r8 cM![ cM] r | } { c=4~ c=8 s | } | f[( fm!) fm] r |
  c'=8[( cM!) cM] r | c-- r g-- r | c4~ c=8 r |
}
{{ end }}
