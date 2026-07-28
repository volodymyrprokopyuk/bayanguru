{{ define "rh1a" }}

{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  g'='8(\f a b c) | d4 g | e8( e g e) | d4 b |
  c=''8( c e c) | b( b d b) | a( c b a | g4) g |
  c=''8( c e c) | b( b d b) |
  \duo { a'='8( c b a | g4) g=' \keyCancelBarChange \bar "||" }
  { e'='8 s8 fis s8 | s4 b,= | }

  \key g \minor
  \duo { g'='8(\p a bes c) | d4 g | ees8( ees g ees) | d4 bes=' | }
  { s4 g'='8 a | bes4 bes | c8 c a c | bes4 g=' | }
  \rep 2 {
    <ees,=' c'>8( 8 <g ees'> <ees c'>) | <d bes'>8( 8 <g d'> <d bes'>) |
    <c=' a'>8( <ees c'> <d bes'> <c a'> | <bes= g'>4) 4 |
  } \keyCancelBarChange \bar "||"

  \key g \major
  \duo { g'='8(\f a b c) | d4 g | e8( e g e) | d4 b=' | }
  { s4 g'='8 r | g4 <g b> | c8 c c c | b4 g=' | }
  r8 <g'=' a e'>8 r8 8 | r <g b d>8 r8 8 | r <fis a d>8 r8 8 |
  r8 <g=' b d>8 r8 8 |
  \duo {
    c''=''8 c e c | b b d b | d d e fis | g4 g='' \bar "|."
  } {
    \rep 2 { s8 a'='8 s8 a=' | } | s8 <fis=' b>8 <g c> <a c> | s4 <g=' b d>4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  r4 g'='-\frBass | b g | c a | b g | a fis | g e | c d | g g,= \clef bass |
  a=4 fis | g e | c d | g <g,=, d'> \clef treble |

  \key g \minor
  \duo {
    r4 d'='4 | r d | r ees | r d=' \clef bass | r <d,= c'>4 |
    r4 <d bes'> | s2 | s2 | r4 <d c'> | r <d= bes'> | s2 | s2 \clef treble |
  } { \rep 4 { g=2 | } | \rep 2 { g=2 | g | fis4 d | g d= | } | }

  \key g \major
  r4 g'=8( a | b c d4) | g e8( e | g2) | c,8( c e c) | b( b d b) |
  a=8( c b a | g4) g | r8 <c e g>8 r8 8 | r <b d fis>8 r8 8 |
  r8 <a= c e>8 r8 8 | r4 <g= b d> |
}
{{ end }}
