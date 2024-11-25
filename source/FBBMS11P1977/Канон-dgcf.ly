{{ define "rh1" }}
  {{ .a }} bes d ees4 \af 8\! d8 | c_\aDol a bes c4) g8( |
  fis='8-- ees' ees d4 c8 | bes\> c a {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} bes \af 8\! d | ees4 d8 c a bes |
  c='4) g8( fis-- ees' ees | d4 c8 bes\> c \af 8\! a | {{ .b }} %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 6/8
  {{ template "rh1" (w `g'='8(\p\<` ` \af 4.\! g='4.)`) }}
  g='8(\mp\< bes d g4 \af 8\! f8 | f ees d f4.) |
  f,='8(\< a c f4 \af 8\! ees8 | ees d c ees4) a,8( |
  a='8-- bes c fis,) r d\( | d--\< e fis fis g a |
  a='8 bes c c d \af 8\! ees | ees4 a,8 c4 fis,8 | fis4 d8 d'=''4.\) |

  R2. | {{ template "rh1" (w `g,='8(\mf\<` `g='4 \af 8\! r8)`) }}
  d'=''4.(\p g~ | g='') r4 r8 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  r4 r8 {{ template "lh1" (w `g=8(\<` `g=4.)`) }} g=8(\< bes \af 8\! d |
  g='4 f8 f ees d | f4.) f,=8(\< a \af 8\! c | f4 ees8 ees d c |
  ees='4) a,8( a-- bes c | fis,) r d\( d-- e fis |
  fis=8 g a a bes c | c d ees ees4 a,8 | c4 fis,8 a4 d,=8 |

  d'='4.\) {{ template "lh1" (w `g,=8(\<` `g=4) r8`) }} \af 4.\! d'='4.(\> |
  g='2.) | R2. \fermata |
}
{{ end }}
