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
  \clef bass
  \key g \major
}
{{ end }}
