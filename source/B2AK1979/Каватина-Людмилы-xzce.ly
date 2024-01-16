{{ define "rh1" }}
  d=''4(-> g8)-. b,-. | c4-> d8-. e-. | d a16( b d c b a=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! b g@M | a8 am! g a@m | fis'8 d@M! d8 d7! | g,=, gM! %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \partial 4 { b'='8-.\mf c-. | }
  {{ template "rh1" }} | b8 g) b-.\mp c-. |
  {{ template "rh1" }} | b4) g8(\p a |
  b='4) fis'8( g | fis4) e8( d | cis a') b,(\< cis |
  d=''16 e d cis d fis e \af 16\! g) | fis8 a4 b,8~ | b g'4 e8~ |
  e=''8 b4 cis8 | d4 b8-.\mp c-. |
  {{ template "rh1" }} | b8 g) b-. c-. |
  d=''4(-> g8)-. b,-. | c c'(~ c16_\dCre b a g |
  fis=''16 e d c b c a b | g='4) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 4 { r4 | }
  {{ template "lh1" (w `g,=,8-\stBass`) }} g gM |
  {{ template "lh1" (w `g=,8`) }} r4 |
  dis'=8 b@7! b8 b7 | e em! g, e@m |
  a=,8 aM! g a@M | fis'8 d@M! a,8 a7! |
  d=8 dM! dis b@7! | e8 em! g, e@m |
  a=,8 e@m! a8 a7! | d dM! r4 |
  {{ template "lh1" (w `g,=,8`) }} g gM |
  g=,8 gM! f' g@M | e8 c@M! c=8 r |
  r4 d+d7!8 r | g+gM!4 r |
}
{{ end }}
