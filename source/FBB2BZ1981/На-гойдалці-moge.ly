{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 6/8
  \partial 8 { a'='8(\p | }
  a='4 fis8 d4) fis8( | a4 fis8 d4) fis8( | g4\< \af 16.\! b8 d cis b |
  b='4.\> \af 8.\! a4) a8( | g4) a8( b a g | fis4) fis8( a g fis |
  e='4)-- g8(\> g fis e) | e4.( \af 4\! d='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \partial 8 { r8 | }
  d=8(-\frBass fis a b4) a8( | d, fis a b4) a8( | b g d') g=' r r \clef treble |
  <d=' g>4( e8 fis4) r8 | e4 d8( cis4. | d4) cis8( b4 a=8 \clef bass |
  <g= b>4)-- e8( a4 g8) | <d_~ g(>4. <d= fis)>4 %
}
{{ end }}
