{{ define "rh1" }}
  {{ .a }} d) d d | e16( d cis b d8 b=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key b \minor
  \time 2/4
  {{ template "rh1" (w `b'='8(\p`) }}
  {{ template "rh1" (w `b='8(`) }}
  d=''8( d cis16 d cis8 | b4) b | b16( cis d8 e e | b4) b=' |

  b='16(\mf cis d8) b16( cis d fis | e d cis d e8 cis) |
  d=''16(\< e fis g a c b \af 16\! a | g\> fis e b d e \af 8\! cis8) |
  d=''16(\< e fis d c d e \af 16\1 fis | g\> fis e d cis b a \af 16\! cis) |
  \duo { b'='16(\< cis d e fis g fis \af 16\! e | b'=''2) | }
  { s2 | r8 b'='16 d b='4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
