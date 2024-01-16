{{ define "rh1" }}
  {{ .a }} g a8) a-. a-. | g16( a b8) b4-> |
  a='8[-. cis-. e-. cis]-. | d-. d16( e fis8)-. d-. |
  fis,='16( g a8) a-. a-. | g16( a b8) b4-> |
  a='8[-. cis-. e-. cis]-. | d-. fis-. d=''4-> |
{{ end }}

{{ define "rh2" }}
  {{ .a }} e-. d-. d]-. | cis16( d e8) a, cis | b16( cis d8) gis, b=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} dM! d dM | g,[ gM! gM gM] | a a7! a a7 | d[ dM! dM dM] |
  d=8 dM! d dM | g,[ gM! gM gM] | a a7! a a7 | d dM! {{ .b }} |
{{ end }}

{{ define "lh2" }}
  a=,8 aM! e' e7! | a,[ aM! aM aM] | gis e@7! e'=8 e7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \major
  \time 2/4
  {{ template "rh1" (w `fis'='16(\mf`) }}

  {{ template "rh2" (w `e=''8[-.\mp`) }} | a a16( cis e4) |
  {{ template "rh2" (w `e=''8[-.`) }} | a-.\< r \af 4\! a='4-> |

  {{ template "rh1" (w `fis='16(\f`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  {{ template "lh1" (w `d=8-\stBass` `dM4`) }}

  {{ template "lh2" }} | a,[ aM! aM aM] |
  {{ template "lh2" }} | a,[ g fis e=,] |

  {{ template "lh1" (w `d'=8` `d+dM4`) }}
}
{{ end }}
