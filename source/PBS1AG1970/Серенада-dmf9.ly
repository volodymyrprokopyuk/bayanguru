{{ define "rightHand" }}
\relative {
  \tempo "Andantino cantabile"
  \clef treble
  \key a \minor
  \time 6/8
  \repeat segno 2 {
    \volta 1
    \partial 4 { c''=''8\p d | }
    e=''4.~ e8 c f | e4.~ e8 b e, | d'4.( c4) d8 | e4.~ e8 c a |
    f'=''4.(\< f8 b, \af 8\! g) | e'4.( e8 c a) | d4.(\> c4 \af 8\! b8) |
    a='4. a='8 \fine \bar "!!"

    \volta 2
    g='8--\mf a-- | g4.( d'8 b a) | g4.(_\dCre e'8 c a) |
    g='4.( f'8 d b) | c4.~ c8\> b \af 8\! a | g4.(\p d'8 b a) |
    g='4.( e'8 c a) | g4.(\< f'8 c \af 8\! b) |
    e=''4. <gis,=' e'>8\p \fermata \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
