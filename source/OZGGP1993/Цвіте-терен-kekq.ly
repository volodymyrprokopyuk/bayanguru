{{ define "lh1" }}
  {{ .a }} d' bes') g,( d' bes') | g,( d' fis) g,( d' {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 6/8
  g'='4\mp <bes d>8 8( <a c>) <g bes> | <fis a>4 <a c>8 8 <g bes>4 |
  g='4 <bes d> 8 8( <a c>) <g bes> | <fis a>4( <a c>8) <g bes>4( <ees=' a c>8) |

  \repeat volta 2 {
    <f=' bes d>4 <d' f>8 8( <c ees>) <bes d> | <a c>4 <c ees>8 8 <bes d>4 |
    g='4 <bes d>8 8( <a c>) <g bes> |
    \alternative {
      \volta 1 { <g=' a>4( <fis c'>8) <g bes>4( <ees a c>8) | }
      \volta 2 { <g=' a>4 <fis c'>8 g='4. \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  {{ template "lh1" (w `g,=,8(-\frBass` `g=)`) }}
  {{ template "lh1" (w `g,=,8(` `f=)`) }}

  bes,=,8( f' bes) bes,( f' bes) | f( c' ees) fis,( c' d) |
  g,=8( bes d) f,( g bes) | ees,( a d,) g( g, f') | ees( a d,) <g= bes>4. |
}
{{ end }}
