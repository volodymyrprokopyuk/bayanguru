{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key fis \minor
  \time 3/4
  fis'='4(\p gis8 b a fis) | cis'2.(~ | cis8 fis, gis a) b4(~ |
  b='8 eis, fis gis) a4(~ | a8\< dis, eis fis gis \af 8\! b) |
  cis,='8[( b'] a gis4\> \af 8\! fis8) | fis( eis gis eis cis='4) |

  R2.\mf | fis='4( gis8 b a fis) | e'4( d4. fis,8 | gis b) cis4.( eis,8 |
  fis='8 a) b4.( dis,8 | eis b' a cis, d a') | gis(\> cis, fis d b \af 8\! cis) |
  R2.\p | fis='4(\< gis8 b a \af 8\! fis) | d'2( cis4~\> | cis \af 4\! fis,=') r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key fis \minor
  R2. | fis,=,4(-\puBass gis8 b a fis) | d'4.( fis,8 gis b) |
  cis=4.( eis,8 fis a) | b4.( dis,8 eis gis) |
  a=,8( gis fis a b4) | cis4.( b8 a gis=,) |

  fis=,4( gis8 b a fis) | d'4( cis2~ | cis8 a b cis) d4(~ |
  d=8 gis, a b) cis4(~ | cis8 fis, gis a) b4(~ | b8 eis, fis a) b4(~ |
  b=,4 a8 b d cis) | fis,4( gis8 b a fis) |
  d'=2( cis4~ | cis b a8 gis | fis=,2) r4 |
}
{{ end }}
