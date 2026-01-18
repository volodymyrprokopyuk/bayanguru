{{ define "rh1" }}
  b'='8(\mf g d'4) r | c8( a d4) r | b8( g d'4)-. d-. | d=''2.-> |
{{ end }}

{{ define "rh2" }}
  c=''8(\p b a4) r | b8( a g='4) r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato grazioso"
  \clef treble
  \key g \major
  \time 3/4
  {{ template "rh1" }} {{ template "rh2" }}
  a='8(\< b a g fis e | \af 4\! d='4) r r |
  {{ template "rh1" }} {{ template "rh2" }}
  fis='8(\> g a d, e fis | \af 4\! g='4) r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,4(-\stBass gM!) gM-. | fis( d@7!) d74-. | g_\aSim gM! gM | g gM! gM |
  d'=4 d7! d7 | d g@M! gM4 | cis a@7! a74 | d= dM! dM |
  g,=,4 gM! gM | fis d@7! d74 | g gM! gM | f g@M! gM4 |
  e=,4 c@M! cM4 | d' g@M! gM4 | d= d7! d7 | g+gM! r r |
}
{{ end }}
