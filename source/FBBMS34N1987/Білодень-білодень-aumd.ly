{{ define "rh1" }}
  {{ .a }} <d f> <e g>16 e' c g='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  e'='8\mf f g4-- | e8\< f \af 4\! g4-- | a8 g f e | d4\> \af 4\! c |
  r4 r8 <c'='' e>8 | r4 r8 8 | r8 <b f'> <b g'>4 | r8 8 <f' g> <e='' g> |

  {{ template "rh1" (w `<c='' e>8\mf`) }}
  {{ template "rh1" (w `<c,='' e>8`) }}
  <f='' a>8 <e g> <d f>16 d' b a | g f e d c b a g |
  e='16-. d-. c-. g-. c-. d-. e-. g-. |
  f='16-. e-. d-. a-. d-. e-. f-. g-. |
  <f=' a>16( d') d <f, a> <e g>( e') e <e, g> |
  <d=' f>16(^\tRit d') <d, f>( d') <e,=' c'>4-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \rep 4 { R2 | } | e'='8-\frBass f g4-- | e8 f g4-- | a8 g f e | d4-- c='-- |

  r4 \clef bass <g= c e>8 8 | r4 8 8 | r4 <a b d>8 8 |
  <a= b f'>8 8 <a c e> r | g( e g) r | a( f a) r | b d, c' g | a g c='4-- |
}
{{ end }}
