{{ define "rh1" }}
  {{ .a }} fis e c d e8~ | e16 b a g fis g a8~ | a16 g fis e fis8-. b,=-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e' d c <f, b> c' d=''8) |
{{ end }}

{{ define "rh3" }}
  {{ .a }} b16(-. b-. b8)-> <e='' b'>8-. |
{{ end }}

{{ define "lh1" }}
  e=8-. <g b e>-. <a c e>4 | b,8-. a'-. dis,-. a'=-. |
{{ end }}

{{ define "lh2" }}
  \rep 2 { {{ .a }} g' aes f= | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Scherzando
  \clef treble
  \key e \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "rh1" (w `b'='16\p g'_\aLeg`) }}
      <dis=' b'>8[-. b-. <dis b'>-. b]-. |
      {{ template "rh1" (w `b'='16 g'`) }}
      <dis=' b'>8-. b-. e='4 \fine %
    }

    \volta 2
    {{ template "rh2" (w `g='16(\f`) }}
    {{ template "rh2" (w `g,='16(`) }}
    g,='16( b c d e8)-. b-. | c16( b a gis) a8 g |
    \rep 2 { {{ template "rh2" (w `g='16(`) }} | }
    e=''16( dis e fis g fis g a) |
    {{ template "rh3" (w `<dis,='' b'>8-.\ff`) }}
    {{ template "rh3" (w `<dis='' b'>8-.`) }}
    <dis='' b'>8-. b16 b b_\dDim b b b |
    b='16\> b b b \rep 2 { b='16 b b b=' } b^\tRit b b \af 16\! b=' \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \meter 1/2 #'(1)
  e=8-.-\frBass <g b e>-. <a c e>4 |
  {{ template "lh1" }} | fis=8-. a-. b,-. a'-. | e8-. <g b e>-. <a c e>4 |
  {{ template "lh1" }} | b,=,8-. a'-. <e= g>4 |
  {{ template "lh2" (w `c=8`) }} | c=8( g' b,) <gis' d'> | a <c e> <b f'>4 |
  {{ template "lh2" (w `c,=8`) }} | g=8 c, ais' c, | b-. r r <b' g'>-. |
  <b= fis'>8-. r r <b g'>-. | <b= fis'>8-. r \clef treble <fis'=' a>4( |
  <e=' g>4 <b fis'>) | R2 \clef bass |
}
{{ end }}
