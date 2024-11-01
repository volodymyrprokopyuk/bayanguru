{{ define "rightHand" }}
\relative {
  \tempo "Moderato sostenuto"
  \clef treble
  \key e \minor
  \time 6/8
  e'='8--\p\< e8.-- fis16 g8-- g8.-- \af 16\! <fis a>16 |
  <g=' b>4.(\> \af 4.\! e) |
  <a=' c>8--\< 8.-- <b d>16 <c e>8-- <b d>-- \af 8\! <a e'>-- |
  \af 2.\! <g=' b>2.--\> |
  <fis=' a>8--\< 8.-- <g b>16 <a c>8-- <g b>-- \af 8\! <fis a>-- |
  <e=' g>4. <e b'> |
  <dis=' fis>8--\> 8.-- <e g>16 <fis a>8-- <e g>8.-- \af 16\! <b fis'>16 | e='2. |

  <e=' g>8(\mf 8. <fis a>16 <g b>8 8. <fis a>16 | <e b'>4. e) |
  \duo {
    \stemDown <a'=' c>8( 8. <g d'>16 \stemUp <c e>8 <b d> <c e> | b='2.) |
  } { s4. fis'='4. | g8( d8. e16 f8 e d=') | }
  <c=' e a>8(_\dCre 8. <g' b>16 <a c>8 <g b> <fis a> | <e g>4. <e g c>) |
  \duo {
    fis'='8( fis8. g16 <cis, a'>8 <b g'>8. <a fis'>16 | <g_( e'~>4.) <gis) e'> |
    a'='8( a8. b16 <a c>8 <g b> <fis a> | <e g>4. <b b'>) |
    fis'='8( fis8. g16 <cis, a'>8 <b g'>8. <a fis'>16 | <g= b e>2.) |
  } {
    <ais= e'>4. d | b4 c8 d c b | <c e>2. | c8( b8. a16) g'8( fis e) |
    <ais,= e'>4. d=' | s2. |
  }

  r8\mf <b= g' b>4 r8 <b fis' b>4 |
  <g'=' e'>8(\< 8. \af 32.\! <a fis'>16 <b g'>8\> <a fis'>8 \af 8\! <g e'>) |
  r8 <e=' b' e>4 r8 <e a e'>4 |
  \duo {
    <g'=' g'>8(\< 8. \af 32.\! <a a'>16 <b b'>8\> <a a'> \af 32.\! <g g'>) |
    <e='_~ e'~>4.\f 4 <fis fis'>8 | <g g'>4 <a a'>8 <g' b> <fis a> <e g> |
    fis=''8( fis8. g16 a8 g fis) | \af 2.\! <d e>2.\> | e~\p | e8 e8. d16 b4. |
    fis='8( fis8. g16 a8 g8. fis16 | \af 2.\! <b,= e>2.)\> |
  } {
    <b'=' d>4. <e g> | a,8( a8. b16) c8( b a) | d4. b | c cis |
    gis='8( gis8. a16 b8 a gis) | <fis a>8( 8. <g b>16 <a c>8 <g b> <fis a> |
    <e=' g>4. <dis a'>) | <c e> <ais e'>8~ 8. <b dis>16 | a4.( g=) |
  }

  e='8\p e8. <e fis>16 <d g>8 8. <d a'>16 |
  \duo { b'='4.\< \af 4.\! e,=' | } { <c'=' e>8 <d e>8. <c e>16 b8 c b= | }
  <e=' g c>8 8. <e g d'>16 <e fis c' e>8 <e fis c' d> <e fis c' e> |
  \duo { \af 2.\! b'='2.\> | }
  { <d'=' fis>8 <d g>8. <d fis>16 <d e>8 <d fis> d=' | }
  <c=' e a>8\mp 8. <c e b'>16 \duo { c''=''8 b a | g4._\dCre b=' | }
  { <c'=' dis>4. | <b d>8 8. <c e>16 <d fis>8 <c e> <b= d> | }
  <b= e fis>8 8. <b e g>16 <ais dis a'>8 <g dis' g>8. <ais dis fis>16 |
  \duo { \af 2.\! <d'=' e>2.\< | } { a=8 fis8. a16 gis8 a b= | }
  <a'=' c e a>8\f 8. <b b'>16 <c e a c>8 <b b'> <a a'> |
  <e'='' g c e>8^\tRit 8. <fis fis'>16 %
  \duo {
    ais''=''4. \barFermata |
    <a,,= fis'>8(\p 8. <b g'>16 <c a'>8 <b g'>8. <a fis'>16 |
    \af 2.\! <g= b e>2.)\> \bar "|."
  } { <g''='' e' g>8-- <fis d' fis>-- <e c' e>-- | dis,='2. | s2. | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \rep 8 { R2. | } |

  r4 r8 e=8(-\stBass e8. fis16 | g8 g8. fis16 g8 fis e) |
  a,=,8 am! am d d7! d7 | g, gM! gM gis4. |
  a=,8 am! am fis g a | b g fis e em! em |
  c'=4. b8 b7! b7 | e( d c b4 e8) | a, am! g fis[ a@m! am8] |
  c'=8 cM! cM a a7! a7 | fis fis7! fis7 b b7! b |
  e=8 em! b a g fis=, |

  e=,8( e8. fis16 g8 g8. a16 | b4. e,) | c'8( c8. d16 e8 d e | b2.) |
  c=8( b a) d d7! d7 | b( a g) c cM! cM | a4.( ais) |
  b=,8[ e@7! e78] e e7! e7 | a@m!4. d@7!4. | c@7!4. a@7!4. |
  d=4. fis8~ fis8. b,16 | \rep 5 { e=8 e8. e=16 } e8 e e= |

  a+c@M!8[ a+cM8. a+cM16] d+d7!8 d+d7 d+d7 |
  g+gM!8 g+gM8. g+gM16 g+gM8 g+gM g+gM |
  fis=8 fis8. fis16 b,4. | e8 e8. e16 d4. | cis8 cis8. cis16 c8 c8. c16 |
  b=,8 b8. b16 <e, b'>4 8 | a am! a16( g fis8[) a@m! am8] |
  c'=8 c7! c16( g fis8) fis7! fis7 | b2. | a8( g8. fis16 e=,4.) |
}
{{ end }}
