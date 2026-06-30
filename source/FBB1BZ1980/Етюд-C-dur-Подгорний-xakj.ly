{{ define "rh1" }}
  {{ .a }} fis g fis g fis g a) | f( e f e f e f g) |
  e=''8( dis e dis e dis e f) | d( cis d cis d e f fis='') |
{{ end }}

{{ define "rh2" }}
  <e='' c'>4-- <dis b'>-- <c='' a'>2-- |
{{ end }}

{{ define "lh1" }}
  b=4-. g-. \duo { r4 e'='4 | } { c'='2 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  {{ template "rh1" (w `g''=''8(\mf`) }}
  g=''2 g8( fis g a) | f2 f8( e f g) | e2 e8( dis e f) |
  d=''8( e f d) c=''2 |

  {{ template "rh2" }} | <f='' d'>4-- <e c'>-- <dis b'>2-- |
  {{ template "rh2" }} | <dis b'>4-- <c a'>-- <b=' gis'>2-- |

  {{ template "rh1" (w `g'=''8(`) }} | g( fis g fis g fis g a) |
  f=''8( e f e f e f g) | e( dis e dis e dis e f) |
  d=''8( e f d='') \duo { c''=''2 \bar "|." } { r4 <g''='' c>4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  e'='2-\frBass cis | d b | c a | b g | e'8( dis e dis) e4-. cis-. |
  d='8( cis d cis) d4-. b-. | c8( b c b) c4-. a-. | {{ template "lh1" }}
  r2 dis'='8( e dis e) | r2 e8( f e f) | r2 dis8( e dis e) |
  r2 e='8( f e dis) | e4 dis e cis | d cis d b | c b c a |
  b=4 ais b8( c d dis) | e( dis e dis e dis e cis) |
  d='8( cis d cis d cis d b) | c( b c b c b c a) | {{ template "lh1" }} \bar "|."
}
{{ end }}
