{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } {{ .c }} %
{{ end }}

{{ define "t3" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } \tuplet 3/2 { {{ .c }} } %
{{ end }}

{{ define "rh1" }}
  {{ template "t2" (w .a `a b a` `g8)-.`) }}
  {{ template "t2" (w `d'=''16( e d` `c d c` `b8)-.`) }} |
  {{ template "t3" (w `b'=''16(\> c b` `a b a` `g a g`) }}
  {{ template "t3" (w `fis=''16 g fis` `e fis e` `d e \af 32.\! d`) }} |
  {{ template "t2" (w `c=''16 d c` `b c b` `a8)-.`) }}
  {{ template "t2" (w `fis'=''16( g fis` `e fis e` `d8)-.`) }} |
  {{ template "t3" (w `c'='''16( d c` `b c b` `a b a`) }}
  {{ template "t3" (w `g=''16 a g` `fis g fis` `e fis e`) }} |
  {{ template "t2" (w `d=''16 e d` `c d c` `b8)-.`) }}
  {{ template "t3" (w `f'=''16(_\dCre g f` `e f e` `d e d`) }} |
  {{ template "t2" (w `c=''16 d c` `b c b` `a8)-.`) }}
  {{ template "t3" (w `e'=''16( fis e` `d e d` `c d c`) }} |
  {{ template "t2" (w `b='16 c b` `a b a` `g8)-.`) }}
  {{ template "t2" (w `g'=''16( a g` `fis g fis` `e=''8)-.`) }} |
  {{ template "t3" (w .b `fis g fis` `e='' fis e`) }}
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! gM d'[ g@M gM8] | g, gM! gM d'[ g@M gM8] |
  \rep 2 { fis,=,8[ d@7! d78] d'= d7 d7 | }
  b=,8[( g@M!) gM8] gis[( e@7!) e78] |
  a=,8( am!) am c[( a@m) am8] | d[( g@M!) gM8] e( em!) em | a,=,8( a7!) a7 %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 6/8
  \set subdivideBeams = ##t
  {{ template "rh1" (w `b'='16(\p c b` `g=''16(\f a g`) }}
  d=''8 <a cis>^\tRit <a c>) |
  {{ template "rh1" (w `b='16(\p^\tATem c b` `g=''16(\f\> a g`) }}
  \af 8\! d=''8)-. r r |

  {{ template "t2" (w `d=''16(\p\< a d` `fis d fis` `a8)-.`) }}
  {{ template "t2" (w `g=''16( d g` `b g b` ` \af 8\! d8)-.`) }} |
  {{ template "t3" (w `e='''16(\> fis e` `d e d` `c d c`) }}
  {{ template "t2" (w `b=''16 c b` `a b a` ` \af 8\! g8)-.`) }} |
  {{ template "t2" (w `b,='16( fis b` `dis b dis` `fis8)-.`) }}
  {{ template "t2" (w `e=''16( b e` `g e g` `b8)-.`) }} |
  {{ template "t3" (w `c='''16( d c` `b c b` `a b a`) }}
  {{ template "t2" (w `g=''16 a g` `fis g fis` `e8)-.`) }} |
  {{ template "t2" (w `g,='16( d g` `b g b` `d8)-.`) }}
  {{ template "t2" (w `c=''16( g c` `e c e` `g8)-.`) }} |
  {{ template "t2" (w `e,='16( b e` `gis e gis` `b8)-.`) }}
  {{ template "t2" (w `a='16( e a` `c a c` `e8)-.`) }} |
  {{ template "t3" (w `g=''16( a g` `fis g fis` `e fis e`) }}
  {{ template "t2" (w `d=''16 e d` `c d c` `b8)-.`) }} |
  {{ template "t3" (w `c'='''16(\< d c` `b c b` `a b a`) }}
  {{ template "t2" (w `g=''16 a g` `fis g fis` ` \af 8\! e8)-.`) }} |
  {{ template "t3" (w `g=''16( a g` `fis g fis` `e fis e`) }}
  {{ template "t2" (w `d=''16 e d` `c d c` `b8)-.`) }} |
  {{ template "t3" (w `c=''16(\> d c` `b c b` `a b a`) }} \af 4\! g='4.) |

  {{ template "t2" (w `b,=16(\p c b` `a b a` `g8)-.`) }}
  {{ template "t2" (w `d'='16( e d` `c d c` `b8)-.`) }} |
  {{ template "t3" (w `g'='16(\< d g` `b g b` `d b d`) }}
  {{ template "t3" (w `g=''16 d g` `b g b` `d b \af 32.\! d`) }} |
  g='''8) r r <d,,=' g b> r r | <d,= b' g'='>2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }} d+dM!( e' fis) |
  {{ template "lh1" (w `g,=,8`) }} d+dM! d( cis= |

  c=8) d@M! r8 b g@M! r8 | fis[( d@M!) dM8] g( gM!) gM |
  a=,8 b@M! r8 g e@m! r8 | dis'[( b@7!) b78] e( em!) em |
  f,=,8 g@M! r8 e' c@M! r8 | d e@M! r8 c a@m! r8 |
  cis=8[( a@7!) a78] d[( g@M!) gM8] | dis[( b@7!) b78] e( em!) em |
  a,=,8( a7!) a7 d[( g@M!) gM8] | d d7! d7 g+gM! d g,=, |

  r4. b=,8 a g | e' d b g d' b | g r r g@M! r8 r g=,2. |
}
{{ end }}
