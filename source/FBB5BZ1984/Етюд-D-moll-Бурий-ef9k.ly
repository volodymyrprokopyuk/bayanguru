{{ define "rh1" }}
  {{ .a }} 16 4~ | 16 a( bes c d e f g='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  bes'='16\mf a gis a e' d cis d | e d e f bes a gis a |
  c='''16 bes fis g bes a g f | a g cis, d f e dis e |
  bes='16 a gis a e' d cis d | e d e f bes a cis d |
  f='''16 e ais, b d cis cis ais | ees' d gis, a c bes bes e, |
  d'='''16 c fis, g bes a e f | c' bes f g a=''4 |

  {{ template "rh1" (w `<a,=' c f a>8.\ff`) }}
  {{ template "rh1" (w `<a,=' c f a>8.)`) }}
  <a,=' c f a>8.) 16 4 | <a cis fis a>8. 16 4 |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
