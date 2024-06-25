{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key a \major
  \time 3/4
  a=4(->\mf\< \af 2\! e'2) | gis,4(-> e'2) |
  d='4(\> cis \prall b | cis \af 2\! e2) |
  a,=4(->\< e'8 fis \af 4\! e4) | gis,(-> e'8 fis e4) |
  d='4(\> cis \prall b | a \af 2\! a=2) |

  fis'='4\p\< d \af 4\! d | e cis cis |
  b=4( cis d | cis\> b \af 4\! cis) |
  fis='4->\mp\< b,8( cis d4) | e-> a,8( b \af 4\! cis4) |
  b=4(\< cis d | e fis \af 4\! gis=') |

  a='4->\f e'8( fis e4) | gis,-> e'8( fis e4) |
  d=''4( cis \prall b | cis e2) |
  a,='4-> e'8( fis e fis) | gis,4-> e'8( fis e fis) |
  d=''4(^\tRit cis \prall b | a) a'=''2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
}
{{ end }}
