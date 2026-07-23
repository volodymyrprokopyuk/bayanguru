{{ define "rh1" }}
  {{ .a }} c16( b a8 e) | b' b16( a gis8 e=') |
{{ end }}

{{ define "rh2" }}
  {{ .a }} g f' f | e16( f e d c8 e='') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} c) | gis( e) | a( g) | c( b) | a( c) | gis( e) |
  a=8( f e4) | <a= c>4 4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `c''=''8\p`) }} | a='8 a16( b c8 d) | e8.( f16 e8 d) |
  {{ template "rh1" (w `c=''8`) }} | a='16( gis a b c8 gis) | a4 a=' |

  {{ template "rh2" (w `g='8\mf`) }} | d=''8( d16 c b8 d) | c16( b c d e=''4) |
  {{ template "rh2" (w `g,='8`) }} | d=''16( e d c b8 d) |
  c=''16(\> b a c \af 4\! b='4) |

  c=''16(\p d c b a8 e) | b'16( c b a gis8 e) | a16( gis a b c8 d) |
  e=''8.( f16 e d c b) | c( d c b a8 e) | b'16( c b a gis8 e) |
  a='16(^\tRit b c d e8 gis,) | a4 a=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a=4(-\frBass`) }}
  b=4 g | c e | b d | e c16( e d c) |
  b=4 g | c e | b d | e(~ e16 d c b=) |

  {{ template "lh1" (w `a=4(`) }}
}
{{ end }}
