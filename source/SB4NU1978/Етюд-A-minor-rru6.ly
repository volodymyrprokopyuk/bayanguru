{{ define "rh1" }}
  {{ .a }} gis a b c d | e a, b c d e | f e f g a f | e=''2\) r4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} r e,-. r c'-. r | b2-> r4 | a8-. r c,-. r a'-. r | g2-> r4 |
  d=''8(\< cis d e f \af 8\! g | a\> g f e d \af 8\! {{ .b }} |
{{ end }}

{{ define "rh3" }}
  {{ .a }} fis gis a] b)-. r | a[( b c d] e)-. r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! am | a am am | a d@m! dm4 | a=, am! am |
{{ end }}

{{ define "lh2" }}
  {{ .a }} b c d e f | g)-. r g,-. r g'-. r |
  f,=,8( e f g a b | c)-. r c-. r c-. r |
  f,=,4 d@m! dm4 | f=, d@m dm4 |
{{ end }}

{{ define "lh3" }}
  gis=,4 e@M! eM4 | a am! am | f=, fM! fM | e+eM! r r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key a \minor
  \time 3/4
  {{ template "rh1" (w `a'='8\(\p`) }}
  f=''8[(\> e d c] \af 8\! b)-. r | e[(\> d c b] \af 8\! a)-. r |
  a='8( gis a b c a | b4 e)-. e-. | {{ template "rh1" (w `a,='8\(`) }}
  e=''8(\< dis e fis g \af 8\! a | b4\> a8 g fis \af 8\! e) |
  dis=''8(\> c b a g \af 8\! fis | e='2) r4 |

  {{ template "rh2" (w `c''='''8-.\f` `cis=''`) }} |
  d=''8 cis d e d c | b4 g'8)-. r g-. r |
  {{ template "rh2" (w `c='''8-.\f` `c=''`) }} |
  b='8)-. r g'-. r b,-. r | c=''2 r4 |

  {{ template "rh3" (w `e,='8[(\p`) }}
  {{ template "rh3" (w `e=''8[(_\dCre`) }}
  a='''8(\f g f e d c | b a g f_\dDim e d |
  c=''8 b a c b a | e')-. r e( d c b |
  a='8)\p gis( a b c d | e a, b c d e | f e f g a f | e2) r4 |
  f=''8[(\> e d c] \af 8\! b)-. r | e[(\> d c b] \af 8\! a)-. r |
  a='8( gis a b c a | b4) e-. e-. | {{ template "rh1" (w `a,='8\(`) }}
  e'='''8(\f d c b a g | f e d c b a | gis)-. r e-. r e'-. r |
  a,='2 r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,4-\stBass`) }} {{ template "lh3" }}
  {{ template "lh1" (w `a=,4`) }}
  b=,4 e@m! em4 | b e@m em4 | b=, r b7! | e+em!2 r4 |

  {{ template "lh2" (w `c=8(`) }} | fis4 d@7! d74 | g+gM! r r |
  {{ template "lh2" (w `c'=8(`) }} | g=,8 r r4 g7!8 r | c+cM!2 r4 |

  \rep 2 { e'=8 r e7! r e7 r | e= r a@m! r8 am r | }
  c=4 a@m! am4 | d dm! dm | dis b@7! b74 | e+eM!8 r r4 r |
  {{ template "lh1" (w `a=,4`) }} {{ template "lh3" }}
  {{ template "lh1" (w `a=,4`) }}
  c=4 a@m! am4 | d dm! dm | e=8 r r4 e7!8 r | a+am!2 r4 |
}
{{ end }}
