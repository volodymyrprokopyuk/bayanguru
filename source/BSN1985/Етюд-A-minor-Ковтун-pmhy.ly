{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } |
{{ end }}

{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "t2" (w `a'='8(\mf\< b c` `d c \af 8\! b`) }}
  {{ template "t1" (w `c=''8\> c b` ` \af 4\! a4)`) }}
  \omit TupletNumber
  {{ template "t2" (w `a='8(\< b c` `d c d`) }}
  {{ template "t1" (w `e=''8 c a'` ` \af 8\! g8) r`) }}
  {{ template "t2" (w `a=''8(\f\> a e` `f e d)`) }}
  {{ template "t2" (w `g=''8( g d` `e d \af 8\! c)`) }}
  {{ template "t2" (w `f=''8(\< e d` `c b \af 8\! a`) }}
  {{ template "t1" (w `b='8\>^\tRit e, e'` ` \af 4\! a,='4)`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  <a= e'>4---\frBass <a f'>-- | <a e'>4-- 4-- | 4-- <g f'>-- | <c e>4~-- 8 r |
  <a= e'>4-- <d f>-- | <g, f'>-- <c e>-- | <a f'>-- <a e'>-- | <e d'>-- <a= c>-- |
}
{{ end }}
