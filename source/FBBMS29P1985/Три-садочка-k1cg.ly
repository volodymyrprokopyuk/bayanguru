{{ define "rh1" }}
  {{ .a }} f d d | g4 f=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Sostenuto espressivo"
  \clef treble
  \key d \minor
  \time 2/4
  {{ template "rh1" (w `f'='8\p`) }} | e='8( d16 e f4) |
  {{ template "rh1" (w `f='8`) }} | e='8( f16 e d4) |
  f='8\mf f d d | <bes' d>4 <a c> | <g bes>8 <d d'> <f a>4 | f8 f d d |
  \duo { bes'='4\> a | g8(^\tRit a16 g \af 4\! d='4) \bar "|." }
  { d'='2 | e8 c d='4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \rep 3 { R2 | } | d'='4 c | bes a | g f | a8 c bes a |
  g=8 f e ees | d c f e | d c bes a | g e f4 | e d=, |
}
{{ end }}
