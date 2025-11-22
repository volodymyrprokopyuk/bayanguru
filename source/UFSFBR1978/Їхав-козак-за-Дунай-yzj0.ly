{{ define "rh1" }}
  <d=' fis>8[ a'] <d, fis d'>8.-> fis16 | <bes, d g>4. <c=' ees f>8-> |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d cis d ees d cis d g d cis d ees d cis d='' |
{{ end }}

{{ define "rh3" }}
  g=''32 d cis d bes'8)-. <ees, a>-. g=''-. |
{{ end }}

{{ define "rh4" }}
  <d='' fis>8 a' <d, fis d'>8.-> fis16 | <bes, d g>4. <c='' ees f>8-> |
{{ end }}

{{ define "lh1" }}
  g,=,8 gm! g gm | bes g@m! c8 cm! | d[ dM! dM] d | g,[ gm! gm] a=, |
{{ end }}

{{ define "lh2" }}
  {{ .a }} gm! bes g@m! | g8 gm!-. c-. cis-. | d[ dM! dM] d | g,[ gm! gm] a=, |
{{ end }}

{{ define "lh3" }}
  \duo { r8 gm![ gm] } { g,=,4~ g=,8 } r8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  <d'=' g>8\mf 8 8 8 | 8 bes' a g | <d fis>8 8 8 8 | 8 a' g fis |
  <d=' g>8 8 8 8 | 8[ bes'] <ees, a> g | {{ template "rh1" }}
  <d=' f bes>8 8 8 8 | 8[ d'] <f, c'> bes |
  <c,=' f a>8 8 8 8 | 8[ c'] <fis, bes> a |
  <bes,= d g>8 8 8 8 | 8[ bes'] <ees, a> g=' | {{ template "rh1" }}

  \meter 1/4 1,1
  <d=' f bes>16\f \rep 7 { 16 } | 8[ d'] <f, c'>8(-> bes) |
  \rep 8 { <c,=' f a>16 } | 8[ c'] <fis, bes>8(-> a) |
  \rep 8 { <bes,= d g>16 } | 8[ bes'] <ees, a>(-> g) |
  \rep 2 { <fis=' a>16 16 <d=' d'>8 } | g <bes,= d g>8 8 r |

  \set subdivideBeams = ##t
  \set beamMinimumSubdivision = #1/8
  {{ template "rh2" (w `g''=''32(\mf`) }}
  g=''32 d cis d bes'8)-. a-. g-. |
  fis=''32( d cis d ees d cis d fis d cis d ees d cis d |
  fis=''32 d cis d a'8)-. g-. fis-. |
  {{ template "rh2" (w `g=''32(`) }} {{ template "rh3" }} {{ template "rh4" }}
  bes'=''32( f e f g f e f bes f e f g f e f |
  bes=''32 f e f d'8)-. <f, c'>-. bes-. |
  a=''32( f e f g f e f a f e f g f e f |
  a=''32 f e f c'8)-. <fis, bes>-. a-. |
  {{ template "rh2" (w `g=''32(`) }} {{ template "rh3" }} {{ template "rh4" }}

  \set beamMinimumSubdivision = #1/4
  <d='' bes' d>16\f \rep 7 { 16 } | 8 <f d' f> <ees c' ees>(-> <d bes' d>) |
  \rep 8 { <c='' a' c>16 } | 8 <ees c' ees> <d bes' d>(-> <c a' c>) |
  <g'='' g'>16 \rep 7 { <g,=' g'>16 } | 8 <d' bes' d> <c a' c>(-> <bes g' bes>) |
  <fis'='' a>16 16 d8 <d fis d'>8.-> fis16 | <bes,=' d g>4~ 8 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,8-\stBass gm! g gm | g gm! bes g@m! | a8 d@7! d8 d7! |
  d=8 d7! d d7 | {{ template "lh1" }} | bes besM! bes besM |
  bes=,8 besM! d bes@M! | f,8 fM! f fM | f fM! d' dM! | {{ template "lh1" }}

  bes=,16 besM! \rep 3 { bes=,16 besM } | bes8 besM! bes besM |
  f=,16 fM! \rep 3 { f=,16 fM } | f8 fM! d' dM! |
  g,=,16 gm! \rep 3 { g=,16 gm } | g8 gm! c( cis) |
  d=8 dM! d dm | {{ template "lh3" }}

  g,=,8 gm! bes g@m! | g8[ gm!-. gm-. gm]-. |
  a=,8 d@7! d8 d7! | a[ d@7!-. d78-. d7]-. | {{ template "lh2" (w `g=,8`) }}
  bes=,8 besM! d bes@M! | bes8[ besM!-. besM-. besM]-. |
  f=,8 fM! a f@M! | f8[ fM!-. d@M!]-. d'8 | {{ template "lh2" (w `g,=,8`) }}

  bes=,16 besM! \rep 3 { bes=,16 besM } | bes8 besM! bes besM |
  f=,16 fM! \rep 3 { f=,16 fM } | f8 fM! d' dM! |
  g,=,16 gm! \rep 3 { g=,16 gm } | g8 gm! g gm |
  d'=8 dM! d4-> | {{ template "lh3" }}
}
{{ end }}
