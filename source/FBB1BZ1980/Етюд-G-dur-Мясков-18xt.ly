{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key g \major
  \time 4/4
  d''=''8->\mf b-. r4 b8-> g-. r4 |
  e='8->\< fis-. g-. \af 16.\! b-. r4\> \af 4\! r |
  e=''8-> c-. r4 c8-> a-. r4 |
  d,='8->\< fis-. a-. \af 16.\! c-. r4\> \af 4\! r |
  \rep 2 { a='8-> g='-. r4 } | \rep 2 { f='8-> e='-. r4 } |
  d'=''8-> b-. r4 b8-> g-. r4 |
  e='8-> g-. fis[-> a]-. g[-> d']-. g=''-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  r4 g'='8-.-\frBass fis-. r4 e8-. d-. | r4 r d'8-> c-. a-. fis-. |
  r4 b='8-. a-. r4 g8-. fis-. | r4 r e'8-> d-. b-. g-. |
  r4 e'=''8-. d-. r4 d8-. c-. | r4 c8-. b-. r4 b8-. a-. |
  r4 g='8-. fis-. r4 e8-. d-. | c-> r d-> r b-> r g=8-> r |
}
{{ end }}
