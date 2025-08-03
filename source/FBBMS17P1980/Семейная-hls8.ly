{{ define "rh1" }}
  {{ .a }} c16 f e d c | e8. f16 e8) c16[(\< a] |
  f'=''8 e16 \af 32\! d c8\> d | \af 4.\! a4.) <a=' d>8\pp |
{{ end }}

{{ define "rh2" }}
  <a=' c>8 8 <g b>8 8 | {{ .a }} |
  <f=' d'>8.(\p c'16 b8) <f a>( | <e c'>8. b'16 a8)\< a |
  f'=''16( e d \af 32\! c d8)\> d='' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} c16 f e d c | e8. f16 e8) \noBeam a,( | d, e16 f <e g>8 <f a> |
  a=4.) f=8 |
{{ end }}

{{ define "lh2" }}
  a=8 a e e | {{ .a }} | d4. d8( | a8. b16 c8) a |
  d=8. <e g>16( <f a>8) <g= b> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 2/4
  {{ template "rh1" (w `d''=''8.(\p`) }}
  {{ template "rh2" (w ` \duo { \af 2\! a'='2\< | } { a'='4.( g='8) | }`) }}
  \af 4.\! a='2\pp \fermata |

  {{ template "rh1" (w `d=''8.(\p`) }}
  {{ template "rh2" (w ` \duo { a'='4\< \af 4\! a=' | } { s4 a'='8( g='8) | }`) }}
  \af 4.\! a='4. <a d>8\pp | <a c>8 8 <g b>8 8 |
  \duo { \af 2\! a'='2\< | } { a'='4.( g='8) | }
  <f=' d'>8.(\p c'16 b8) <f a>( | <e c'>8.^\tRit_\dDim b'16 a8) a |
  f'=''16( e d <g, c> <a d>8) <b d> | a='2\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `d'='8.(-\frBass`) }}
  {{ template "lh2" (w `f=4.( e8)`) }} | a=2 \fermata |

  {{ template "lh1" (w `d='8.(`) }}
  {{ template "lh2" (w `f=4 f8( e)`) }} | a=4. f8 |
  {{ template "lh2" (w `f=4.( e8)`) }} | <a,=, a'>2 \fermata |
}
{{ end }}
