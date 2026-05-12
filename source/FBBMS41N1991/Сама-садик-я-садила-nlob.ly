{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 3/4
  \partial 4 { g'='8(\mf a | }
  b='4 g) g'8( e | d4 b) c8( d | e4 c) g'8( e | d4 g) r |
  r8 e=''8( a, c) r4 | r8 d( g, b) r4 | r8 g'8[( b, d] e fis |
  g=''8) r r4 <g, b>8(\< <f d'> | <e c'>4 \af 8.\! <c a'>) <c' e>8 <fis, c' d> |
  <g=' b>4 g <e' g>8( <ais, e'> | <b d>4. <g b>8) <fis c'>[\> <fis a>] |
  g='4~ \af 8\! g8 r <g bes>(\p <a=' c> \keyCancelBarChange \bar "||"

  \key g \minor
  <bes=' d>4 <g bes>) <ees' g>8( <c ees> |
  <bes=' d>4 <g bes>8) <g g'> <a fis'> <b f'> |
  <c='' ees>4 c8 <g g'> <g f'> <g ees'> |
  <g=' d'>2 <bes d>8(\< 8 | <a c>8. <g bes>16 \af 8.\! <fis a>4) %
  \duo {
    c''=''8( d | bes8. a16 g4) g'8( ees | d4. bes8) c( bes16 a |
    g='2) bes8( d | c8. bes16 a4) c8( d |
    bes='8. a16 g4) g'8( ees | d4. bes8) c8(\> bes16 a |
    g='4_~ \af 8\! g8) r g16\mf fis g a=' \keyCancelBarChange \bar "||"
  } {
    fis'='4 | d2 ees'8 g, | bes4. g8 fis4( | g2) g8 g |
    fis='2 fis4 | d2 ees'8 g, | bes4. g8 fis='4 | s2. |
  }

  \key g \major
  b='16_\aLeg c b a g a b g g' fis g e | d e d c b c b a g gis a b |
  c=''16 b c d e dis e fis g fis g e | d cis d g b, ais b d g, fis g b |
  c=''16 d c b a g fis e d c b a | b c b a g a b g g' fis g e |
  d='16 cis d g b ais b d c b c a | g d cis d g fis g a b ais b d |
  c=''16 d c b a g fis e d c b a | b c b a g a b g g' fis g a |
  b='16 d, g b d g, b d c b c a=' |
  \duo { r4 <b'=' d g>8 } { g'='4~ g='8 } r8 r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  \meter 1/4 2,1
  \partial 4 { r4 | }
  r8 d'='8(-\frBass b d) e( c | b) g'( fis f) e( d | c d e fis) e( c |
  b=8 d b g) b( d | c4 a) e'8( d | b4 g) g'8( e | d4. b8) c( a |
  g=8) \clef bass d=8( e fis) g( gis | a a, a' g) fis( d | g g, a b) c( cis |
  d=8 g, d' g) a( c | b a g=) r r4 |

  \key g \minor
  \duo {r8 d'='4 d8 r c | r d4 r8 r4 | r8 g,4 r8 r4 | r8 g4 g8 r g= | }
  { g=2 g4 | g4. bes8 a g | c,4. ees8 d c | bes2 g=,4 | }
  a,=,8 d, d' d, bes' a | g a bes b c cis= |
  \duo { d=2 d=4 | } { r8 d,=,4 d8 r d=, | } | g=,8 a bes c d bes=, |
  \duo { r8 d=4 d8 r d= | } { a,=,2 d,=,4 | } | g=,8(  d' g f) ees( cis=) |
  \duo { d=2 d=4 | } { r8 d,=,4 d8 r d=, | } | g=,8( d' g=) r r4 |

  \key g \major
  \meter 1/4 1,1,1
  g,=,8-\stBass gM! d' g@M! c8 cM! | b g@M! g8 gM! d' g@M! |
  c=8 cM! g c@M! c8 cM! | b g@M! g8 gM! b g@M! |
  a=,8 d@7! d8 d7! fis, d@7! | g8 gM! b g@M! c8 cM! |
  d=8 g@M! d8 g@M! d8 d7! | g, gM! d' g@M! g,8 gis |
  a=,8 am! c a@m! d8 d7! | g, gM! b d@M! c8 cis |
  d=8 g@M! d8 g@M! d8 d7! | g,=, gM! g+gM! r r4 |
}
{{ end }}
