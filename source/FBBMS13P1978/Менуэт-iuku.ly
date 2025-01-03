{{ define "rh1a" }}
  g='8)-. g]-. d[( | a')-. a]-. d,[( |
  b'='8])-. b16[-.\< a-. b-. \af 16\! c]-. |
  d=''4 e8[(-> | c)-. c]-. d[(-> | b)-. b=']-. %
{{ end }}

{{ define "rh1b" }}
  d='4 d8~-> | d4 d8[~-> | d] r4 | r4 \rep 2 { g='8~-> | g='4 } %
{{ end }}

{{ define "lh1" }}
  {{ .a }} r r | <fis c'>-. r r | g-. g16[-. fis-. g-. a]-. |
  b=4 c8[(-> | a)-. a]-. b[(-> | g)-. g=]-. %
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
  \partial 8 { r8 | }
  {{ template "lh1" (w `b=8-.-\frBass`) }} a=8[(-> |
  fis=8])-. fis16-. g-. fis-. e-. | d=4 r8 |
  {{ template "lh1" (w `b'=8-.`) }} e'='8[(-> |
  d='8 b])-. <d, c'>( | <g= b>4) r8 |

  fis=8-. fis16[-. e-. fis-. g]-. | a4 r8 |
  g=8-. g16[-. fis-. g-. a]-. | b4 r8 |
  e='8-. e-. c-. | b4 r8 | c8-. c-. a-. | g4 r8 |
  a=4 r8 | b4 r8 | c4 c8 | b=4 \fermata %
}
{{ end }}
