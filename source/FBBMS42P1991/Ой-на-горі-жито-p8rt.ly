{{ define "rh1" }}
  {{ .a }} a) b-. c]-. d[(-> e) d-. c=''']-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 4/4
  \meter 1/4 1,1,1,1
  \partial 2 { <g= d' b'>4\f \fermata <fis= c' a'> \fermata | }
  \tempo Allegro
  r8\> <g'=' b d>[ r <a c d> r <g b d> r \af 8\! <a c d>] |
  g='8->\mf g b c d4. c8 | b-> b a4 g='2 |
  \duo {
    g'='8 g b c d4.( a8) | b b a4 g2 | \rep 2 { b='8( d) a a b b c( a=') | }
    b='8 c d4 r4 <b g'> | <g b>4\> <fis a>8 8 \af 2\! g='2 |
  } {
    s4 f'='4 e2 | g8 g d c b2 | g'4 fis8 e d d ees4 | d8 e fis e d f e4 |
    g='8 fis e4 g2 | cis,4 c b=2 |
  }

  \tempo Sostenuto
  {{ template "rh1" (w `g'=''8[(->\p`) }}
  b=''16(->  c d8)-. a16(-> b c8)-. g16(-> fis a8)-. e(-> d)-. |
  {{ template "rh1" (w `g=''8[(->`) }}
  b=''8(-> d) a-. d-. g,-> fis16 e d c b a |
  b='16 ais b d ais d fis, d' f,(-> e) d f e(-> d c8) |
  b=8-> b16 d c d a d g, gis a b c d e fis |
  g='16 fis e d e f fis a b a b d c d e fis |
  g=''16 a b c <fis, b d>4 <d='' g b>2 |
  \tempo Adagio
  <c,=' e g b>4->\f <c fis c' d>8 8 <d=' g b g'>2 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/4 1,1,1,1
  g,=,4-\frBass \fermata d' \fermata | \rep 2 { g=4-. d-. g-. d=-. | }
  g=4 c,8 d g[(-> fis) e-. d]-. | g4-. d-. c8( b a4) |
  d=4-> fis e8-. e-. d4-- | g-. d-. g-. c,-. |
  e=4 d8 c b g a c | d4 e8 d g( fis e4) | a,8 a d d g,=,2 \clef treble |

  <b''=' d>8[_\aSta 8 8 <a c>] <b d>8[ 8  <c e>8 8] |
  <b=' d>8 8 <c d>8 8 <c ees>8 8 <c d>8 8 |
  g='8[(-> fis) f-. e]-. d[(-> c) b-. a=]-. \clef bass |
  g=8 g fis fis e e fis fis |
  g=8 <b d> b <c=' d> \duo { aes=8( b) } { aes=4 } g=8 <aes c> |
  g=8 <b d> a <c d> g fis e <c' e> | b, <b' d> fis <c' d> g <b d> a <c e> |
  d,=8 <g b> d <fis c'> \duo { <g= b>2 | } { r4 g,=,4 | }
  c=4-> a8-- d-- g,=,2 \fermata |
}
{{ end }}
