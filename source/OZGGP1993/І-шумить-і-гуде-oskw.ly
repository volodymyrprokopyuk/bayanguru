{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef bass
  \key bes \major
  \time 4/4
  bes=8->\f f-> d'='4-> \clef treble %
  <g,= bes ees>8. <a ees' f>16~-> 8 r \clef bass |
  bes=8-> f-> d'='4-> \clef treble %
  <g,= bes ees>4 <a= ees' f>8 r |
  <d=' bes'>8\mf f <d d'>4 \rep 2 { <d=' bes'>8 f <d=' d'>4 } %
  c'=''16( bes) a( g) f='4 |

  \repeat volta 2 {
    d='8 <d f>8 8 8 ees <ees g>8 8 8 |
    <ees=' f>8 <ees a> <ees c'> <ees a> <d=' bes'>8 8 4 |
  }
  \repeat volta 2 {
    d='8\f <d f> <bes d f>8 8 <bes ees>8 <bes ees g>8 8 8 |
    <ees=' f>8 <ees a> <ees c'>8( <ees a>) <d=' bes'>8 8 4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  bes,=,8->-\frBass f-> d'4-> <c, c'>8. f16~-> f8 r |
  bes=,8-> f-> d'4-> c16( bes a g f=,8) r |
  \rep 3 { bes=,8 f' f, f'= } c=8 <g' bes> f <c'=' ees> |

  bes=8 bes, aes' bes, <ees g> bes <ees g> bes | f' f, f' f, bes f bes=,4 |
  <bes=, bes'>4-> <aes aes'>-> <g g'>-> <ees ees'> |
  <f=, f'>4-> 4-> <bes, bes'>8-> f' <bes,=,, bes'>4 |
}
{{ end }}
