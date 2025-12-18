{{ define "rh1" }}
  {{ .a }} <cis e> <a b> <d e> <a cis> <cis e> <a b> <d='' e> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} b a e) | cis'( b a e) | a( a b16 a b8 | cis16 b cis8 d='4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \major
  \time 2/4
  {{ template "rh1" (w `<a'=' cis>16\mf`) }}
  \rep 3 { {{ template "rh1" (w `<a=' cis>16`) }} | }
  <a=' cis>8 <a b> \duo { b'='8 gis=' } { gis'='8 fis16( e=') | }
  <cis='' e>8 <b d> <a cis>16( e <d e>8) | <a'=' cis>8 <a b> %
  \duo {
    a'='4 | a8 a b16( a b8) | cis16(\<^\tRit b cis8) \af 4\! d=''4 |

    \tempo "Meno mosso"
    cis=''8(\f b a e) | r16 <fis a>16 16 <a b> <a cis> <b d> <cis e> <b d fis> |
    a'=''8 a, b16 a b8 | cis16 b cis8 <b=' d>4 |
  } {
    fis'='8( e) | r16 e fis e d8 e | <e a> <fis a> fis16( gis a b=') |

    r16 <d,=' e>16[ r16 16] r <cis fis>[ r <a b>] | cis8 d16 e fis8 a |
    <a=' cis e>8 <cis, e> <d fis> <dis fis> | <e a~> <fis~ a> fis e=' |
  }

  {{ template "rh1" (w `<a=' cis>16\mp`) }}
  <a=' cis>16 <cis e> <a b> <d e> <cis e> <d fis> <e gis> <d fis gis> |
  r8^\tRit <cis='' e fis>8[ r8 8] | r8 8 %
  \duo { <d''='' fis a>4( | 2) \fermata \bar "|." }
  { cis''=''8( b) | cis2 \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  R2 | {{ template "lh1" (w `cis'='8(`) }}
  \rep 4 { e,=16 <a cis> e <a= b> } | cis,8 <d fis> e <a b> | fis <d e> b e,=, |

  \rep 8 { a=,16 e=, } | \rep 2 { a=,16 <e'= fis> } d8 b | e, d b' e,=, |
  {{ template "lh1" (w `cis''='8(`) }} | a=2 \fermata |
}
{{ end }}
