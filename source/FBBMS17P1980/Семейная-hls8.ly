{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 2/4
  c''=''8.(\p c16 f16 e d c | e8. f16 e8) c16(\< a |
  f'=''8 e16 \af 32\! d c8\> d | \af 4.\! a4.) <a d>8\pp |
  <a=' c>8 8 <g b>8 8 | \duo { \af 2\! a'='2\< | } { a'='4.( g='8) | }
  <f=' d'>8.(\p c'16 b8) <f a>( | <e c'>8. b'16 a8)\< a |
  f'=''16( e d \af 32\! c d8)\> d | \af 4.\! a='2\pp \fermata |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
