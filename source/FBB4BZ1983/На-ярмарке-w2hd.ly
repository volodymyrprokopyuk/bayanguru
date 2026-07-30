{{ define "lh1" }}
  <c=' e g>4-> 8-. 8-. <c d f>8-. 8-. 4 |
  <c=' d f>8-. 8-. 4-> <g d' f>8-. 8-. <c=' e>4-> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro leggiero"
  \clef treble
  \key c \major
  \time 4/4
  \meter 1/4 1,1,1,1
  <c''='' g'>4-> e8-. g-. f-. e-. d4 | d8-. f-. e(-> f) a,-. b-. c( g) |
  <c='' g'>4-> <c e>8-. <c g'>-. <a f'>-. <a e'>-. <a d>4 |
  <a=' d>8-. <a f'>-. <a e'>(-> f') <f, a>-. <f b>-. <g c>(-> d')\f |
  b='4(\fp e8) e c c b( e,) |
  b'='16(\< a b c d e f \af 16\! g f\> e d c b8 \af 8\! e,) |
  b=4 d8-. a'-. gis-. e-. b'( e,) |
  d='16( cis d e f8) d16(\< e f g a b c d e \af 16\! f) |
  <g,=' c g'>4->\ff <b e>8-. <b g'>-. <c f>16( g' f e d4) |
  <a=' d>8-. <a f'>-. <a e'>(-> f') <f, a>-. <f b>-. <e c'>(-> g) |
  \duo { g''=''4-> e8 g='' } { <bes'=' c>2 } <c f>16( g' f e d4) |
  <a=' d>8-.\< <a f'>-. <a e'>(-> f') %
  <b,=' g'>8-.^\tRit <d b'>-. \af 4\! <e='' c'>4->\ff \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \meter 1/4 1,1,1,1
  <c'=' g'>4->-\frBass 8-. 8-. <c d f>8-. 8-. 4 |
  <c=' d f>8-. 8-. <g d' f>4-> 8-. 8-. <c=' e>4 |
  {{ template "lh1" }}
  <f=' a>2( <e gis>) | <f a>2~ 8 8 <e gis>4 |
  <f=' a>2( <e gis>) | <f a>4 \rep 3 { r8 <f=' a>8 } |
  {{ template "lh1" }}
  <c=' e g>8-. 8-. 8-. 8-. <c d f>8-. 8-. 8-. 8-. |
  <c=' d f>8-. 8-. 4-> <g d' f>8-. 8-. <c=' g'>4-> |
}
{{ end }}
