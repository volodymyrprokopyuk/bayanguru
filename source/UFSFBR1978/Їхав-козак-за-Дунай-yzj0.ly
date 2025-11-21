{{ define "rh1" }}
  <d=' fis>8[ a'] <d, fis d'>8.-> fis16 | <bes, d g>4. <c=' ees g>8-> |
{{ end }}

{{ define "rh2" }}
  {{ .a }} d cis d ees d cis d g d cis d ees d cis d='' |
{{ end }}

{{ define "rh3" }}
  g=''32 d cis d bes'8)-. <ees, a>-. g=''-. |
{{ end }}

{{ define "rh4" }}
  <d='' fis>8 a' <d, fis d'>8.-> fis16 | <bes, d g>4. <c='' ees f>8-> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  <d'=' g>8\mf 8 8 8 | 8 bes' a g | <d fis>8 8 8 8 | 8 a' g fis |
  <d=' g>8 8 8 8 | 8[ bes'] <ees, a> g | {{ template "rh1" }}
  <d=' f bes>8 8 8 8 | 8[ d'] <f, c'> bes |
  <c,=' f a>8 8 8 8 | 8[ c'] <fis, bes> a |
  <bes,= d g>8 8 8 8 | 8[ bes'] <ees, a> g=' | {{ template "rh1" }}

  \meter 1/4 1,1
  <d=' f bes>16\f \rep 7 { 16 } | 8[ d'] <f, c'>8(-> bes) |
  \rep 8 { <c,=' f a>16 } | 8[ c'] <fis, bes>8(-> a) |
  \rep 8 { <bes,= d g>16 } | 8[ bes'] <ees, a>(-> g) |
  \rep 2 { <fis=' a>16 16 <d=' d'>8 } | g <bes,= d g>8 8 r |

  \set subdivideBeams = ##t
  \set beamMinimumSubdivision = #1/8
  {{ template "rh2" (w `g''=''32(\mf`) }}
  g=''32 d cis d bes'8)-. a-. g-. |
  fis=''32( d cis d ees d cis d fis d cis d ees d cis d |
  fis=''32 d cis d a'8)-. g-. fis-. |
  {{ template "rh2" (w `g=''32(`) }} {{ template "rh3" }} {{ template "rh4" }}
  bes'=''32( f e f g f e f bes f e f g f e f |
  bes=''32 f e f d'8)-. <f, c'>-. bes-. |
  a=''32( f e f g f e f a f e f g f e f |
  a=''32 f e f c'8)-. <fis, bes>-. a-. |
  {{ template "rh2" (w `g=''32(`) }} {{ template "rh3" }} {{ template "rh4" }}
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
