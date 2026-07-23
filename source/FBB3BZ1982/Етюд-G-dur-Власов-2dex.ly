{{ define "rh1" }}
  {{ .a }} g16 c e | g fis g fis g e) | d,8.( g16 b d | g fis g fis g d) |
  c=''16( d a' d, c d='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/8
  b'='8.( d16 e d | e d e d e d) | a8.( c16 d c | d c d c d c) |
  g='8.( b16 c b | c b c b c b) | fis8.( a16 b a | b a b a b a) |
  {{ template "rh1" (w `e='8.(`) }}
  a'=''16 d, c d a' d,) | b( d b' d, b d | b' d, b d b' d,) |
  {{ template "rh1" (w `e,='8.(\f`) }}
  a'=''16 c b a g fis) | <b, g'>8-> d-. b'-. | <b,=' g'>-> r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  \duo {
    r8 b'='8 b | r b b | r a a | r a a | r g g | r g g |
    r8 fis='8 fis | r fis fis | r g g | r g g | r b b | r b b |
    r8 c=''8 c | r c c | r b b | r b b | r g g | r g g |
    r8 b='8 b | r b b | r c c | r c c='' |
  } {
    g'='4.-\frBass | d | fis | d | e | b | dis | b | c | e |
    d='4. | g | fis | d | g | d | c | e | d | g | fis | d=' |
  }
  g'='8-> b-. d,-. | g='-> r r |
}
{{ end }}
