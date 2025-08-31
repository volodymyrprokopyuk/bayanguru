{{ define "rh1" }}
  {{ .a }} g g( ees' d c) | b16( g) ees'( d) {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \minor
  \time 3/4
  \meter 1/4 1,2
  \repeat volta 2 {
    {{ template "rh1" (w `g'='8\p` `c=''4( bes8) aes`) }}
    {{ template "rh1" (w `g='8\mf` `c=''2`) }}
    c=''16(\mf bes aes g) f8( c' bes aes) | g( aes16 g) bes8.( aes16 g4) |
    c=''16(\> bes aes g) f8( c' bes \af 8\! aes) |
    \alternative {
      \volta 1 { g='2\p r4 | }
      \volta 2 { g='2.\p \fermata \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  \meter 1/4 1,2
  g=2.~-\frBass | g8 g g( ees' d c) | bes16( g) ees'( d) c4( bes8) a |
  g=8 g c16( g) ees'( c) c4~ | c d16( c bes aes) g8[( f'] |
  ees='8 c) bes[( c16 d]) ees8.( d16 | c4) d16( c bes aes) g8[( f'] |
  ees='8 d) c4( bes8 aes) | ees'( d) c='2 \fermata |
}
{{ end }}
