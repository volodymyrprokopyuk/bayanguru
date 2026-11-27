{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  r8\p c''=''8( gis a | f4 e | e' a,8 c | cis4 d) |
  r8 e=''8(_\dCre f b, | dis[ e] gis, a | c4.^\tRit_\dDim f,8 | b2) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4(-\stBass am!) | gis( e@7!) | a4_\aSim am! | d dm! | f, d@m! |
  e'=4 a@m! | dis4 b@7! | e4 e7! |
}
{{ end }}
