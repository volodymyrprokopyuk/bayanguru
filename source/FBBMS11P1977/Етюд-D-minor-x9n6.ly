{{ define "rh1" }}
  {{ .a }} d cis | d cis d cis | d-> a g bes | f a e a |
  \rep 2 { d,='8 f a c | bes-> g e cis=' | }
{{ end }}

{{ define "rh2" }}
  {{ .a }} f a | g a cis, a'=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} | <d f a> <d g bes> | <d f a>4 <c=' e> \clef bass |
  <bes= d>4 <a cis> | \rep 2 { <f= a>4 d' | cis a= | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `d''=''8->\f cis_\aLeg`) }}
  {{ template "rh2" (w `r8\p a'='8`) }}
  {{ template "rh2" (w `r8 a='8`) }}

  d,='8\< e f g | a bes cis \af 8\! d | e\mf f g f |
  \rep 2 { e=''8 f g f='' | } | e d cis bes | cis d e d |
  cis=''8 bes a g | \rep 2 { f='8 g f g | e f e a=' | }
  f='8 a g bes | a cis bes d | cis_\dCre e d f | e g f a |
  g=''8->\f bes f a | e\> g d \af 8\! f | cis\> e bes \af 8\! d |
  a='8\> cis g \af 8\! bes | \rep 4 { a='8 bes a bes=' | }

  {{ template "rh1" (w `d=''8->\f cis`) }}
  d='8->\p cis d cis | d cis d cis | d-> a g bes= \clef bass |
  f=8 a e a | \rep 2 { d,=8 f a c | bes-> g e cis= | }
  d=8->-\f f a cis=' \clef treble | d='\< f a cis | d f a \af 8\! cis=''' |
  \ottava #1 d='''8_\dDim f a cis | d=''''\p \ottava #0 r r4 \clef bass |
  a,,,=8\pp r r4 | d,=8 r r4 \bar  "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \minor
  \meter 1/2 #'(1)
  {{ template "lh1" (w `<d'=' f a>4-\frBass <d g bes>_\aSta`) }}
  \rep 2 { d='4 a | e' a,= | } \clef treble |

  bes=8_\aLeg cis d e | f g a bes | \rep 3 { cis=''8 d e d='' | }
  cis=''8 bes a g | a bes cis bes | a g f e |
  \rep 2 { <bes= d>4.-- 8-. | <a= cis>4.-- 8-. | }
  <bes= d>4_\aSta <cis e> | <d f> <e g> | <f a> <g bes> |
  <a=' cis>4 <bes d> | <cis e> <bes d> | <a cis> <g bes> |
  <f=' a>4 <e g> | <d f> <cis e> | <d f>4.-- 8-. |
  <e=' g>4.-- 8-. | <d f>4.-- 8-. | <cis=' e>4.-- 8-. |

  {{ template "lh1" (w `<d=' f a>4_\aSta <d g bes>`) }}
  \rep 2 { <d,= f a>4 <d= g bes> | } | <d f a> <c e> |
  <bes=, d>4 <a cis> | \rep 2 { <f=, a>4 d' | cis a=, | }
  d,=,8[-> r r a'] | d[ r r a'=] \clef treble |
  d='8[ r r a'] | d[ r r a] | d='' r r4 \clef bass |
  a,,=,8 r r4 | d,=,8 r r4 |
}
{{ end }}
