{{ define "rh1" }}
  {{ .a }} d) d d | e16( d cis b d8 b=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key b \minor
  \time 2/4
  {{ template "rh1" (w `b'='8(\p`) }}
  {{ template "rh1" (w `b='8(`) }}
  d=''8( d cis16 d cis8 | b4) b | b16( cis d8 e e | b4) b=' |

  b='16(\mf cis d8) b16( cis d fis | e d cis d e8 cis) |
  d=''16(\< e fis g a c b \af 16\! a | g\> fis e b d e \af 8\! cis8) |
  d=''16(\< e fis d c d e \af 16\1 fis | g\> fis e d cis b a \af 16\! cis) |
  \duo { b'='16(\< cis d e fis g fis \af 16\! e | b'=''2) | }
  { s2 | r8 b'='16 d b='4 | }

  r8\mf b='8( <d fis> b) | r8 <e g>( <d fis>16 g <cis, e>8) |
  r8 b='( <d fis> b | <cis g'> <d fis>16 cis <d fis>8 <cis e>) |
  <b=' d>8( 8 <a cis>16 d <a cis>8 | <g b>2) |
  \duo { b'='4 cis16( d cis8) | b='2 | }
  { fis'='16( g fis8) <e a>4 | b'16( g fis e b=4) | }

  r8\f <d=' fis b>8[ r8 8] | r <e g b>[ <d fis b> <cis fis a>] |
  r8 <d=' fis b>8[ r <d fis a>] | r <d g b>[ <fis g b> <e g a>] |
  r8 <d=' fis a>8[ r <cis fis a>] | r <dis a' b>[ r <e g b>] |
  r8 <d=' fis b>8[ <cis g' b> <cis g' a>] |
  \duo { b'='2 \bar "|." } { <d'=' fis>8 <cis e> <b= d>4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key b \minor
  b=4(-\frBass fis' | g8 e fis4) | b,( fis' g8 e16 g fis4) |
  d='8( d16 e fis8 a | b g fis e) | d( b cis a | g a b cis=') |

  \duo {
    fis'='4( a | g bes) | a(~ a8 b~ | b4 bes) |
    a='2( | g) | fis8( g~ g a) | r8 <e g> <d=' fis>4 |
  } { d'='2~ | d | d4( dis | e2) | fis4( d~ | d e) | d( cis | b=2) | }

  \clef bass
  b=8( d) d4 | e16( d cis b a4) | g( fis | e8 a <d, a'>4) |
  e=4( fis | g8 fis16 e d8 cis) | d4( fis) | <d g>8( <cis fis~> <b=, fis'>4) |

  b=,8-\puBass d e fis | g e fis a, | b d e fis | g e a, cis |
  d=8 b cis a | g fis e cis' | b16 cis d8 e e | \duo { fis=2 | } { b,=,2 | }
}
{{ end }}
