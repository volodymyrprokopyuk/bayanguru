{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key cis \minor
  \time 2/4
  \duo {
    e''=''8\mp^\aLeg e,_\aLeg e' e, | dis' dis, dis'_\dCre dis, |
    \rep 2 { bis'='8 bis,= } | \rep 2 { cis'=''8 cis,=' } |
    \rep 2 { dis'=''8 dis,=' } | \rep 2 { e'=''8 e,=' } |
    fisis'=''8_\dDim fisis,=' fisis' fisis, | \rep 2 { fis'=''8 fis,=' } |
  } {
    \rep 4 { gis'='16 cis='' } | \rep 4 { fisis,='16 ais=' } |
    \rep 4 { dis,='16 fis=' } | \rep 4 { e='16 gis=' } |
    \rep 4 { fis='16 a=' } | \rep 4 { gis='16 cis='' } |
    \rep 4 { ais='16 cis='' } | \rep 4 { gis='16 bis=' } |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key cis \minor
}
{{ end }}
