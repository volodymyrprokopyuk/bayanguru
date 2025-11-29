{{ define "rh1" }}
  {{ .a }} d-. d-. | d16[( c b a] g8) | c16( d e4) | e8( d=''4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/8
  \repeat volta 2 {
    {{ template "rh1" (w `d''=''8-.\p`) }}
    {{ template "rh1" (w `d=''8-.`) }}
    c=''16[( b]) a8-. a-. | b16[( a]) g8-. g-. |
    c=''16[( b]) a8-. a-. | b16( a) g4 |
    <g=' c>8(\< b c) | <g d'>4 \af 8\! c8 |
    b='16[(\> c]) b8-. a-. | g-. \af 8\! g='-. r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g=8(-\frBass <b d>8)-. 8-. | g( <b d>8)-. 8-. |
  a=8_\aSim <c d>8 8 | \rep 3 { g=8 <b= d>8 8 | }
  a=8 <c d>8 8 | g <b= d>8 8 \clef treble |
  r8 d='8-. d-. | r <g, d'>8-. 8-. | r <c d>8-. 8-. |
  r8 <b= d>8-. 8-. | e4 r8 | <a,= e'>4 r8 \clef bass |
  d,=8( <fis c'>8)-. 8-. | <g= b>8-. 8-. r |
}
{{ end }}
