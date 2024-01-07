{{ define "rh1" }}
  {{ .a }} c-. a-.-> r | c=''-. c-. a-.-> r |
  bes='8-.->\< bes-. a-. \af 8\! g='-. |
{{ end }}

{{ define "rh2" }}
  \rep 2 { g='8-.\< g-. \af 8\! c=''-. r | } | d-. d-. a-. b='-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r f-.-> r | a-. r f-.-> r | c-.-> r d-. e='-. |
{{ end }}

{{ define "lh2" }}
  \rep 2 { f='4( e='8)-. r | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `c''=''8-.\mf`) }} | a-. d-. c-.-> r |
    {{ template "rh1" (w `c=''8-.`) }} | f-. a-. f='-.-> r \fine \bar "||"

    \volta 2
    {{ template "rh2" }} | c( a g) r | {{ template "rh2" }} |
    c=''8-. c-. c=''-. r \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  {{ template "lh1" (w `a'='8-.-\frBass`) }} | f-. r e-.-> r |
  {{ template "lh1" (w `a='8-.`) }} | f-. c-. f='-.-> r |

  {{ template "lh2" }} | f-. r g-. r | e-. r r4 |
  {{ template "lh2" }} | f4( g8 f | e)-. g-. e='-. r |
}
{{ end }}
