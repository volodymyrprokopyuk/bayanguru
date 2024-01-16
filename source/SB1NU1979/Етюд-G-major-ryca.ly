{{ define "lh1" }}
  {{ .a }} r gM! r | g r gM! r | fis r d@7! r8 | g=, r gM! r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    g'='16(\p a b c d\< c b \af 16\! a | g8[)-. g-. g-. g]-. |
    a='8[-. a-. a-. a]-. | b16(\> c b a \af 4\! g4) |
    d'=''16( c b c d\< c b \af 16\! a | g8[)-. g-. g-. g]-. |
    a='8-. a-. a16( c b a | g8)-.\> b-. \af 8.\! g='4 |
  }
  \repeat volta 2 {
    c=''16(\f a b c d c b a | b8[ d b g]) |
    c=''16( a b c d c b a | b8[\> d b \af 8\! g]) |
    b='16( c b c d\< c b \af 16\! a | g8[)-. g-. g-. g]-. |
    a='16( b a b a\> c b a | g8)-. g-. \af 8.\! g='4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }}
  {{ template "lh1" (w `g=,8`) }}
  \rep 2 { fis=,8 r d@7! r8 | g=, r gM! r | }
  \rep 2 { g=,8 r gM! r | } d' r d7! r | g,=, r gM! r |
}
{{ end }}
