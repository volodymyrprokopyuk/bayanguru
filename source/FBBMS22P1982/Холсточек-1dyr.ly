{{ define "rh1" }}
  {{ .a }} a a a | g bes a g | f e d='4) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e f4 | g8 bes a g | f e d='4) |
{{ end }}

{{ define "lh1" }}
  e=8( e f4 | g8 bes a g f e {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  {{ template "rh1" (w `a'='8(\mf`) }}
  {{ template "rh1" (w `a'='8(`) }}
  {{ template "rh2" (w `e='8(`) }}
  {{ template "rh2" (w `e='8(_\dDim`) }}

  d='16\mf e f g a f e d | bes' g f e d e f g |
  a='16 bes a g f g f e | d\f e f g a f' e d |
  bes'=''16 g f e d e f g | a bes a g f g f d |
  a='16\mp b cis a d e f a | e_\dCre f g e f d c bes |
  a='16 bes a g f e f d | a b cis a d e f a |
  e='16 f g e f g a bes | a\>^\tRit bes a g \af 4\! <d=' d'>4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  f'='2(-\frBass | e | d) | <c d^~>( | <bes d^~> | <a= d>) \clef bass |
  \duo { bes=4( a | bes2 | a) | g4( a bes2 | a8 g f4) | }
  { d=2~ | d4 c~ | c bes | c2~ | c4 cis | d=2 | }

  a=4.( a8 | g bes a g | f e d4) | a'( f | g8 bes a g | f e d4) |
  {{ template "lh1" (w `d=4)`) }} {{ template "lh1" (w `d=4) \fermata`) }}
}
{{ end }}
