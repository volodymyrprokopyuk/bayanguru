{{ define "rh1" }}
  {{ .a }} a16-. a-. a8-. a='-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <eis gis>8. <fis a>16 | <a fis'>4. <fis=' a>8 |
{{ end }}

{{ define "rh3" }}
  {{ template "rh1" (w .a) }}
  {{ template "rh1" (w `<fis=' d'>8->`) }}
  <fis=' d'>8-> <a fis'>-. <g e'>-. <fis d'>-. |
  \rep 3 { {{ template "rh1" (w `<e=' cis'>8->`) }} | }
  <e=' cis'>8-> <g e'>-. <fis d'>-. <e=' cis'>-. |
{{ end }}

{{ define "rh4" }}
  \tuplet 3/2 { {{ .a }} d fis } \tuplet 3/2 { a=''8 fis a } |
{{ end }}

{{ define "lh1" }}
  \rep {{ .a }} { d=8 <fis a> a, <fis'= a> | }
{{ end }}

{{ define "lh2" }}
  \rep {{ .a }} { <d= a'>8-> r r4 | } \rep 4 { <a=, g'>8-> r r4 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key d \major
  \time 2/4
  \tuplet 3/2 { r8\p d'='8 fis } \tuplet 3/2 { a='8 fis a } |
  d=''8. a16( d4) | {{ template "rh4" (w `fis=''8`) }}
  \af 2\! d='''2\> \fermata |

  {{ template "rh3" (w `<fis,,=' d'>8->\mp`) }}
  <d=' d'>8-> d16-. d-. d='4-- |

  \repeat volta 2 {
    {{ template "rh2" (w `<fis=' a>4\mf`) }}
    <fis=' a>8. <e g>16 <dis fis>8. <e g>16 |
    <e=' g>4 a, | <e' g> <dis fis>8. <e g>16 |
    <g=' e'>4. <e g>8 | 8. <dis fis>16 <e g>8. <cis a'>16 | <d fis>2 |
    {{ template "rh2" (w `<fis=' a>4`) }}
    <fis=' ais>8. 16 <gis b>8 <ais cis> | <cis e>4 <b d> |
    <d='' fis>8.-> <cis e>16 <b d>8 <a cis> | <gis b> <fis a> <e gis> fis |
    e='8. <fis d'>16 <e cis'>8 <d b'> | <cis a'>8 a'16-. a-. a8-. a16-. a-. |
    a='8-. g-. fis-. e='-. |
  }

  {{ template "rh3" (w `<fis=' d'>8->\mf`) }}
  <fis=' d'>8-> d16-. d-. d8 d'16[\p d] |
  {{ template "rh4" (w `fis=''8\>`) }} | d8. a16( \af 4\! d4) |
  r4 <g,,,= a cis>4->\mf | <fis= a d>-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \rep 4 { R2 | }
  <d= a'>8->-\frBass r r4 | {{ template "lh2" (w `2`) }} | <d= fis>8-> r r4 |

  {{ template "lh1" (w `2`) }} | \rep 5 { cis=8 <g' a> a, <g'= a> | }
  {{ template "lh1" (w `3`) }} | \rep 2 { cis=8 <fis= ais> } |
  b,=,8 <fis' b> d <fis b> | <fis b d>-> r r4 | R2 |
  <e= gis d'>8 r r4 | a2~ | a8-. g-. fis-. e= |

  {{ template "lh2" (w `3`) }} | <d= a'>8-> r r4 | R2 | R2 |
  r4 ees,=,4-> | d=,-> r |
}
{{ end }}
