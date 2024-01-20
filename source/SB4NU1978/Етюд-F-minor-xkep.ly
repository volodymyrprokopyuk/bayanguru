{{ define "rh1" }}
  {{ .a }} f bes {{ .b }} f c' {{ .b }} f, %
  des'=''16 {{ .b }} f, c' {{ .b }} f, bes {{ .b }} f |
  aes='16 {{ .c }} f bes f c' f, des' f, c' f, bes f) |
  aes='16( f f' f, ees' f, des' f, c' f, bes f=' |
{{ end }}

{{ define "rh2" }}
  \rep 2 {
    {{ .a }} r f(\p c g' c,] aes' c, bes' c, c') r |
    <des,=' g c>16[->\mf r bes'(\p des, aes' des,] g des f des ees=') r |
  }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Agitato
  \clef treble
  \key f \minor
  \time 6/8
  {{ template "rh1" (w `aes'='16(->\f` `->` `_ \aSim`) }}
  aes='16 c, g' c, f b, e c g' c, c') r |
  {{ template "rh1" (w `aes='16(` `` ``) }}
  g='16 ees ees' ees, des' ees, c' ees, bes' ees, aes ees) |
  f='16( des des' des, c' des, bes' des, aes' des, g des |
  f='16 c c' c, e c f[) r g( aes bes c] |
  ees=''16[) r des( des, c' des,] bes' des, aes' des, g d |
  f='16 c des c e c f='8) r r |

  {{ template "rh2" (w `<c=' ees>16[->\mf`) }}
  <c=' ges' aes>16[\mf r c'( aes des aes] ees' aes, f' aes, ees') r |
  <f,=' ees'>16[\sf r des'(\p f, c' f,] des' f, ees' f, des') r |
  <d,=' aes' bes>16[\sf r d'(\p bes ees bes] f' bes, g' bes, f') r |
  <g,=' des' f>16[\sf r ees'(\p g, d' g,] des'\> g, bes des, \af 16\! g) r |

  {{ template "rh2" (w `<c,=' ees>16[->\mf`) }}
  <c=' ges' aes>16[\sf r c'( aes des aes] ees' aes, f' aes, ees' aes,) |
  ees'=''16( f, des' f, c' f, ees' f, des' f, bes f) |
  aes='16( ees g ees aes ees <g c> ees g ees <g bes> ees |
  aes='16 ees aes ees c' ees, aes='8) r r |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
}
{{ end }}
