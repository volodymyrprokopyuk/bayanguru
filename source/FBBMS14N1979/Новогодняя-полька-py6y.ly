{{ define "rh1" }}
  {{ .a }} b a8) cis16( b \af 8\! a8) | e'-.\> e-. \af 4\! e4-- |
  cis=''16(\< b a8) cis16( b \af 8\! a='8) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} gis fis8) a16( gis fis8) | e-. cis-. cis=''4-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 2/4
  {{ template "rh1" (w `cis''=''16(\mf\<`) }} | d=''8-.\> d-. \af 4\! d4-- |
  d=''16(\mf\< cis b8) d16( cis \af 8\! b8) | gis'8-.\f gis-. gis4-- |
  fis=''8-. fis-. fis4-- | e8-. e-. e=''4-- |

  {{ template "rh1" (w `cis=''16(\p\<`) }} | fis'=''8-. fis-. fis4-- |
  {{ template "rh2" (w `a=''16(\f`) }} | fis=''8-._\dDim b,-. b4-- |
  e=''8-. cis-.  cis4--\p |
  {{ template "rh2" (w `a'=''16(\f`) }} | fis=''8-. b,-. b( cis) |
  a='4 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  a=4-\frBass e | cis' e, | a e | b' e, | gis e | b' e, | d' e, | cis' e,= |

  a=4 e | cis' e, | a e | d a' | dis, a' | e a | <e gis> d' | <a cis> e' |
  dis,=4 a' | e a | <e gis> d' | <a= cis> r |
}
{{ end }}
