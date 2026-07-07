{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key g \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  d'='4(\p bes' a8 bes g4 | d'2.) bes8( ees | d_\dCre bes a bes g2) |
  g='4( ees'8 d c bes a g | f2) f8\( g a c | ees4.\f d8 c bes a g |
  fis='2~->_\dDim fis4. g8 | a2~ a4. bes='8\) |
  \duo { g'='1~ | g~\>^\tRit | \af 1\! g='\pp \fermata \bar "|." }
  { r4. f'='8 ees c d4~ | d1~ | d=' \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/4 1,1,1,1
  R1 | d=4(-\frBass bes' a8 bes g4 | d'2.) bes8( ees | d bes a bes g2) |
  g=4( ees'8 d c bes a g | f2) f8\( g a c | ees4. d8 c bes a g |
  fis=2~ fis4. g8 | a2~ a4. bes8\) |
  \duo { r4. f'='8( ees c d4~ | d='1) \fermata | } { g=1~ | g= \fermata | }
}
{{ end }}
