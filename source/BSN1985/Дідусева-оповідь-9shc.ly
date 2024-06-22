{{ define "rh1" }}
  {{ .a }} a8 {{ .b }} a g4 a8 g | f4 g8 f e4 e) |
  d='4( e8 d c4 d8 c | d {{ .c }} f e d {{ .d }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  R1\p | R1 | a=4( a8 b c4 b8 c | d4 c8 d e2) |
  {{ template "rh1" (w `a='4(\mf` `_ \aDol` `` `a=2)`) }}
  {{ template "rh1" (w `a'='4(\p` `_ \dCre`
     `_ \dDim^\tRit` `a'='2) \fermata`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a=4(-\frBass a8 b c4 c | d c8 d e4 e) | R1 | b4( a8 b c2) |
  \duo { f'='2 e | d c | b a | b= s2 | } { a=1~ | a | e~ | e2 a= | }
  f='4( a, e' a, | d a c a) | b( e, a e | b'4 c8 b a=2) \fermata |
}
{{ end }}
