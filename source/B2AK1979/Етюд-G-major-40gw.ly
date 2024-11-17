{{ define "rh1" }}
  b='8) a16( b c8) b16( c | d8)-. d-. d-. c16( b | a8)-. a-. a-. b16( a=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} gM! fis d@7! | g8 gM! g r | fis d@7! fis8 r | g8 gM! g=, r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key g \major
  \time 2/4
  \partial 8 { g'='16(\mf a | }
  {{ template "rh1" }} | g='8)-. g-. g-. b16( a |
  g='8) a16( g fis8) g16( fis | e8)-. e-. e-. a16( g |
  fis='8) g16( fis e8) fis16( e | d8) r r g16( a=' |

  {{ template "rh1" }} | g='8)-. g-. g-. a16( b |
  c=''8) a16( b c8) g16( a | b8) g16( a b8) fis16( g |
  a='8) fis16( g a8) e16( fis | g8) b( g=') r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 8 { r8 | }
  {{ template "lh1" (w `g,=,8-\stBass`) }}
  e'=8 em! dis b@7! | e8 em! e r | a, r a+a7! r | d+dM! a d= r |

  {{ template "lh1" (w `g,=,8`) }}
  e'=8 c@M! e8 c@M | d8 g@M! d8 g@M | d8 d7! d d7 | g,=, gM! g+gM r |
}
{{ end }}
