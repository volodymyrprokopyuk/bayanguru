{{ define "rh1" }}
  {{ .a }} <e c'> \duo { c''=''8. b16 | } { c''=''8 e,=' | }
  b'='8 <f a> b8.( a='16) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} g' g, g' | c, g' e <gis= d'> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  e'='8\mf e e g | g f16( e) f8 d | d-. f-. a-. d-. | <d,=' f g>4 r \fermata |
  \tempo Vivo
  <c=' e>8\mf 8 8 <e g> | g f16( e) f8 d | d <d f>8 8 <f a> |
  <f=' a>8 <e g>16( fis) <e g>8 e |
  {{ template "rh1" (w `g='8`) }} | g='8 g g f | f e16( dis) e8( c) |
  {{ template "rh1" (w `g'='8`) }} | g='8 <c e> <b f'> b |
  d=''8 c16( b) c8 c | d,='\p <b f'>8 8. 16 | e8 <e c'>8 8. 16 |
  g='8_\dCre <f d'>8 8 8 | <g e'>8. d'16 c16( b) a( g=') |

  \repeat volta 2 {
    a='8\mf a <a f'> a | g <g e'> e' g, | f <f d'>8 8 b |
    \alternative {
      \volta 1 { <e,=' d'>8 c'16( b) <e,=' c'>8 8 | }
      \volta 2 { <e=' d'>4 c'8 b | <e, c'>4 <e=' g>4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c'='8-\frBass b bes4 | <a c>2 | c8-. a-. f-. d-. | g-. d-. g,=,4 \fermata |
  c=8 g' g, g' | \rep 2 { d=8 <f g> g, <f'= g> | }
  {{ template "lh1" (w `c=8`) }} | f=8 c' fis, <c' e> | g <c e> g d' |
  {{ template "lh1" (w `c,=8`) }} | f=8 c' fis, <c' ees> | g <c e> g <d' f> |
  c='8 <c e>4 8 | d, g g, g' | c, g' g, g' | d g g, g' | c, g' e'16( d) c( b=) |

  f=8 c' d, c' | e, c' c, c' | d, g g, g' | c, g' c4 |
  c,=4 g' | c,8 g' c='4 \bar "|."
}
{{ end }}
