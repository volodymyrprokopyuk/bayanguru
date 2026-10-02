{{ define "rh1" }}
  {{ .a }} a gis a e' d cis d | e d e f bes a gis a |
  c='''16 bes fis g bes a e f | a g cis, d f e dis e |
  bes='16 a gis a e' d cis d | e d e f bes a cis d |
  f='''16 e ais, b d cis cis ais | ees' d gis, a c bes bes e, |
  d'='''16 c fis, g bes a e f='' |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 16 4~ | 16 a( bes c d e f g='' |
{{ end }}

{{ define "rh3" }}
  {{ .a }} 16 4~ | 16 a( b cis d e fis g='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a' f d' | a <d f> f, <a= d> |
{{ end }}

{{ define "lh2" }}
  e=8 <bes' d> f <a d> | <g bes e>4 <gis d' f>8 <a= cis g'> |
{{ end }}

{{ define "lh3" }}
  e=8 <gis d'> a <cis g'> | d, <fis c'> g <bes f'> |
  c,=8 <e bes'> f <a= c e> |
{{ end }}

{{ define "lh4" }}
  {{ .a }} 16 4~ | 16 f( g a bes c d e=' |
{{ end }}

{{ define "lh5" }}
  {{ .a }} 16 4~ | 16 fis( g a b cis d e=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  {{ template "rh1" (w `bes'='16\mf`) }} | c'='''16 bes f g a=''4 |

  {{ template "rh2" (w `<a,=' c f a>8.\ff`) }}
  {{ template "rh2" (w `<a,=' c f a>8.)`) }}
  <a,=' c f a>8.) 16 4 | <a cis fis a>8. 16 4 |
  {{ template "rh3" (w `<a=' d fis a>8.`) }}
  {{ template "rh3" (w `<a,=' d fis a>8.)`) }}
  <a,=' d fis a>8.) 16 4 | <bes des f a>8. 16 4 |
  <a=' cis f a>8. 16 4 | <a' cis f a>4 <a,=' cis f a> |

  {{ template "rh1" (w `bes='16\p`) }}
  a=''16^\tRit g dis e a g dis e | a\> g dis e a g b, \af 16\! cis |
  <f,=' a d>2\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `d=8-\frBass`) }} {{ template "lh2" }}
  {{ template "lh1" (w `d,=8`) }} {{ template "lh3" }}
  <e= g bes d>4 <a= cis e> |

  {{ template "lh4" (w `<f= a c f>8.`) }}
  {{ template "lh4" (w `<f,= a c f>8.)`) }}
  <f,= a c f>8.) 16 4 | <dis fis a cis>8. 16 4 |
  {{ template "lh5" (w `<d= fis a d>8.`) }}
  {{ template "lh5" (w `<d,= fis a d>8.)`) }}
  <d,= fis a d>8.) 16 4 | <bes des f a>8. 16 4 |
  <a=, cis f g>8. 16 4 | <a' cis f g>4 <a,=, cis f g> |

  {{ template "lh1" (w `d=8`) }} {{ template "lh2" }}
  {{ template "lh1" (w `d,=8`) }} {{ template "lh3" }}
  <e= g bes d>4 <f g b d> | <f g bes des> <e g a cis> | <d= f a d>2 |
}
{{ end }}
