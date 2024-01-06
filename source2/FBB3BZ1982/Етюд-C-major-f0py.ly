{{ define "rh1" }}
  {{ .a }} 8 8 <d f>4 8 | <e g>8 8 8 <f=' a>4 8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 6/8
  {{ template "rh1" (w `<c'=' e>8\p`) }}
  <g=' b>8 8 8 <a c>4 <f a>8 | <e g>4.~ 4 8 |
  <d=' f>8 8 8 <e g>4 <d f>8 | <c e>8 8 8 <e g>4 <c e>8 |
  <b= d>8(\< g' b <a c> <g b> \af 8\! <fis a> | <b d>4.\> <b, g'>4 \af 8\! f'8 |
  {{ template "rh1" (w `<c=' e>8)`) }}
  <g=' b>8 8 8 <a c>4 <b d>8 | <g=' e'>4.~\< 4 \af 8\! 8 |

  <g=' g'>8(\mf <f f'> <e e'> <f d'>4 8) | <f f'>( <e e'> <d d'> <e c'>4 8) |
  \duo {
    s4. b'='8( a g | <e g c>4.)\< \stemDown <g c e>4 \af 8\! <g=' e' g>8 |
  } { \stemUp <c'=' e'>8( <d d'> <e c'> \stemDown f='4.) | s2. | }
  <g'='' bes>8(\f <f a> <e g> <d f>4 8) | <f aes>( <e g> <d f> <c e>4 8) |
  \duo { e''=''8( d a e' a, e' | <e,=' g c>4.~ 4.) | }
  { fis'='4. f | s4. \acc { fis,= 8 } \af 4.\! g=4.\> | } R2.\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c,=,4.(-\frBass c'8) r r | \rep 2 { c,=,4.( c'8) r r | }
  b=,8 b b c4 a8 | b r r g r r | c r r c r r | d r r d4.( |
  g=8) g( fis f e d | c) \rep 3 { r r c,=,4.( | c'8) } c c e4 d=8 |

  \duo { bes=4. a | aes g | fis g= | }
  { cis=4. d8( e d) | c4. e8( d c) | d4. g,=, | }
  c=4 b8 bes4. | a8( b cis d e d) | f,( c'~ <c aes'>) c( g'~ <g e'>) |
  d=4.( g, | c~ c) | c,=,8 r r r4. |
}
{{ end }}
