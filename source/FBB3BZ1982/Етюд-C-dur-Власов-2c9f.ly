{{ define "rh1" }}
  {{ .a }} <e g>-- | <c a'>-- <c e>-- |
  <a=' f'>4.-- <a d>-- | <f b>2. | <e c'>4.-- <g=' e'>-- |
{{ end }}

{{ define "lh1" }}
  {{ .a }} e g c g e) | a,( c e a e c=') |
{{ end }}

{{ define "lh2" }}
  a=8( d f a f d) | g,( b d f d b=) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 6/8
  {{ template "rh1" (w `<e''='' c'>4.--\mf`) }}
  <c='' a'>4.-- <c='' e>-- | \duo { d''=''2.~ | d='' | }
  { <b'=' d>4.-- <a c>-- | <f=' b>2. | }

  {{ template "rh1" (w `<e='' c'>4.--`) }}
  <a=' f'>4.-- <a c>-- | <g e'>-- <a f'>4( <b d>8 | <e,=' c'>2.) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `c'='8(-\frBass`) }} {{ template "lh2" }}
  {{ template "lh1" (w `c='8(`) }} | d='8( g b d, fis a | g a g f e d=') |

  {{ template "lh1" (w `c='8(`) }} {{ template "lh2" }}
  c='8( e g bes g e) | c( d f a f d) | g,( c e g, b f' | c e g c=''4.) |
}
{{ end }}
