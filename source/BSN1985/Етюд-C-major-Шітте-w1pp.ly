{{ define "rh1" }}
  {{ .a }} a g a g c) g( a g a g e') | d( e d e d g, c=''8) r r |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! cM c cM cM | b[ g@7! g78] c= cM! cM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 6/8
  {{ template "rh1" (w `g'='16(\p`) }}
  g='16( a g a g c) b( c b c b d) | a( b a b a d g,8) r r |
  {{ template "rh1" (w `g='16(`) }}
  a='16( b a b a d) a( b a b a e') | cis( d g f e d c=''8) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8-\stBass`) }}
  e=8[ c@M! cM8] d[ g@M! gM8] | d d7! d7 g+gM! g16( f e d) |
  {{ template "lh1" (w `c=8`) }}
  f,=,8[ d@m! dm8] fis[ d@7! d78] | g=, g7! g7 c+cM! r r |
}
{{ end }}
