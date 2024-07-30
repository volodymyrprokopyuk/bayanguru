{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  \repeat volta 2 {
    e''=''8.\mf f16 e4 c | e8. f16 e2 | e8. f16 e8. d16 cis8. d16 | d8. a16 d2 |
    b='8. c16 c2 | e8. c16 a4. c8 | b8. a16 b8. c16 b8. e,16 |
    \alternative {
      \volta 1 { e'=''2. | }
      \volta 2 { a,='4 a'=''2 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! am | b e@7! e74 | a a7! a7 | d dm! dm |
  e=4 e7!( d) | c a@m! am4 | e e7! e7 | gis,8. a16 gis4 e@7! | a4 am! a=, |
}
{{ end }}
