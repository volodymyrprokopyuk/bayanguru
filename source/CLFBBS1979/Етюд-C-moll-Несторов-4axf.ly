{{ define "rh1" }}
  {{ .a }} g'-- | fis8( g aes g f ees d c) | b2-- f'-- |
  ees='8( f g f ees d c='4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} g'-- | fis8( g aes g f ees d c | b2 c=) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 4/4
  {{ template "rh1" (w `c'='2--\mf`) }} | \af 1\! R1\< | ees2-- bes'-- |
  aes='8( bes c bes aes g f ees | bes2 ees4)\> \af 4\! r |

  {{ template "rh1" (w `c='2--`) }} | r2 c='2-> |
  g'='2-> fis8( g aes g | f4 ees) d2--^\tRit | c='1 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  R1 | {{ template "lh1" (w `c=2---\frBass`) }}
  ees=2-- bes'-- | a8( bes c bes aes g f ees) |
  f=2 bes | g8( aes bes aes g f ees d | c=4) r r2 |

  {{ template "lh1" (w `c=2`) }}
  g'=2 fis8( g aes g | f ees d c) d2-- | g-- g,-- | c=1 |
}
{{ end }}
