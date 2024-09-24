{{ define "rh1" }}
  bes='4\< a8 bes \af 4\! g4 | bes {{ .a }} a8 bes g4 |
  \rep {{ .b }} { bes='4 a8 bes g='4 | }
{{ end }}

{{ define "rh2" }}
  \duo { d''=''2. {{ .a }} | } { bes'='4 a8 bes g='4 | }
{{ end }}

{{ define "rh3" }}
  \duo { d'='8 {{ .a }} \< e fis g a \af 8\! bes | c\> d c4 \af 4\! bes=' | }
  { d'='4 r r | e fis g=' | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 3/4
  bes'='4->\mp a8_\aLeg bes g4 | bes->_\aSim a8 bes g4 |
  bes='4\pp a8 bes g4 | \rep 4 { bes='4 a8 bes g='4 | }
  {{ template "rh1" (w `\p` `2`) }}
  {{ template "rh1" (w `\mp` `3`) }}
  {{ template "rh2" (w `\mf`) }} {{ template "rh2" (w ``) }}
  {{ template "rh2" (w `_ \dCre`) }} {{ template "rh2" (w ``) }}

  \duo { g''=''4\f 4 f8 ees | d4 d c8 bes | c4 c d8 c | g4\> g \af 4\! g=' | }
  { \rep 4 { g'='2. | } } |
  {{ template "rh3" (w `\mf`) }} {{ template "rh3" (w `\pp`) }}
  \duo {
    \rep 4 { bes'='4 a8 bes g='4 | }
    g='2.~\p | g~ | g | d'=''4\pp^\tRit c8[ d] g,='8 %
  } {
    d'='2.\mp | c | f\> | \af 2.\! ees=' | d~ | d~ | d |
    bes'='4 a8[ bes] g=' %
  } r \bar "|."

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  \rep 4 { R2. | } | g'='2.-\frBass | f | ees | d |
  <ees=' g>2. | <d f> | <c ees> | <g= d'> \clef bass |
  \duo {
    c'='2 c4 | d2 d4 | ees2 ees4 | d2 d4 | d2. | e | f4 ees d | g8 f ees='4 r |
  } { ees=2 ees4 | g2 g4 | c2 c4 | \rep 3 { g=2 g=4~ | } g=2 r4 | R2. | }

  \duo {
    d'='2. | d | ees | d | \rep 4 { bes=4 a8 bes g=4 | }
    \rep 2 { g=2.~ | g= | } \rep 3 { bes=4 a8 bes g=4 | }
  } {
    \rep 4 { bes=4 a8 bes g=4 | } \rep 4 { d=2. | }
    f=2. | ees | d | c | g~ | g~ | g=, |
  } R2. |
}
{{ end }}
