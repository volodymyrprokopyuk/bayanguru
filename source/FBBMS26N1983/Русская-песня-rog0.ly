{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key b \minor
  \time 4/4
  b'='4(\mf d fis e8 d | e d e4 b2) | b4\( d fis8 g fis e | fis2 b,~ |
  b='2 cis | d8 e d cis d cis b4\) | r cis( fis cis | <g d'>2)_\dCre %
  \duo { b'='2 | } { fis'='8( g fis e=') | }

  b='4\f b <d fis> <e g> | <fis a>4. <e g>8 <d fis>4 <cis e>8 <b d> |
  <c='' e>4 4 <fis, d'> <ais cis> |
  \duo { \af 1\! b'='1\> | } { a'='4 gis fis='2 | }
  b='4(\p d fis e8 d | e d e4 <b b'>2)~ | 1~ | \af 1\! 1\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key b \minor
  R1 | R1 | b'='2-\frBass d8 e d cis | d2 b | a4( fis e fis8 g | fis4 g a2) |
  g='2( <ais, fis'> | b4 d fis8 e d cis=') |

  <b= d fis>2 <a b d fis> | <g b d fis>1 | <g bes c e>2 <fis ais e'^~> |
  <b= e>2 <d fis>4 <cis e> | \duo { fis'='1~ | 1~ | 1 | }
  { <b= d>1~ | 1( | d='2) r2 | } | R1 \fermata |
}
{{ end }}
