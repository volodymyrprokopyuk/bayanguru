{{ define "rh1" }}
  {{ .a }} 8-. <g cis>4 | <a c>8-. 8-. \af 4\! <g bes>4 |
  <g=' a>8-. {{ .b }} 8-. <fis a>8-. 8-. | g16( d e fis g a bes c |
  {{ .c }} 8-. <e cis'>8-. 8-. | <a c>8-. 8-. <g bes>4 |
  <g=' a>8-. 8-. <fis a>-. \af 8\! <c fis>-. |
  <bes= g'>4\f <bes= d g>-- |
{{ end }}

{{ define "lh1" }}
  {{ .a }} a8-. a-. | fis4 g8-. ees-. | ees'-. ees-. d-. <c d>-. |
  <bes=~ d~>8 <g bes d> r g16( a | bes8) r a-. a-. | fis4 g8-. ees-. |
  ees'='16( d c8 d) d,-. | g-. d-. g,=,4-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `<bes'=' d>8-.\mf\<` `` `<g=' d'>8)-.\<`) }} \fine \bar "||"

    \volta 2
    \tempo "Meno mosso"
    <bes= ees g>8(\p 8 <a ees' ges>8 8 | <bes d f>4 4) |
    <bes= ees g>8( 8 <a ees' ges>8 8 | <bes d f>2) |
    <bes= ees g>8(\mf 8 <a= ees' ges>8 8) |
    \duo { <d'=' f>8( 8 g a=') | } { bes=4 <bes= d> | }
    <bes= ees g>8( 8 <a ees' ges>8 <bes= ees g>) |
    \duo { r4^\tRit d''=''4 | } { <c'=' fis a>2 | }

    \tempo Sostenuto
    {{ template "rh1" (w `<bes'=' d>8-.\p\<` `^\tAcc` `<g=' d'>8)-.\mf\<^\tATem`) }} \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  {{ template "lh1" (w `g=4-\frBass`) }}

  \rep 3 { ees'=4-- ees-- | bes8( f' g a=) | }
  \duo { s2 | r4 d'='4 | } { ees=2( | d=) | }

  {{ template "lh1" (w `g=4`) }}
}
{{ end }}
