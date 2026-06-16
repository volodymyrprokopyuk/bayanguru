{{ define "rh1" }}
  \duo { \af 2\! f''=''2\> | } { r8 <a'=' c> <bes d>16 f <bes d>8 | }
{{ end }}

{{ define "rh2" }}
 \rep 9 { f=8 <a c> c, <g'= bes> | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  \af 2\! R2\mp\< | \af 2\! R2\> |
  c''=''8 c d bes | a a bes g | f\< f g \af 8\! g | \af 2\! f2\> |
  a='8\< a bes \af 8\! g | \af 2\! f2\> | a8\< a bes g | \af 2\! c2 |
  c=''8\> bes a g | \af 2\! f='2 |

  <c'='' f a c>16\mf 16 8 <d f bes d> <d f bes> |
  <c='' f a>16 16 8 <d g bes> <bes d g> |
  <a=' c f>16\< 16 8 <bes=' d g>8 \af 8\! 8 |
  \rep 2 {
    {{ template "rh1" }} | a='16\< c f a bes, d g \af 16\! bes='' |
  }
  \duo { c'''='''2 | } { r8 <f''='' a>8 bes16 f bes=''8 | }
  c='''16 d c bes a bes a g | {{ template "rh1" }}

  c,=''8\f c d bes | a a bes g | f f g g=' |
  \duo {
    \rep 2 { f'='2 | a8 a bes g=' | } | c2 | c8 bes a g=' |
  } { a=4 bes | c d | c d | c d | f d | e='2 | } | \af 2\! f='2\> |

  \duo { f''=''2~\mf | f | f~\> | f~ | \af 2\! f='' | }
  {
    \rep 2 { r8 <a'=' c>8 r <g bes> | r <a c> <bes d>16 f <bes=' d>8 | }
    r8 <a=' c>8 r <g=' bes> |
  } | <f'='' a f'>8->\sf r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f=8-\frBass <a c> c, <g' bes> | {{ template "rh2" }}
  f=8 <bes d> c, <g' bes> | {{ template "rh2" }}
  f=8 <bes d> c, <g' bes> | f8 <a c> c, <g'= bes> |

  R2 | c='8 c d bes | a a bes g | f f g g | f2 |
  a=8 a bes g | f2 | a8 a bes g | c2 | c8 bes a g= |
  \rep 5 { f=8 <a c> c, <g'= bes> | } | <f= c'>8-> r r4 |
}
{{ end }}
