{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key b \minor
  \time 2/4
  d'='4\(\p b | g'8[ g fis d] | e4~ e8 fis16 e | b2\) |
  b'='4.\(\mf d8 | a4 fis | g8 a16 g fis8 e | fis2\) |
  fis'=''4.\(--\mf fis8 | e[ d cis b] | d4 b\) | g'( b,) |
  fis'=''4\(~--\f fis8 fis16 a | g8[ fis e b] | d4 b\) | e( b=') |

  cis=''4\(~\mf cis8 b16 cis | d8[ cis b fis] | g fis16 g a8 g | fis4 a\) |
  g='8( fis16 g a8 g | fis4 a) | g8(\> fis16 g a8 g | \af 2\! fis2) |
  fis='8[(\p e d e] | fis2) | fis8[(\> e d e] | \af 2\! cis2) |
  d='4\(\pp b | g'8[^\tRit g fis d] | e4 fis8 e | <d=' b'>2\) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  <b,=, fis'>2\(-\frBass | e4 b | cis g' | b, a'\) |
  g=4( b) | fis( b) | e,( b') | d,( b') |
  d='4( b) | g'( b,) | fis'4.(-- fis8 | e[ d cis b] |
  d='4 b) | e( b) | fis'(~-- fis8 fis16 a | g8[ fis e fis=']) |

  \duo { g'='2 | } { r4 a=4 | } | fis4( a,) | e'( a,) | d8[( cis b a]) |
  e'='4( a,) | dis8[( b cis dis]) | e4( d | cis fis,) |
  <g= b>2 | \duo { ais=2 | } { g=4( fis) | }
  <g= b>2 | \duo { b=4( ais) | } { <fis= g>2 | }
  <b,=, fis'>2\( e4 d | cis g' | <b,=, fis'>2\) |
}
{{ end }}
