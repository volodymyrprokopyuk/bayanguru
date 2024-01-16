{{ define "rh1" }}
  c=''8-. c16( d e4) | b8-. b16( c d4) | c8( a fis d=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  d'='8(\mf g) g-. a-. | b8.( a16 b8 g) |
  c=''8 c( e c) | b8.( a16 b8 g) |
  {{ template "rh1" }} | g b d4-- |
  {{ template "rh1" }} | g-. b-. g='-. r |

  d='8-.\f \acc { a'='8 } g16( fis g8) a-. | b8.( a16 b8 g) |
  \acc { d'=''8 } c16( b c d e8) c-. | b8.( a16 b8 g) |
  c=''16( b c d e4) | b16( a b c d4) |
  c=''16( b a g fis8) d-. | g16( fis g b d4) |
  c=''16( b c d e dis e c) | b( ais b c d cis d b) |
  a='16( gis a b c a fis d) | g8 b g=' r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! g gM | g gM g gM |
  c=8 cM! c cM | g gM! g gM |
  c=8 cM! cM4 | g8 gM! gM4 |
  a=,8 d@7! d8 d7 | g, gM! b g@M |
  c=8 a@m! am4 | d8 g@M! gM4 |
  d=8 d7! d d7 | g,=, gM! g+gM r |

  g=,8 gM!4 gM8 | g gM4 gM8 |
  c=8 cM!4 cM8 | g gM!4 gM8 |
  c=8 cM! cM4 | g8 gM! gM4 |
  a=,8 d@7!4 d78 | g gM! gM4 |
  c=8 a@m! am4 | d8 g@M! gM4 |
  d=8 d7!4 d78 | g, d'= g+gM! r |
}
{{ end }}
