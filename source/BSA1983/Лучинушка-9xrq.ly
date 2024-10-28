{{ define "rightHand" }}
\relative {
  \tempo "Con moto espressivo"
  \clef treble
  \key a \minor
  \time 3/4
  \partial 4 { e'='4\(\mf | }
  f='4 d d | c2 b4 | c2 a4 | a=2.\) \clef bass |
  \duo { b=2( d4 | c2^\tRit b=4) \fermata | }
  { <dis= a'>2.~ | 4 <d= gis>2 \fermata | }

  \tempo Moderato
  \clef treble
  e'='2(\p d4) | e2( d4) | f2( e4 | a,2.) |
  f'='2\( e4 | d c d | e2.~ | e2\) e4\( |
  f='4 d d | c2 b4 | c2 a4 | a2.\) | b2( d4 | c2 b4) |
  \duo {
    r4 c'='4 d | e <aes, d f> <g cis g'> |
    <a= a'>2._\dCre | <f' g> | <e c'> | b'2( a4) |
    b='2( d4) | c2( b4) | <c,='_~ a'~>2. | 2. |
  } {
    a=2.~ | a4 s2 | f'4 d d | c2 b4 | c2 a4~ | <a ees'>2. |
    <dis=' a'>2. | <d gis> | r4 r g | fis f='2 |
  }

  \tempo Animato
  \duo {
    e'='2.\mf | r4 <d~ f>( <d e>) | r4 c d | e <d f> <e g> |
    r4 <d'='' f>4 <e g> | <f a>2. | <c e> | g | <f a> | <g b> |
    c=''4 d c | <a,= ees' b'>2. | b'2 d4 | c2 b4 |
    <dis,='_( g_~ a^~ d^(>2. | <d=') g a dis)> |
  } {

  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
