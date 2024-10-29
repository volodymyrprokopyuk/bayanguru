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
    c=''4 d c | <a,= ees' b'>2. | b'2 d4 | c2 b='4 |
  } {
    r4 <b= c>4( <a c>) | gis2. | a~ | a | a' | r4 e'4 d |
    r4 b='4 a | r4 <g, cis f> <a e'> | r4 e' d | r4 fis f |
    e='2. | a4 g f | <dis a'>2. | <d=' gis> |
  }
  <dis='_( g_~ a^~ d^(>2. | <d=') g a dis)> |

  \tempo Largo
  <e=' a c e>2\f <d d'>4 | <e gis b e>2 <d d'>4 |
  <f=' a~ c~ f>2 <e a c e>4 | \duo { <a= a'>2. | } { f'='2 e='4 | }
  <f=' a d f>2 <e e'>4 | <d g b d> <c f a c> <d g b d> |
  <e=' g c e>2. | <g bes d g>2 <a cis e a>4 |
  <f=' a d f>2 <d d'>4 | <c f a c>2 <b f' g b>4 |
  <c=' e g c>2 <a a'>4 | \duo { <ees'=' f a>2. | } { c'='2 a=4 | }
  <b= dis( a'~ b>2 <d)~ ees a d>4 | <d e gis c>2 <d e gis b>4 |
  <c=' e a>4 <c a' c> <d b' d> | <e c' e> <f d' f> <g e' g> |
  <a=' d f a>2 <f d' f>4 | <b d g b>2 <g b g'>4 | <c e g c>2 <a a'>4 |
  <a=' ees' f a>2. | <b dis_( a'~ b>2 <d)~ ees a d>4 |
  <d='' e gis c>2^\tRit <d='' e gis b>4 \fermata |

  \tempo Sostenuto
  \duo {
    e''=''2(\mf d4) | \rep 2 { e=''2( d=''4) | } | \af 2.\! d2.\> |
    e,='2(\mp d4) | e2 e4 | \rep 2 { r r a=' | a='2. | } | g2\p f4 |
    <c=' e>2.~ | 2.~^\tRit | \af 2.\! 2.\> \fermata \bar "|."
  } {
    <g'='b>2. | <g c> | <a c>2. | 2. | <a, c>2. | 2. | <a b dis>2.~ | 2. |
    <a= bes d>2.~ | \af 2.\! 2.\> | <gis c>2. | <a c>2 gis4 | fis2 a4 | gis=2. |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
