{{ define "rh1a" }}
  g='8)-. g]-. d[(-> | a')-. a]-. d,[(-> |
  b'='8])-. b16[-.\< a-. b-. \af 16\! c]-. |
  d=''4 e8[(-> | c)-. c]-. d[(-> | b)-. b=']-. %
{{ end }}

{{ define "rh1b" }}
  d='4 d8~-> | d4 d8~-> | d r4 | r4 g8~-> | g4 g8~-> | g='4 %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/8
  \repeat segno 2 {
    \volta 1
    \duo {
      \partial 8 { d'='8[(->\f | }
      {{ template "rh1a" }} c=''8[(-> | a])-. a16[-. b-. a-. g]-. | fis='4 d8(-> |
      {{ template "rh1a" }} c=''8[(-> | b^\tRit g])-. a( | g='4) \fine \bar "!!" %
    } {
      \partial 8 { d'='8~-> | }
      {{ template "rh1b" }} d='8~-> | d4.~ | d='4 d8~-> |
      {{ template "rh1b" }} g='8~-> | g4 e16( fis | g='4) %
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
