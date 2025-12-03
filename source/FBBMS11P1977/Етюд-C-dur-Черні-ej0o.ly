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
  \meter 1/2 #'(1)
  \af 2\! <e'=' c'>2\mf\> |
  \duo { <e'=' c'>4(\p 4 | c'-> b='8) } { s2 | f'='4~ f='8 } r8 |
  \duo { <f'=' d'>4(_\dCre 4 | d'->\< \af 8\! c=''8) } { s2 | g'='4~ g='8 } r8 |
  \duo { <g'=' e'>4( 4 | e'-> d=''8) } { s2 | a'='4~ a='8 } r8 |
  <d'='' f>4( 4 | 4->\f <c e>8) r8 | <b d> r <c e> r | <d f>4(\sf <c e>8) r |
  <b=' d>8 r <c e> 4 | <a c fis>2 | 4(\f 4 | <b=' d g>) r_ \dDim | R2 |

  <d='' b'>4( 4 | 4-> <c a'>_\dCre | <b g'>8) r %
  \duo {
    \stemDown <b''='' d>4( | 4-> <a='' c> \stemUp |
    \ottava #1 b=''8\f c d e | f=''') %
  } { s4 | s2 | g''=''2~ | g=''8 } <e'=''' a>8\( <d g> <c f> |
  <b='' e>8 <a d> <g c> <f='' b> \ottava #0 | <e='' a> <d g> <c f> <b e> |
  <a=' d>8 <g c> <f b> <e a> | <d g>4\) <d f>( |
  <c=' e>4) <e c'>( <d a' d> <d f g b> | <e g c>) <f a c>( |
  <e=' g c>4) <f a c>( | <e g c>2) | <e g c e>4-.\ff <g c e g>-. |
  <c='' e g c>4-. r \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \set subdivideBeams = ##t
  \omit TupletBracket
  {{ template "t1" (split `c=16-\frBass e f ; g a b ; c d c ; b c b`) }}
  {{ template "t1" (split `a=16 b a ; g a g ; f g f ; e f e`) }}
  \omit TupletNumber
  {{ template "t1" (split `d=16 f g ; a b c ; d e d ; c d c`) }}
  {{ template "t1" (split `b=16 c b ; a b a ; g a g ; f g f`) }}
  {{ template "t1" (split `e=16 g a ; b c d ; e f e ; d e d`) }}
  {{ template "t1" (split `c='16 d c ; b c b ; a b a ; g a g`) }}
  {{ template "t1" (split `f=16 a b ; c d e=' ; \clef treble f=' g f ; e f e`) }}
  {{ template "t1" (split `d='16 e d ; c d c=' ; \clef bass b= c b ; a b a`) }}
  \rep 2 {
    {{ template "t1" (split `g=16 b c ; d c b ; g c d ; e d c`) }}
    {{ template "t1" (split `g=16 d' e ; f e d ; g, c d ; e d c`) }}
  }
  \rep 2 { {{ template "t1" (split `g=16 c d ; ees d c ; g c d ; ees d c='`) }} | }
  {{ template "t1" (split `g=16 b c ; d c b ; g b ais ; b ais b=`) }}

  {{ template "t1" (split `d,=16 g fis ; g fis g ; b, d cis ; d cis d`) }}
  {{ template "t1" (split `g,=,16 fis g ; a g a ; b a b ; c b c`) }}
  {{ template "t1" (split `d=16 cis d ; e d e ; fis e fis ; d e fis`) }}
  {{ template "t1" (split `g=16 fis g ; a g a ; b a b ; c b c=' \clef treble`) }}
  {{ template "t1" (split `d='16 cis d ; e d e ; fis e fis ; d e fis`) }}
  {{ template "t1" (split `g='16 fis g ; a g a ; b a b ; cis b cis`) }}
  {{ template "t1" (split `d=''16 e d ; c d c ; b c b ; a b a`) }}
  {{ template "t1" (split `g='16 a g ; f g f ; e f e ; d e d=' \clef bass`) }}
  {{ template "t1" (split `c='16 d c ; b c b ; a b a ; g a g`) }}
  {{ template "t1" (split `f=16 g f ; e f e ; d e d ; c d c`) }}
  {{ template "t1" (split `b=,16 d c ; b c d ; g, b a ; g a b`) }}
  {{ template "t1" (split `c=16 e d ; c d e ; a, c b ; a b c`) }}
  {{ template "t1" (split `f,=,16 a g ; f e f ; g a g ; f e d`) }}
  \rep 2 { {{ template "t1" (split `c=,16 e g ; c e g ; c a f ; c a f=,`) }} | }
  c=,2 | <c c'>4-. <c' e g c>-. | <c,=, c'>-. r \fermata |
}
{{ end }}
