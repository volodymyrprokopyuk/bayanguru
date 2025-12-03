{{ define "rh1" }}
  {{ .a }} d16 e f g a {{ .b }} b | c8)-. g-. e-. c=''-. |
{{ end }}

{{ define "rh2" }}
  {{ .a }} g fis g e g fis g='' |
{{ end }}

{{ define "rh3" }}
  d=''8-. d-. d( g)-. | c,-. c-. c=''4-- |
{{ end }}

{{ define "lh1" }}
  c+cM!4 r | R2 | g+gM!4-. g+gM-. | c+cM!8-. c+cM-. c+cM4-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Presto
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `c''=''8(\mf\<` ` \af 16\!`) }}
  d=''8( g)-. e( g)-. | d-. d-. d4-- |
  {{ template "rh1" (w `c=''8(` ``) }} {{ template "rh3" }}

  {{ template "rh2" (w `d=''16(\p`) }}
  {{ template "rh2" (w `d=''16_\dCre`) }}
  {{ template "rh2" (w `d=''16`) }} | d8)-. d-. d4-- |
  {{ template "rh1" (w `c=''8(\mf\<` ` \af 16\!`) }}
  {{ template "rh3" }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c+cM!4-\stBass r | R2 | g+gM!4-. g+c@M!-. |
  g+gM!8-. g+gM-. g+gM4-- | {{ template "lh1" }}

  \rep 3 { g@M!4 c@M!4 | } g@M!8[-. gM8]-. gM4-- |
  {{ template "lh1" }}
}
{{ end }}
