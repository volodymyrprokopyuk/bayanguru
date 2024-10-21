{{ define "rh1" }}
  e='8 fis g a | b \acc { d=''8 } c b) e( | d c b a=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 2/4
  \partial 8 { b=8( | }
  {{ template "rh1" }} | g='16 a g fis e8) b( |
  {{ template "rh1" }} | g='16 fis e fis g8) %

  \duo {
    g'='8(\p | fis16 g e fis g8) g( | a16_\dCre b g a b8) b( |
    c=''16 d b c d8) d | e16 g fis e b'=''8\f %
  } {
    s8 | c'='4( <b d>8) r | ees4( <d g>8) r |
    g='4( <f b>8) r | <gis a>4( <fis=' dis'>8) %
  }

  \duo {
    b=8\p |
  } {
    b=8 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
