{{ define "rh1" }}
  {{ .a }} a gis a e' d cis d | e d e f bes a gis a |
  c='''16 bes fis g bes a e fis | a g cis, d f e dis e |
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
  d=8-\frBass a' f d' |
}
{{ end }}
