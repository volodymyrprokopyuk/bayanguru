{{ define "lh1" }}
  {{ .a }} gM! g gM | c cM! cM4-- | d8 d7! d d7 | g, gM! gM4-- |
  e'=8 em! e em | a, am! am4-- | d8 d7! d= d7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  d''=''8[-.\mf b-. d-. b]-. | c c16( d e4)-- |
  c=''8[-. a-. c-. a]-. | b b16( c d4)-- |
  b='8[-. g-. b-. g]-. | a a16( b c4)-- |
  a='8[-. fis-. a-. fis]-. | g b g='4 |

  d'=''8.(\f c16 b8) b | c16( b c d e4) |
  c=''8.( b16 a8) a | b16( a b c d4) |
  b='8.( a16 g8) g | a16( gis a b c4) |
  e=''8.( d16 c8) fis, | g g g=' r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }} | g,=, gM! gM4-- |

  {{ template "lh1" (w `g=,8`) }} | g,=, gM! gM r |
}
{{ end }}
