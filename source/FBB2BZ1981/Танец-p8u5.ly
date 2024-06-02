{{ define "rh1" }}
  {{ .a }} b-. c-. b]-. | d16( c b a b8)-. e,='-. |
{{ end }}

{{ define "rh2" }}
  a='8[-. b-. c-. e]-. | dis16( c b a <gis=' e'>4)-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `a'='8[-.\mf`) }}
    {{ template "rh2" }}
    {{ template "rh1" (w `a='8[-.`) }}
    a='16( b c b d c b a | e'8)-. e,-. a='4-- |
    a='8[-.\f b-. c-. e]-. | dis16( c b a b8)-. e,-. |
    {{ template "rh2" }}
    {{ template "rh1" (w `a='8[-.\p`) }}
    a='16( b c b d c b a | <gis e'>8)-. e-. a='4 \fine \bar "||"

    \volta 2
    <e=' c'>8\f 4 b'8 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
