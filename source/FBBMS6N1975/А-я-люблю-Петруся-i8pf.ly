{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  e'='16(\p dis e fis g8 g) | fis16( a g fis e8. fis16) |
  g='16( fis g a b8 b) | a16( c b a g4) |
  b='4( <g e'>8. <g b>16 | 8 <fis a> <e g>4) |
  \duo {
    fis'='16( b, dis fis b8. a16 | a g fis g e4) |
    b'='16( e, g b e8. b16 | <b d> <a c> <e b'> <fis a> <e g>4) |
    <dis=' fis>16( b dis fis b8. a16 | a g fis g <g,= e'>4) \bar "|."
  } { s4 dis'='4 | b2 | s4 gis' | s2 | s4 dis=' | s2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  r4 e=16(-\frBass dis e g | a8 b) c16( b c a) |
  g=8 d g16( fis g b=) \clef treble | c='8 d~ d16 c b a= \clef bass |
  g=16( a g fis e8 <g b>) | b,=,( cis16 dis e8) fis16( g |
  a=8) g fis16( b, dis fis) | e8 a(~ a16 g fis g |
  e=8) <g b> b16( e, gis b | a4) d16( c b c |
  a=8) g fis16( b, dis fis | e8) b e,=,4 |
}
{{ end }}
