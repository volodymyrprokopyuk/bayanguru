{{ define "rh1" }}
  {{ .a }} cis)-. r cis-. r \af 8\! cis-. |
  gis'=''8(\fp\< cis,)-. r cis-. r \af 8\! cis=''( |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cis' a cis) \rep 2 { fis,=16( cis' a cis=') } |
  \rep 3 { eis,=16( cis' gis cis=') } |
{{ end }}

{{ define "lh2" }}
  \rep {{ .a }} { fis,=16( cis' a cis=') } %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key fis \minor
  \time 3/4
  \repeat volta 2 {
    {{ template "rh1" (w `fis''=''8(\fp\<`) }}
    a'=''8)-. a-. r a-. b16(\< a gis \af 16\! fis) |
    fis=''8( eis)-. r eis-. r eis=''-. |

    {{ template "rh1" (w `fis=''8(\fp\<`) }}
    a'=''8)-. a-. r fis-. gis[-. eis]-. |
    \alternative {
      \volta 1 { eis=''4(-> fis=''8) r r4 | }
      \volta 2 { eis=''4(-> fis=''8) r r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key fis \minor
  {{ template "lh1" (w `fis=16(-\frBass`) }}
  {{ template "lh2" (w `3`) }} |
  cis,=16( cis' gis cis) \rep 2 { eis,=16( cis' gis cis=') } |

  {{ template "lh1" (w `fis,=16(`) }}
  {{ template "lh2" (w `2`) }} cis,( cis' gis cis) |
  {{ template "lh2" (w `5`) }} fis,=4-- |
}
{{ end }}
