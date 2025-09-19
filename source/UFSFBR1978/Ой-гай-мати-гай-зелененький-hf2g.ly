{{ define "rh1" }}
  {{ .a }} a a f' e \af 8\! d | cis16\> a f' e {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 3/4
  \meter 1/4 1,2
  {{ template "rh1" (w `a=8(\p\<` `d='4 c8 \af 8\! bes=)`) }}
  {{ template "rh1" (w `a=8(\<` ` \af 2\! d='2)`) }}
  \duo {
    <bes'=' d>16(\< <a c> <g bes> <fis a> g8 <bes, d'> <c c'> \af 8\! <d bes'> |
    <c=' a'>8 <d bes'>16 <c a'>\mf\> c'8. bes16 \af 4\! a='4) |
  } { s4 g'='4. r8 | s4 e4 f=' | }
  <bes'=' d>16( <a c> <g bes> <fis a> g8\< <bes d> <c e> \af 8\! <bes d> |
  \af 2.\! a='2.)\> \fermata |

  \duo {
    a'='8(\mp\< a a f' e d | <e, cis'>16 a f' e \af 4\! d4 c8\> \af 8\! bes |
    a='8\< a a f' e \af 8\! d | <e, cis'>16\> a f' e \af 2\! d2) |
    d=''4~(\mf\< d8 \af 8\! d'\f c bes |
    a=''8\> bes16 a <c, c'>8. <bes bes'>16 \af 4\! <a=' a'>4) |
  } {
    s2 g'='8 f | r g f4 <e g>8 d | cis r d4 e8 f | r g f2 |
    d'=''16 c bes a g8 d' <c e> <bes d> | <a c> <bes d>16 <a c> e'4 f='' |
  }
  <d='' d'>16(\< <c c'> <bes bes'> <a a'> %
  <g=' g'>8 <d' bes' d> <e c' e> \af 8\! <d bes' d> |
  \af 2.\! <a=' a'>2.)\> |

  R2.\f |
  \duo {
    e''=''8(\> f16 e d4 c8 \af 8\! bes | a\< a d a' <cis, g'> \af 8\! <d f> |
    e=''8\> f16 e \af 2\! d=''2) |
  } { a'='8 g f4 g8 f | e r f r e f | <e a> g f='2 | }
  <d='' d'>8(\p <c d fis d'> <bes d g>4 <d g bes>8 8 |
  <c='' a'>8 <bes d bes'> <c e a c>4 <c f a>) |
  <d='' f bes d>16( <c c'> <d f a d>8 %
  <bes=' d g>8 <d bes' d>^\tRit <e a c> <d bes' d> |
  \af 2.\! <a=' a'>2.)\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
}
{{ end }}
