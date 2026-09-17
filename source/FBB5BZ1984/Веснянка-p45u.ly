{{ define "rh1" }}
  {{ .a }} fis' fis e d16 cis b8) | b( fis' fis e d16 cis b8) |
  cis=''8( cis cis e d16 cis b8) | cis(\> cis cis e d16 cis \af 8\! b='8) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} a' fis a fis a e a fis a d, a'='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key b \minor
  \time 3/4
  {{ template "rh1" (w `b'='8(\p`) }}
  {{ template "rh1" (w `b='8(\mf`) }}

  {{ template "rh2" (w `d=''16\f`) }}
  {{ template "rh2" (w `d,=''16`) }}
  a,='16\< a' ais, a' b, a' cis, \af 32.\! a' d,(\> fis a \af 16\! d) |
  fis,,='16\< fis' g, fis' gis, fis' ais, \af 32.\! fis' b,(\> d fis \af 16\! b='') |

  b,='8(\mf <d fis>8 8 <cis e> <b d>16 <ais cis> b8) |
  b='8( <d fis>8 8 <cis e> <b d>16 <fis cis'> <d b'>8) |
  cis='16( a cis e fis g a g fis a d fis='') |
  \duo { cis''=''8(\> cis4 e8 d16 cis \af 8\! b='8) | }
  { r16 cis'='16[ e8 fis e] d='4 | }

  b,='8(\p fis' fis e d16 cis b8) | b( fis' fis e d16 cis b8) |
  cis=''8( cis cis e d16 cis b8) |
  cis=''8(\> cis cis^\tRit e d16 fis \af 8\! <b,=' fis' b>8) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key b \minor
  R2. | a'='4(-\frBass g fis) | e( fis eis) | e( fis~ <b, fis'>) |
  b=16( d fis a gis a gis g fis e d cis) |
  b=16( d fis b ais a gis g fis e d b=) |
  \duo { r8 <cis'=' e>4 8 e16 fis g8 | r <e g>4 8 e[( d=']) | }
  { a=2 b4 | a2 gis16 ais b=8 | }

  \rep 2 { d='8( a') a-. g-. fis16( e d='8) | }
  a=8-. a-. a(-> b16 cis d8) fis='-. \clef bass |
  fis,=8-. fis-. fis(-> gis16 ais b8) b-. |
  b=4.( a16 g fis8 b,) | d16( e fis8 b a16 g fis8 b,) |
  a=,8( e' a[ cis] d d,) | a16( e' g b ais4 b=) |

  \duo {
    <d'=' fis>2. | <b~ e>2 <b d>4 | r8 <b e>4 8 r <d fis> |
    r8 <b= g'>8 r <ais fis'> r <d=' fis>8 \fermata |
  } { b=4 ais a | gis g fis | g2 a4 | e fis b= \fermata | }
}
{{ end }}
