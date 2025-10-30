{{ define "rh1" }}
  {{ .a }} fis16( e fis) e-. d8-. |
  \acc { cis'='''8 } d='''8-> g,16( fis e) fis-. g-. b-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `fis''=''8->\mp`) }}
    a=''16(-> b a b a) g-. fis-. e-. |
    d=''16( fis) e-. fis-. b,-. g'-. a,-. g'-. |
    {{ template "rh1" (w `fis=''8->`) }} \bar "||"
    cis,=''16(-> d) e-. cis(-> d) e-. cis(-> d) |
    \alternative {
      \volta 1 { e=''16(-> fis) g-. b-. a(-> g) fis-. e=''-. | }
      \volta 2 {
        e=''16( fis) gis-. ais-. b8-> %
        \ottava #1 \acc { ais'='''8 } b='''-> \ottava #0 |
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
}
{{ end }}
