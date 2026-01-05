{{ define "rh1" }}
  {{ .a }} c e f fis g fis g gis a bes c) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a, a' a, bes' a, c' a, a' a, ees'' a,,=') |
{{ end }}

{{ define "lh1" }}
  c=8 cM! r e c@M r8 | f= fM! r %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 6/8
  a''=''16(\mf a, g' a, f' a, e' a, d a f' a,) |
  bes'=''16( bes, a' bes, g' bes, f' bes, e bes g' bes,) |
  g'=''16( g, e' g, d' g, c g d' g, bes g) |
  bes='16( a c a e' a, f' a, g' a, a' a,) |
  {{ template "rh2" (w `a'=''16(`) }}
  ees''='''16( d, d' d, bes' d, ees d g d bes' d,) |
  a'=''16( d, d' d, f d g cis, a' a, cis g) |
  <f=' a d>8 r %
  \clef bass <e,= g cis>8[ <f a d>] r %
  \clef treble f'='8 |

  {{ template "rh1" (w `e='16(`) }}
  bes='16( a gis a bes b c cis d ees e f) |
  {{ template "rh1" (w `e=''16(`) }}
  bes=''16( a gis a c a e a, f' a, g' gis) |
  {{ template "rh2" (w `a=''16(`) }}
  ees''='''16( d, d' d, bes' d, e' d f b, d f,) |
  d'='''16( f, a d, f a, f' a, e' g,) a-- e'-- |
  <f,=' a d>8 r r <f,= a d> r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=8-\stBass dm! dm f[ d@m dm8] | e[ g@m! gm8] g, gm gm |
  c=8 c7! c7 e[ c@7 c78] | f fM! fM f fM fM |
  fis=8[ d@M! dM8] a,[ d@M dM8] | g gm! gm g gm gm |
  f'=8[ d@m! dm8] a, aM! aM | d16( a bes a bes a d=8) dm! r |

  {{ template "lh1" }} r4. | {{ template "lh1" }} f fM r |
  fis=8[ d@7! d78] a,[ d@7 d78] | g gm! gm gis[ e@7! e78] |
  a=,8[ d@m! dm8] a a7! a7 | d r r d= r r |
}
{{ end }}
