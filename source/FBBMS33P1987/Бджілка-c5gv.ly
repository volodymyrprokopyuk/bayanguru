{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  d''=''4--\mf c-- | b-- r8 b8( | a b c a | g4) r |
  b='8(\p c d b | a b c a) | b( c d b | a b c a) |
  d=''4--\mf c-- | b-- r8 b( | a b c a | g='4) r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  d'='4(-\frBass e8 fis | g4 d8) r | c4-. a-. | b-. g-. |
  \rep 2 { g'='4( d8) r | fis4( d='8) r | }
  g,=4-- a-- | b-- c-- | d( e8 fis | g='4) r |
}
{{ end }}
