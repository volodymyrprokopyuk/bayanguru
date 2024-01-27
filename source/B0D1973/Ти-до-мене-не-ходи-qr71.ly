{{ define "rh1" }}
  {{ .a }} b c b d c b a | b8)-. b-. b4 |
  e=''8-. e-. e16( d c b=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} am! a am | a d@m! a8 d@m | gis8 e@M! e'=8 eM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `a'='16(\mf`) }} | a4) a |
  {{ template "rh1" (w `a='16(`) }} | a4) b |
  \repeat volta 2 {
    c=''8-. c-. g4 | c8-. c-. g4 | c8 c( b a | gis4 e) |
    {{ template "rh1" (w `a='16(`) }}
    \alternative {
      \volta 1 { a='4) b=' | }
      \volta 2 { \hSpace a='4 \sSlur nb #'((wb . 0.7)) ( a'='') \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8-\stBass`) }} | a, am! e' a@m |
  {{ template "lh1" (w `a,=,8`) }} | a+am!4 g+gM! |
  c=8 cM! cM4 | c8 cM cM4 |
  c=8 aM! d dm! | e r e7!4 |
  {{ template "lh1" (w `a,=,8`) }} | a+am!4 g+gM! | a,=, am! |
}
{{ end }}
