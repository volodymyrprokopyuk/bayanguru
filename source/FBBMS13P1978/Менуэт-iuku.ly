{{ define "rh1a" }}
  g='8)-. g]-. d[( | a')-. a]-. d,[( |
  b'='8])-. b16[-.\< a-. b-. \af 16\! c]-. |
  d=''4 e8[(-> | c)-. c]-. d[(-> | b)-. b=']-. %
{{ end }}

{{ define "rh1b" }}
  d='4 d8~-> | d4 d8[~-> | d] r4 | r4 \rep 2 { g='8~-> | g='4 } %
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
      \partial 8 { d'='8[(\f | }
      {{ template "rh1a" }}
      c=''8[(-> | a])-. a16[-. b-. a-. g]-. | fis='4 d8[( |
      {{ template "rh1a" }}
      c=''8[(-> | b^\tRit g])-. a( | g='4) \fine \bar "!!" %
    } {
      \partial 8 { d'='8~-> | }
      {{ template "rh1b" }} d='8~-> | d4.~ | d='4 d8~-> |
      {{ template "rh1b" }} g='8~-> | g4 e16( fis | g='4) %
    }

    \volta 2
    \duo {
      d'='8[(^\tATem | a'])-. a16-.\< g-. a-. \af 16\! b-. |
      c=''4 d,8[( | b'])-. b16-.\< a-. b-. \af 16\! c-. |
      d=''4 g,8( | g')-.\f\> g-. e-. |
      \af 8\! d=''4 e,8( | e')-.\f\> e-. c-. |
      \af 8\! b='4 e,8[(\p | <a c>8)-. 8]-. e[( | <g b>8)-. 8]-. e[( |
      <fis=' a>8)-.^\tRit 8]-. <fis=' ais> |
    } {
      \rep 2 { d'='8[(-> | d=']) r4 | r } g='8~-> |
      g='4.~ | g4 e8~-> | e4.~ | e4 \rep 3 { e='8~-- | e='4 } e8 |
    } | <dis'=' fis b>4 \fermata \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
