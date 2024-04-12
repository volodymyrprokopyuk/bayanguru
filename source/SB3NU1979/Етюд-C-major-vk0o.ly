{{ define "rh1" }}
  {{ .a }} g c e c g e g e' c g e g c e='') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 4/4
  r16\mf c'='16( e g c g e c e c' g e c e g c) |
  r16 d,='16( g b d b g d) r16 e( g c e c g e) |
  r16 f='16(_\dCre a c f c a f a f' c a f a c f) |
  r16 g,='16( c e g e c g c g' e c g c e g) |
  {{ template "rh1" (w `r16\f e,='16(`) }}
  r16 d,='16( g b d b g d) r16 f( b d f d b f) |
  {{ template "rh1" (w `r16 e='16(`) }}
  r16 d,='16(\> g b d b g d g d' b g d g b \af 16\! d='') |

  {{ template "rh1" (w `r16\p e,='16(`) }}
  r16 d,='16( f b d b f d) r16 c( e a c a e c) |
  r16 b=16(\< e gis b gis e b e b' gis e b e gis \af 16\! b) |
  r16\mf a,=16( c e a e c a) r16 e'( g a e' a, g e) |
  r16 f='16( a d f d a f a f' d a f a d f) |
  r16 e,='16(\< g c e c g e) r16 d( g b d b g \af 16\! d=') |

  r16\f g='16( c e g e c g c g' e c bes c e g) |
  r16 a,='16( c f a f c a) r16 f( a c f c a f) |
  {{ template "rh1" (w `r16 e='16(`) }}
  r16 d,='16( f c' d c f,_\dDim d f d' b f d f b d) |
  r16 c,='16( e g c g e c) r16 c( ees aes c aes ees c) |
  r16 e='16( g c e c g e) r16 c( ees aes c aes ees c) |
  <e=' g c e>4\p r <g b d g>\< \af 4\! r |
  <c='' e g c>1\mf \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM!8 r cM r cM r | g4 gM!8 r c4 cM!8 r |
  a=,4 f@M!8 r8 f4 fM8 r | e4 c@M!8 r8 cM r cM r |
  c'=4 cM!8 r cM r cM r | b4 g@M!8 r8 g4 g7!8 r |
  c=4 cM!8 r e4 c@M8 r8 | g,=,4 gM!8 r gM r gM r |

  c=4 cM!8 r cM r cM r | gis4 e@M!8 r8 a4 am!8 r |
  e'=4 eM!8 r eM r d4 | c a@m!8 r8 cis4 a@7!8 r8 |
  d=4 dm!8 r f,4 d@m8 r8 | g4 c@M!8 r8 f=,4 g@M!8 r8 |

  e=,4 c@M!8 r8 cM r cM r | f4 fM!8 r d'4 f@M8 r8 |
  g,=,4 c@M!8 r8 cM r cM r | g4 g7!8 r g7 r g7 r |
  c=2-\puBass aes | c aes | c4 r g r | c=1 \fermata |
}
{{ end }}
