{{ define "vocal" }}
\relative {
  \tempo Moderato
  \clef treble
  \key ees \major
  \time 4/4
  \rep 2 { R1 | }
  \meter 1/8 1,1,1,1,1,1,1,1
  \repeat volta 2 {
    ees'='8\mf ees ees g aes g f4 | bes8 f g aes g4 g |
    c=''8 g aes bes aes g f4 | f8 aes g f ees4 ees=' |
    \rep 2 { R1 | }
  }
}
{{ end }}

{{ define "rightHand" }}
\relative {
  \clef treble
  \key ees \major
  ees''=''8(\mf ees ees g aes g f4) | bes8( f g aes <aes, d f>4 <g ees'>) |
  \repeat volta 2 {
    ees='8(\mp ees ees g aes g f4) | bes8( f g aes) <ees g>4( <b f' g>) |
    c'=''8( g aes bes aes g f4) | f8( aes g f ees4 ees) |
    c''='''8(\f g aes bes aes g f4) | f8( aes g f) ees4 ees='' |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key ees \major
  ees=4(-\stBass eesM!) bes( bes7!) | bes( bes7!) bes( ees) |
  ees=4_\aSim eesM! bes bes7! | bes bes7! ees( des) |
  \rep 2 { c=4 c7! f fm! | bes,=, bes7! ees+eesM!2 | }
}
{{ end }}
