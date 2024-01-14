{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  {{ template "t2" (w `b'='8(-\mf a) g` `g a b`) }}
  {{ template "t2" (w `c=''8( fis,) fis` `fis g a`) }}
  {{ template "t2" (w `a='8( fis) fis` `fis g a`) }}
  {{ template "t2" (w `b='8( e,) e` `e g b`) }}
  {{ template "t2" (w `d=''8(_\dCre c) b` `b c d`) }}
  {{ template "t2" (w `e=''8( a,) a` `a b c`) }}
  {{ template "t2" (w `c=''8( a) a` `a b c`) }}
  {{ template "t2" (w `d=''8( g,) g` `g a b`) }}
  {{ template "t2" (w `c=''8( fis,) fis` `fis g a`) }}
  {{ template "t2" (w `b='8( e,) e` `e fis g`) }}
  {{ template "t2" (w `fis='8 ais cis` `e_\dDim dis e`) }}
  {{ template "t2" (w `fis=''8( b,) b` `b\>^\tRit c \af 8\! cis=''`) }}

  {{ template "t2" (w `d=''8(\p^\tATem c) b` `b c d`) }}
  {{ template "t2" (w `e=''8( a,) a` `a b c`) }}
  {{ template "t2" (w `c=''8(_\dCre a) a` `a b c`) }}
  {{ template "t2" (w `d=''8( g,) g` `g a b`) }}
  {{ template "t2" (w `c=''8(-> fis,) fis` `fis g a`) }}
  {{ template "t2" (w `b='8(-> e,) e` `e fis g`) }}
  {{ template "t2" (w `fis='8-> ais cis` `b-> dis fis`) }}
  \tuplet 3/2 { e=''8-> g b } e='''4\sf \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=8-\stBass r em! r | a, r am! r | b r b7! r | e r em! r |
  e=8 r e7! r | a, r am! r | d r d7! r | g, r gM! r |
  a=,8 r am! r | e' r em! r | fis,=, r fis7! r | b+bM! r r4 |

  g=,8 r gM! r | a r am! r | d r d7! r | g, r gM! r |
  a+am!8 r r4 | e+em!8 r r4 | fis+fis7!8 r b+b7! r | e+em! r e'=4 |
}
{{ end }}
