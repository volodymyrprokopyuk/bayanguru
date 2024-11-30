{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } \tuplet 3/2 { {{ .d }} } |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \af 2\! <e'=' c'>2\mf\> |
  \duo { <e'=' c'>4(\p 4 | c'-> b='8) } { s2 | f'='4~ f='8 } r8 |
  \duo { <f'=' d'>4(_\dCre 4 | d'->\< \af 8\! c=''8) } { s2 | g'='4~ g='8 } r8 |
  \duo { <g'=' e'>4( 4 | e'-> d=''8) } { s2 | a'='4~ a='8 } r8 |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \set subdivideBeams = ##t
  \omit TupletBracket
  {{ template "t1" (split `c=16-\frBass e f ; g a b ; c d c ; b c b`) }}
  {{ template "t1" (split `a=16 c a ; g a g ; f g f ; e f e`) }}
  {{ template "t1" (split `d=16 f e ; a b c ; d e d ; c d c`) }}
  {{ template "t1" (split `b=16 c b ; a b a ; g a g ; f g f`) }}
  {{ template "t1" (split `e=16 g a ; b c d ; e g e ; d e d`) }}
  {{ template "t1" (split `c='16 d c ; b c b ; a b a ; g a g`) }}
  {{ template "t1" (split `f=16 a b ; c d e=' ; \clef treble f=' g f ; e f e`) }}
}
{{ end }}
