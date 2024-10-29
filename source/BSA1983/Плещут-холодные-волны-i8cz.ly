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
  <fis=' a>8--\< 8. <g b>16 <a c>8-- <g b>-- \af 8\! <fis a>-- |
  <e=' g>4. <e b'> |
  <dis=' fis>8--\> 8. <e g>16 <fis a>8 <e g>8. \af 16\! <b fis'>16 | e='2. |

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
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
