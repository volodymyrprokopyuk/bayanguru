{{ define "rh1" }}
  {{ .a }} fis g e] | b'4 a8 b16 a | g4.) g8( |
  c=''8\< d16 c b8 \af 8\! e='') |
{{ end }}

{{ define "lh1" }}
  R2 | {{ .a }} cis dis b | e d c b) | a4 g | fis e= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 2/4
  {{ template "rh1" (w `e'='8[(\p`) }} | a,='8( b16 a g8 e) |
  \duo { fis'='8(\> g16 a g8 \af 8\! fis | e4) \stemDown b'=' | }
  { c'='4 dis=' | s2 | } | b'='8( c16 b a8)\< e16( \af 16\! fis |
  <e=' g>8[ fis <e g> <fis a>] | <g b>4.) b16( c | <a d>8[ c b a] |
  gis='4) e'8( d | <a c> b16 c a8\> g16 a | \af 2\! <fis=' b>2) |

  {{ template "rh1" (w `e='8[(\p`) }} | a,='8( b16 a g8 a16^\tRit g) |
  \duo { fis'='8(\> e) \af 4\! dis='4 | } { c'='4 a= | }
  <g,= e'>2\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \meter 1/2 #'(1)
  {{ template "lh1" (w `b=8(-\frBass`) }}
  a,=,4 b | e8( fis g e) | <gis d'>4 <a c> |
  \duo { c'='2( | b8) s4. | d2~ | d8 s4. | s4 e4(~ | e dis=') | }
  { r4 d=4( | g8) a^( b g) | fis4 f | e8 d'^( c b) | a4 c | b=2 | }

  {{ template "lh1" (w `b=8(`) }} | a,=,8( g16 a b8[ b,]) | e=,2 \fermata |
}
{{ end }}
