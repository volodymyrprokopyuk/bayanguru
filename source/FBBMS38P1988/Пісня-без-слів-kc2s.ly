{{ define "rightHand" }}
\relative {
  \tempo Tranquillo
  \clef treble
  \key c \major
  \time 4/4
  \meter 1/4 1,1,1,1
  \partial 8 { g'='8\(\mf | }
  a='8 c b d c g' e c | a\> c b d c4\) \af 16.\! r8 g\( |
  a='8 c b d c g' ees c | aes'\< c, a' c, b'4\) \af 16.\! r8 g\( |
  c='''8 aes f d bes' g ees c | aes' f d b g'4.\) g8( |
  f=''8 ees d c b d g,) g'( | f\> ees d c b4) \af 8\! r8 g\(\p |
  a='8 c b d c g' ees c | aes' des, b g' c,=''4\) r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \meter 1/4 1,1,1,1
  \partial 8 { r8 | }
  fis'='4(-\frBass f e2 | f4 g e8 d c) r |
  fis='4( f ees aes | f fis g8 fis g) r |
  aes='4( bes g aes | f g ees e | f fis g) r |
  aes='4( a g) r | fis( f ees aes | f g c,=') r8 %
}
{{ end }}
