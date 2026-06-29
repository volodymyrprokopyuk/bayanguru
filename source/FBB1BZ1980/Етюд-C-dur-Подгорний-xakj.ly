{{ define "rh1" }}
  {{ .a }} fis g fis g fis g a) | f( e f e f e f g) |
  e=''8( dis e dis e dis e f) | d( cis d cis d e f fis='') |
{{ end }}

{{ define "rh2" }}
  <e='' c'>4-- <dis b'>-- <c='' a'>2-- |
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
  \clef bass
  \key c \major
}
{{ end }}
