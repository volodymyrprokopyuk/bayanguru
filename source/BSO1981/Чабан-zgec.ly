{{ define "rh1" }}
  {{ .a }} \fermata \acc { gis=''8 } {{ .b }} e f d='']) %
{{ end }}

{{ define "rh2" }}
  \tuplet 6/4 { {{ .a }} f gis a gis f='') } %
{{ end }}

{{ define "rh3" }}
  {{ .a }} e) e-. e-. e2 \fermata |
  e='''16( dis) dis( c) \tuplet 6/4 { c='''16( b) b( a) a( gis) } {{ .b }} |
{{ end }}

{{ define "rh4" }}
  {{ .a }} gis16 gis( f) f( e) | gis4. \trill f16( e) |
  a=''8. gis16 gis( f) f( e='') |
{{ end }}

{{ define "rh5" }}
  e=''8 \rep 3 { \acc { dis'='''8 } e='''8 } |
{{ end }}

{{ define "lh1" }}
  d=8 dm! f, d@m | e'=8[ eM! eM eM] |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Rubato
  \clef treble
  \key c \major
  \time 4/4
  \omit TupletBracket
  \acc { <e'=' e'>8 } <e gis b e>1(\f |
  {{ template "rh1" (w `e'=''4)` `f=''8[(`) }}
  {{ template "rh1" (w `e=''4` `f=''8[(\p`) }} e2 \fermata |
  {{ template "rh2" (w `e=''16(\f`) }} e4 %
  {{ template "rh2" (w `e=''16(\p`) }} e4 \fermata |
  \tuplet 10/8 { e=''32(\f f gis a b c b a gis f) } %
  \acc { gis=''16 f } e4 \fermata e8( f gis a) |
  b=''2. \trill \tuplet 3/2 { c='''8( b a) } |
  \set subdivideBeams = ##t
  b=''4 \trill c16( b) \tuplet 3/2 { c='''16( b a) } b2 \trill |
  \set subdivideBeams = ##f
  {{ template "rh3" (w `b=''8(` `gis=''2`) }}
  {{ template "rh3" (w `b=''8(\p` `gis=''2 \fermata`) }}
  \rep 2 { \tuplet 6/4 { gis=''16( a b c b a='') } } %
  \tuplet 8/8 { gis=''32(_\dCre a b c b a gis a) } b4 \trill |
  \rep 2 { \tuplet 5/4 { a=''16( gis f e f) } gis=''4 \trill } |
  \set subdivideBeams = ##t
  \rep 3 { gis=''16( f) f( e='') } e4 \fermata |
  \rep 3 { \acc { gis=''8 } f=''16( e) f( d) e=''4 \trill } %
  \acc { gis=''8 } f=''16(\<^\tRit e) f( d) \af 4\! e=''4 \fermata \bar "||"

  \set subdivideBeams = ##f
  \tempo "Allegro moderato"
  \time 2/4
  \repeat volta 2 {
    e=''8\f b'16 b b b b b | b( c) c( b) b( a) a( gis) |
    a=''8. gis16 a( c b a) | a( b) gis4 \trill f16 e='' |
  }

  \repeat volta 2 {
    {{ template "rh4" (w `a=''8.`) }}
    \alternative {
      \volta 1 { {{ template "rh5" }} }
      \volta 2 { e,=''8 r <e='' e'>4 | }
    }
  }

  \repeat volta 2 {
    \rep 2 { c'='''4. \trill d16( e) | } \rep 2 { c='''8 \trill d16( e=''') } |
    \rep 2 { c='''4. \trill e8 | e16( dis) dis( c) c( b) b( a='') | }
    a=''2 | {{ template "rh4" (w `a=''8.`) }} | {{ template "rh5" }}
    {{ template "rh4" (w `a,=''8.`) }} | e8 r <e='' gis b e>4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \acc { e=8 } e=1-\stBass | \rep 14 { e=1~ | } | e= \fermata |

  e=8[ eM! eM eM] | e eM! gis, e@M | a8 am! c a@m | e=8[ eM! eM eM] |

  \rep 2 { {{ template "lh1" }} } | e= r eM!4 |

  c=8[ cM! cM cM] | e[ eM! eM eM] | c cM! c cM |
  \rep 2 { c=8[ cM! cM cM] | a=,8 am! c a@m | } a8 am! c a@m |
  \rep 3 { {{ template "lh1" }} } | d=8 dm! f, d@m | e'=8 eM!4. |
}
{{ end }}
