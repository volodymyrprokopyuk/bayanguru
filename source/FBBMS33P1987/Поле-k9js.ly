{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key g \minor
  \time 2/4
  g'='4.\(\p\< a8 | bes g \af 4\! ees'4 | d8\> bes c4 | \af 2\! g2\) |
  g'=''4.\(--\mf f8 | ees d16 ees f8 ees | d4. ees8 | d2\) |
  d=''4.\( ees8 | f g16 f ees8 d | ees4 d8 ees16 d | c4 ees\) |
  d=''4.\(\> bes8 | c bes16 a g8 ees' | d bes \af 4\! c4 | g'=''2\)\pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g=4\(-\frBass ees' | d c8 d16 c | bes4 a8 bes16 a |
  g=4\) f'\(-- | ees d | c f, | bes8 a16 bes c4 | bes8 c16 bes a4\) |
  aes=4\( g | b g | c f | ees a,\) | bes\( d | ees c | bes a8 bes16 a |
  g=2\) |
}
{{ end }}
