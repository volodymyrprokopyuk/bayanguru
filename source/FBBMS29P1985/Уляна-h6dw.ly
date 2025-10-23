{{ define "lh1" }}
  {{ .a }} f' d bes' | ees, bes' bes, bes'= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \minor
  \time 2/4
  \partial 8 { f'='8\f | }
  <d=' bes'>4 <f a>8 8 | <ees g>4( <d f>) | <f c'>4 a8( f) |
  <f=' bes>8 4 f8 | <d bes'>4 <f a>8 8 | <ees g>4( <d f>) |
  <f=' c'>4 a8( f) | <d bes'>4. bes'='8 |

  <bes=' ees>4_\dCre <bes d>8 8 | <bes c>4 <bes d>8 bes |
  <bes=' ees>4 <bes d>8 8 | <bes c>\< f16-> g-> f8-> \af 8\! r |
  <d=' bes'>4\f <f a>8 8 | <ees g>4( <d f>) | <f c'>4 a8( f) |
  <d=' bes'>16( c' d c bes8) r | r\f <ees, bes'> r <f bes> |
  r8 <g=' bes>8 r <f bes> | r <ees bes'> r <f bes> |
  r8\< c'=''16( d ees f g \af 16\! a) | <d, bes'>8->\ff 8-> <d a'>8-> 8-> |
  <ees='' g>8-> 8-> <d='' f>-> r \clef bass | c,='4-> a8( f |
  bes=8)-> r r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/2 #'(1)
  \partial 8 { r8 | }
  {{ template "lh1" (w `bes,=,8-\frBass`) }} | a,=,8 f' ees f | d f f, r |
  {{ template "lh1" (w `bes=,8`) }} | a,=,8 f' f, r | bes16[( c d c] bes=,8) r |

  g'=8 ees' f, bes | ees, g e bes' | ees, c' f, d' | ees, r r f-> |
  {{ template "lh1" (w `bes,=,8`) }} | a,=,8 f' f, r |  bes r r bes |
  ees=4 d8 d | c4 \acc { ees=8 } d bes | ees[ f16( ees] d8) f |
  c=4 f8 r | <bes f'>8-> 8-> <bes d>8-> 8-> | <bes ees>8-. 8-> <bes f'>-> r |
  c,=4-> f,-> | bes8-> bes,=,,-> r4 |
}
{{ end }}
