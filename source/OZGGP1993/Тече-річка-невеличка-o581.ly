{{ define "rh1" }}
  {{ .a }} | <g c e>4 <g= c ees>8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 3/8
  d''=''8\mf g, g' | c,16( g g'4) | d8 g, g' | c,16( g g'=''4) |
  \meter 1/8 1,1,1
  \repeat volta 2 {
    g,='16\mp g g( a bes) c | d d d8( c16) bes |
    a='16 bes c8 d16( c) | bes( a) g='4 |
  }
  f='8\mf <d' f>4 | <c ees>8 <bes d>4 |
  f='8 <d' f>4 | <c ees>8 <bes d>16( <c ees> <bes d> c) |
  g='16 g g( a bes) c |
  \duo {
    d''=''16 d d8( c16) bes | a bes c8 d16( c) | g'=''4.^\tRit \bar "|."
  } { g'='4 g8 | f4 e8 | bes'16( a) g='8 r8 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  {{ template "rh1" (w `<g= bes d>4.-\frBass`) }}
  {{ template "rh1" (w `<g= bes d>4.`) }}
  <g= bes d>4 <fis bes d>8 | <f bes d>4 8 |
  <ees= g c>4 <c fis c'>8 | <g'= bes d>4. |
  ees'='4 f,8 | f'4 f,8 | ees'4 f,8 | f' f, fis |
  <g= bes d>4 <fis bes d>8 | <f bes d>4 <e bes' d>8 |
  <ees= g des'>4 <d fis c'>8 <g= bes d>4. |
}
{{ end }}
