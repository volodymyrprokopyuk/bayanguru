{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  g'='8\(\mf a\< b c d e fis \af 8\! g | fis g a b c4\)-- r |
  c='''8\(\> b a g fis e d \af 8\! c | b2\> \af 4\! g4\) r |
  d'=''8\(\< e fis g a b c \af 8\! d | e,4\) c'8\( b a g fis e |
  d=''4\) b'(\> c) fis,( | \af 2\! g=''2) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,4(-\stBass gM!)-. gM-. gM-. | a( d@7!)-. d74-. d7-. |
  fis=,4_\aSim d@7! d74 d7 | g gM! gM gM |
  b=,4 g@M! gM4 gM | c a@m! am4 am |
  d=4( g@M!)-. d=4( d7!)-. | g+gM!2 r |
}
{{ end }}
