{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 3/4
  \repeat volta 2 {
    d''=''8(\f g fis g b g | d4) d-. d-. |
    d=''8( a' gis a c a | d,4) d-. d-. |
    d=''8( g fis g b g | d4) d-. d-. |
    d=''8( e fis g a fis | g4) g=''-. r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,4(-\stBass gM!)-. gM-. | g( gM)-. gM-. |
  fis=,4_\aSim d@7! d74 | fis d@7 d74 |
  g=,4 gM! gM | g gM gM | d'=4 d7! d7 | g+gM! g+gM r |
}
{{ end }}
