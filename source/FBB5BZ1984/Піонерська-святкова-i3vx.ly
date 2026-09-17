{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key c \major
  \time 4/4
  \partial 4 { g'='8-.\f g' | }
  \repeat volta 2 {
    \rep 2 { <c,='' e>4-> g8-. g'=''-. } |
    <f='' a>8(->\> <e g>) <d f> <c e> \af 4\! <g d'>4-- g8-.\f g'-. |
    \rep 2 { <b,=' d>4-> g8-. g'=''-. } |
    <e='' g>8(->\> <d f>)-. <c e>-. <g d'>-. \af 4\! <e c'>4-- c'8(\mp b |
    <f=' a>8\< c' f a) \af 4\! <c, a'>4-- c8( a |
    <e=' g>8\> c' e g) \af 4\! <c, g'>4-- e,8( a |
    <d,=' g>8\< b' d g) <b, g'>-. <c a'>-. <d b'>-. \af 8\! <e c'>-. |
    <fis='' d'>8(-> <e c'>)-. <d b'>-. <c a'>-. \af 4\! <b g'>4-- g8(\p f |
    <e=' g>8\< c' e g) \af 4\! <c, g'>4-- b8( a |
    <d,=' g>8\< b' d g) \af 4\! <b, g'>4-- <a fis'>8-.\f <b g'>-. |
    <c='' a'>8(-> <b g'>)-. <a fis'>-. <g e'>-. <fis d'>-. <e c'>-. <d b'>-. <c=' a'>-. |
    \alternative {
      \volta 1 {  }
      \volta 2 {  }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  <c'=' g'>8(->-\frBass g)-. r4 <c g'>8(-> g)-. r4 |
}
{{ end }}
