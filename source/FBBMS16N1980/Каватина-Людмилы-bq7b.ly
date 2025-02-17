{{ define "rh1" }}
  d=''4( g8)-. b,-. | c4( d8)-. e-. | d8-. a16( b d c b a=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 2/4
  \partial 4 { b'='8-.\p c-. | }
  {{ template "rh1" }} | b='8 g) b-. c-. |
  {{ template "rh1" }} | b='4) g8( a |
  b='4) fis'8( g | fis4) e8( d | cis a') b,( cis | d16 e d cis d fis e g) |
  fis=''8 a4 b,8~ | b8 g'4 e8~ | e8 b4 cis8 | d4 b8-. c-. |
  {{ template "rh1" }} | b='8 g) b-. c-. | d4( g8)-. b,-. |
  c=''8 c'(~ c16 b a g | fis e d c b c a b | g='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 4 { r4 | }
}
{{ end }}
