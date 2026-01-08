{{ define "rh1" }}
  {{ .a }} b' g {{ .b }} b e, b' g \af 16\! b |
  e,=''16\> b' g b e, b' g \af 16\! b='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 2/4
  {{ template "rh1" (w `e''=''16\p\<` `_ \aSta`) }}
  {{ template "rh1" (w `e,=''16\<` ``) }}
  e,=''16\< b' g b e, b' g \af 16\! b | e,\> b' g d' a e' c \af 16\! e |
  a,=''16\< e' c e b e a, \af 16\! e' | g,\> e' b e a, e' c \af 16\! e |
  c='''16\< e a, e' g, e' a, e' | b e g, e' e,8( \af 8\! b'='' |

  b=''4.\mf a8 | g4)
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
