{{ define "rh1" }}
  {{ .a }} r <b d>] r <a c>[ r <gis=' b>] |
{{ end }}

{{ define "lh1" }}
  {{ .a }} <c e> e, <d' f> a <c e> e, <d'=' f> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `r8\mf <c''='' e>8[`) }}
  {{ template "rh1" (w `r8 <c='' e>8[`) }}
  a='8 a a <e a>8 8 <e c'> <dis b'>( a') |
  <d,=' gis>8 8 8 8 8 <d b'> <d a'>( <d gis>) |
  a'='8 a a a a c b a | gis b e gis, a4 <f=' b> |

  \repeat volta 2 {
    <e=' c'>8 8 8 8 8( e') <fis, d'> c' |
    <g=' b>8 8 8 8 8( d') <gis, c> b |
    a='8 a a a <f a> c' <fis, b> a |
    \alternative {
      \volta 1 { gis='8 b e gis, a r <f=' b>4 | }
      \volta 2 { gis='8 b e gis, a=' r r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a=8-\frBass`) }}
  {{ template "lh1" (w `a=8`) }}
  a=8 <c e> e, <a c> c, a' b, a' | e b' b, b' e, b' b, b' |
  a=8 <c e> g <c e> f, <c' ees> f, <c' ees> |
  e,=8 <b' d> e, <b' d> a <c e> <g= d'>4 |

  \rep 3 { c,=8 <g'= c> } d <fis c'> |
  \rep 3 { g=8 <d'=' f> } e, <gis d'> |
  f=8 <a c> e <a c> d, <a' c> dis, <a' b> |
  e=8 <b' d> e, <b' d> <a c> r <g d'>4 |
  e=8 <a d> e <b' d> <a c> r a,=, r |
}
{{ end }}
