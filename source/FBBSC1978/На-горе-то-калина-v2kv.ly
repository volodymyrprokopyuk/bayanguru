{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 4/4
  a'='2(\f c) | g4( bes a g | f) f f2 | a2(\f c) | g4( bes a g | f) f f2 |
  d='2(\p g) | c,4( c a' g | f) f f2 | d4(\p d g f |
  e='4 c a'\> g | f)^\tRit f \af 2\! f='2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  f'='1(-\frBass | c | f) | f( | c | f) | \rep 2 { bes,=1( | c | f=') | }
}
{{ end }}
