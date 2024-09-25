{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key f \major
  \time 4/4
  c''=''4.(\p\< a8 f4 \af 4\! g | a8\> g a bes c4 \af 4\! f) |
  d=''4(\< f8-> d c4. \af 8\! bes8 | a g a bes c=''2) |
  \duo {
    d''=''4.\(\mf d8 c4 a | bes( g) a d\) |
    <e,=' c'>8(\p <g bes> <f a> <e g> f4 a |
    g='4\> <e a c>_\tenuto \stemDown \af 2\! <f=' a c f>2)-- \bar "|."
  } { bes'='8 a g e f2 | d f | s2 d~ | d='4 s2. | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,4-\stBass g a bes | a4. g8 a4 f | bes2 a4 g | f2 ees4 d |
  g=,4 bes a f | g8 a bes c d2 | a bes~ | bes4 c-- f,=,-- fM! |
}
{{ end }}
