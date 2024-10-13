{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 1,1,1
  \duo { c''=''4(\p b c16 b a8) | c4( b8 d c16 b a='8) | }
  { a'='8 e~ e e a e | a e~ e f e='4 | }
  <gis'=' b>8(\< 8 8 \af 16.\! <a c> <gis d'>\> \af 8\! <a c>) |
  <gis=' b>8(\< 8 8 \af 16.\! <a c> <gis d'>\> <a c>16 \af 16\! <b d>) |
  \duo { e''=''4( f8 e d c16 d='') | } { c''=''8 a a4 a=' | }
  <gis=' e'>4(\> \af 2\! a='2) |

  \duo { c''=''4(\mp b c16 b a8) | c4(_\dCre b8 d c16 b a8) | }
  { \rep 2 { a'='8 e~ e e~ e e=' | } } |
  <gis=' b>8(\< 8 8 \af 16.\! <a c> <b d>\> \af 8\! <a c>) |
  \duo { <gis'=' b>8(\< 8 8 \af 16.\! <a c> d c16 b) | e4( f8 e d c16 d='') | }
  { s2 b'='8 a | a4 a='2 | }
  <gis=' e'>4(\> \af 2\! a='2) |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
