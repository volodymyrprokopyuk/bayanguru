{{ define "rightHand" }}
\relative {
  \tempo "Andante espressivo"
  \clef treble
  \key g \minor
  \time 2/4
  g'='8(\pp\< d' c f | d g,16 \af 32.\! a bes8)\> d,16--^\tRit \af 16\! d'-- |
  a='8(\<^\tATem fis16 g d'8 a' |
  d,=''8 g,16 \af 32.\! a) c,-.\>^\tRit ees-. fis-. \af 16\! c'-. |
  bes='8(\<^\tATem a16 bes c8 g16 \af 16\! d' |
  <ees,=' g>8)->\mf\> a'16-- a,-- f'8(^\tRit \af 8\! f,) |
  g='8(^\tATem a16 bes fis8) d'16-- a'-- |
  c,,='8\>^\tRit ees16-- \af 16\! d'~-- <g,=' d' g>4\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  \duo { \rep 3 { bes'='2~ | bes=' | } | bes~ | bes4 g=' \fermata | }
  {
    g'='4-\frBass fis | f e | d a' | ees fis | f e | cis d | f e |
    <ees=' fis>4 <b= d> |
  }
}
{{ end }}
