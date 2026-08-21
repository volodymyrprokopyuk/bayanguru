{{ define "rh1a" }}
  {{ .a }} a-. b-. c]-. | d16( e d cis d8)-. {{ .b }} |
{{ end }}

{{ define "rh1b" }}
  {{ .a }} c-. d-. e]-. | b'16( c b ais b8)-. {{ .b }} |
{{ end }}

{{ define "rh2b" }}
  a='8[-. fis-. fis-. a] | b16( a b c d8)-. {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \duo {
    \repeat volta 2 {
      {{ template "rh1a" (w `g'='8[-.\mf` `g=''8-.`) }}
      {{ template "rh1a" (w `g,='8[-.` `r8`) }}
    }

    \repeat volta 2 {
      fis=''8[-. a-. d,-. fis]-. | g16( fis g a b8)-. g-. |
      fis=''8[-. a-. d,-. fis]-. |
      \alternative {
        \volta 1 { g=''16( fis g a b=''8)-. r | }
        \volta 2 { g=''16( a g fis g=''8)-. r | }
      }
    }
  } {
    {{ template "rh1b" (w `b=8[-.` `b='8-.`) }}
    {{ template "rh1b" (w `b,=8[-.` `r8`) }}

    {{ template "rh2b" (w `b='8-.`) }}
    {{ template "rh2b" (w `r8`) }}
    b='16( c b a b='8) r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
