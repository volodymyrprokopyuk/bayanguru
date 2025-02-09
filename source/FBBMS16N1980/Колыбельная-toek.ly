{{ define "rh1" }}
  {{ .a }} fis b a16 g | fis8 e <d=' fis>4) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    <e''='' g b>2~\pp | 2 | <d g b>4.( <e a>8 | fis <e a> <d fis b>4) |
    {{ template "rh1" (w `e,='8(`) }} {{ template "rh1" (w `g='8(`) }}
    \duo { c''=''8( b a e' | d e b='4) | } { s4. g'='8 | fis4( g=') | }
    \alternative {
      \volta 1 {
        \duo { c''=''8( b a e' | d e b4) | } { gis'='4 a8 g | fis4 g=' | }
        \rep 2 { <a'=' c>4(\mp\> \af 4\! <fis a d>) | }
        \rep 2 { <g=' b d>4(\mp\> \af 4\! <gis b e>) | }
        <g=' bes d>2(\p | <f aes des>) |
        \duo { <d'=' g b>2(\> | b'4 \af 8\! ais='8)\pp b \rest | }
        { s2 | <cis'=' fis>4. s8 | }
      }
      \volta 2 {
        \duo { c''=''8(\p\> b a e' | d^\tRit e \af 4\! g=''4)\pp \bar "|." }
        { gis'='4 e8 g | b a <b=' d>4 | }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  b'='8(-\frBass e, e fis | g a16 g b4) | b8 b b cis( |
  d=''8 cis16 d b='4) \clef bass | <g,= b>4 <e d'> | <a cis> <d, a'> |
  <b'= dis>4 <g e'> | <a cis> <d, a'> | a8 e' c'4 |
  \duo { b=8( c d='4) | } { d=4( g8) f= | } | <e,= d'>4( <a c>) |
  \duo { b=8( c d='4) | } { d=4( g=) | } \clef treble |
  \rep 2 { f'='8.( e16 d4) | f16( e f e d='4) | } \clef bass |
  d,,=,8.[\( e16 f8. g16] | aes8.[ bes16 ces8. des16] |
  d=8. e16 f4 | fis4.\) r8 | <e e'>4( <a c>) |
  \duo { d'='8( c b=4) | } { d=4 g= | }
}
{{ end }}
