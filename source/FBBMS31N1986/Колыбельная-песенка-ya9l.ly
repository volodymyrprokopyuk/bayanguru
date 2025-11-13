{{ define "rh1" }}
  {{ .a }} d4 c8 | a'4 c8 g4.) | e8(\< g c e4 \af 8\! e8) |
  e=''4(\> d8 \af 4.\! c=''4.) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 6/8
  {{ template "rh1" (w `e'='4.(\p`) }}
  {{ template "rh1" (w `e,='4.(`) }}
  r4\mp c=''8\( g'4 e8 | c4.~ c8 b a | g4.\< \af 4.\! a4. |
  g='4.\> \af 4.\! c4.\) |
  {{ template "rh1" (w `e,='4.(`) }}
  {{ template "rh1" (w `e,='4.(\p`) }}
  e,='4.(\pp d4 c8 | a'4 c8 g4.) | e8(\< g c e4 \af 8\! e8) |
  <g,=' e'>4.\>^\tRit \af 4.\! <f d'>4. | <e=' c'>2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \rep 4 { R2. | }
  c'='4.(-\frBass g | e d) | c2. | g'4.( c) | e,( d4 c8 | a'4 c8 g4.) |
  e=8( g c e4 e8) | e4( d8 c4.) | c8( b a g4.) | f4.(~ f8 e d |
  c=4.) d8( e f | g a b c) e,( f | <c g'>2.) | <c f g>4. <c e g> |
  <f= a>2. | <e b'>4. <a c> | <g b> <f a> | <e g> <d f> | <c g'>2. |
  <f= a>4. <g a> | c='2. |
}
{{ end }}
