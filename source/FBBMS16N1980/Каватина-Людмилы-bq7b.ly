{{ define "rh1" }}
  d=''4( g8)-. b,-. | c4( d8)-. e-. | d8-. a16( b d c b a=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} b <d g> | a <c e> g <a c e> | fis <a d> d, <a'= c d> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 2/4
  \partial 4 { b'='8-.\p c-. | }
  {{ template "rh1" }} | b='8 g) b-. c-. |
  {{ template "rh1" }} | b='4) g8( a |
  b='4) fis'8( g | fis4) e8( d | cis a') b,( cis | d16 e d cis d fis e g) |
  fis=''8 a4 b,8~ | b8 g'4 e8~ | e8 b4 cis8 | d4 b8-. c=''-. |

  {{ template "rh1" }} | b='8 g) b-. c-. | d4( g8)-. b,-. |
  c=''8 c'(~ c16 b a g | fis e d c b c a b | g='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 4 { r4 | }
  {{ template "lh1" (w `g=8-\frBass <d' g>_\aSta`) }} | g=8 <b d> g <b d> |
  {{ template "lh1" (w `g=8 <d' g>`) }} | g=8 <b d> g r |
  dis=8 <fis b> b, <dis a' b> | e <g b> g <bes e> |
  a=8 <cis e> g <a cis e> | fis <a d> a <cis g'> |
  d,=8 <fis a d> dis <fis a b> | e <g b> g, <b e> |
  a=,8 <e' g> a, <e' a> | d <fis= a> r4 |

  {{ template "lh1" (w `g=8 <d' g>`) }} | g=8 <b d> g <b d> |
  g=8 <d' g> f, <g d'> | e <g c> c, r | r4 <d a' c>8 r | <g= b d>4 %
}
{{ end }}
