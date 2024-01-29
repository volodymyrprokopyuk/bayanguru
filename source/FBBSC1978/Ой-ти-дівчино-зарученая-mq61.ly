{{ define "rh1" }}
  e=''8\( f e | e, gis b | d c b | a4 a='8\) |
{{ end }}

{{ define "rh2a" }}
  s4. | r4 gis='8( | b a gis | a='4.) |
{{ end }}

{{ define "rh2b" }}
  {{ .a }} d c | e,4.~ | e | a=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/8
  e''=''8\(\mf f e | e, gis b | d c b | a c e\) |
  {{ template "rh1" }}

  \repeat volta 2 {
    a'=''8\( g f | g, b d | g f e | a, c e\) |
    {{ template "rh1" }}
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \duo {
    s4. | r4 gis'='8( | b a gis | a4) r8 |
    {{ template "rh2a" }}

    s4. | r4 b='8( | e d c | a4.) |
    {{ template "rh2a" }}
  } {
    c''=''8( d c | e,4.~ | e) | s4. |
    {{ template "rh2b" (w `c'=''8(`) }}

    f'=''8\( e d | g,4.~ | g | a\) |
    {{ template "rh2b" (w `c=''8(`) }}
  }
}
{{ end }}
