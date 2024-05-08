{{ define "lh1" }}
  {{ .a }} c) | e( d) | e4( c b a) | d1-- | c='-- |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 2/2
  e''=''2(\p d4_\aDol c) | e(\< c b \af 4\! a) |
  gis='2( a4\> b) | a2( \af 2\! e) |
  f='2(-- c'4 b) | e,2(-- b'4 a) |
  d,='4\< d( c \af 4\! d | e='2.)\> \af 4\! r4 |

  e='4( e' d c) | e(\< c b \af 4\! a) |
  gis='4 gis( a\> b | a2 \af 2\! e) |
  f='4-- f( c' b) | e,2(-- b'4 a) |
  d,='4( e a gis) | a='1 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  R1 | {{ template "lh1" (w `a=2(-\frBass`) }} | b2( f) | e4( d' c b=) |

  a=4-- r r2 | {{ template "lh1" (w `a=2(`) }} | b2( e,) | a( a,=,) |
}
{{ end }}
