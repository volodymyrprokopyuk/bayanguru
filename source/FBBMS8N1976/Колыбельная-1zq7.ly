{{ define "rightHand" }}
\relative {
  \tempo "Lento cantabile"
  \clef treble
  \key g \major
  \time 4/4
  \duo {
    b'='4\p g b d | c4.\< b8 a4 \af 4\! g | fis g a c | \af 1\! b1\> |
    b='4\< c b d | c b a4. \af 8\! g8 | b4\> g e a | \af 2.\! g='2. %
  } {
    d'='2 f | e e | d d | d dis | <d a'> <d gis> | e e4 ees | d2 c | b=2. %
  } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,2-\frBass gis | a4 b c cis | d e fis a | g a g fis |
  f=2 e | a,4 b c2 | d d, | g4( d' g=) r |
}
{{ end }}
