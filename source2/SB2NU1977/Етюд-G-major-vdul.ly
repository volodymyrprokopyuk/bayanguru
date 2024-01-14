{{ define "rh1" }}
  {{ .a }} c cis d e \af 8\! d) |
  \duo { b''=''2.-- | b2~-- b8 b | a=''2. | }
  {
    r8 cis''=''8( d dis e d) |
    r8 c=''8( d dis e b') | r8 ais,( b c cis d='') |
  }
{{ end }}

{{ define "lh1" }}
  R2. | {{ .a }} r gM! r d' r | fis, r d@7! r8 d' r |
  g,=,8 r gM! r d'= r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Andante grazioso"
  \clef treble
  \key g \major
  \time 3/4
  {{ template "rh1" (w `b'='8(\p\<`) }} | \af 2.\! g=''2.\> |
  g,='8(\< a ais b c \af 8\! b) |
  \duo { g''=''2. | g2~ g8 g | fis2~ fis8 fis='' | }
  {
    r8 fis'='8( g a ais b) |
    r8 ais='8( b cis dis g) | r8 g,( a ais b fis'='') |
  }
  \af 2.\! e=''2.\> |

  dis,='8(\< e gis a b \af 8\! c) |
  e=''8[( fis,])-. fis[-. fis]-. fis-. fis-. |
  cis='8(\< d fis g ais \af 8\! b) |
  d=''8[( e,])-. e[-. e]-. e-. e-. |
  dis='8(_\dCre e gis a b c) |
  gis='8( a b c dis e) | b( c dis e fis g) |
  b=''8(\mf^\tRit a fis d c  a=') |

  {{ template "rh1" (w `b='8(\p\<^\tATem`) }}
  \duo { g''=''2._\dDim | d | g,=' | }
  {
    r8 fis'='8( g a ais b) |
    r8 dis,='8( e f fis b) | r8 fis,=( g a ais b=) |
  }
  d,='8(\mp ees fis g a bes) | c( d ees fis g a) |
  \duo { b''=''2.~ | b=''\pp \bar "|." }
  { r8 cis''=''8( d^\tRal dis e d) | g=''2. | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }} | g, r e=, r d+g@M! r8 |
  R2. | e=,8 r em! r b' r | dis r b@7! r8 b r |
  e,=,8 r em! r b@7! r8 | e=, r c@M! r8 e@m! r8 |

  R2. | d'=8 r d7! r a r | R2. | c8 r cM! r b r |
  a=,8 r am! r c r | fis, r a@m! r8 a r |
  fis=,8 r a@m! r8 c' r | d= r d7! r r4 |

  {{ template "lh1" (w `g,=,8`) }} | g, r gM! r d' r | c r cM! r d@7! r8 |
  g=,8 r gM! r d' r | g@M! r8 r4 r |
  c+dm!8 r8 r4 r | g@M!8 r8 r4 d@7!8 r8 | g@M!2. |
}
{{ end }}
