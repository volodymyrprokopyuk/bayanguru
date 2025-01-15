{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  <c''='' e g>8->\mf <c f a> \rep 3 { <c='' e g>8-> <c='' f a> } \bar "||"
  \repeat segno 2 {
    \volta 1
    e=''8-> e16( g c,8)-> e16( g | d8)-> d16( f e-> d c8) |
    e=''8-> e16( g c,8)-> e16( g | f-> e d e c d e f |
    e=''8)-> e16( g c,8)-> e16( g | d8)-> d16( f e d c8) |
    e=''8-> e16( g c,8)-> c16( a=' \bar "||"

    \volta 2
    d=''16 c b g c8)-- c16( b | a8)-> <c e>-. b8-> <d e>16 16 |
    a='8-> c-. <gis b>-> e16 e | <fis a>8-> <gis b>16 16 <a c>8-. <b d>-. |
    <c='' e>8-> <d f>16 16 <c e>8-. <b d>-. |
    a='8-> <c e>16 16 b8-> <d e>16 16 | a16(-> c b a <gis b>8)-> e16 e |
    <fis=' a>8-> 16( b <gis a>8)-> <a c>16( d |
    <c='' e>8)-> 16( f <a, e'>8)-> <b d>( \bar "||"

    d=''16 c b g c=''8)-- r \bar "|."
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
}
{{ end }}
