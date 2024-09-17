{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key a \major
  \time 2/2
  a'='4(\p\< e'_\aEsp d cis8 \af 8\! e | b4.\> cis8 e d cis \af 8\! b) |
  r4\mf e=''4( d cis8 e | b4.\> a8 gis) r8 \af 4\! <gis b>4( |
  \time 3/2
  cis=''4->\mf <gis b> a8 gis b a e4)_\dCre <gis b>( |
  cis=''4-> <gis b> a8 gis b a e2) |
  \time 2/2
  a='4(\f e' d cis8 e) | b4.( cis8 e d cis b) |
  a='4( <a e'> <a d> <a cis>8 e') | <fis, b>4.( a8 gis e <gis b>4) |
  \time 3/2
  \duo { cis''=''4(\f b a8_\dCre gis b a e='4) } { e'='2 cis=' } %
  <e=' gis b>4-> |
  \time 2/2
  <e=' a cis>4-> <e b'>-> a8-> gis-> b-> a-> |
  <e=' e'>2-> \fermata r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \major
  R1 | R1 | a'='2-\frBass b4( a) | gis( fis e8) e e4( |
  a='4 e fis4. fis8 e4) e( | a e fis4. fis8 e='2) \clef bass |
  \duo { a=4( cis) fis( e) | d4.( cis8 b4 e) | } { a=1 | a= | }
  a,=4( gis) fis( e) | d4. d8( e4 e) |
  a=4( gis) fis4. fis8 <gis b>4 e-> |
  a=4-> <gis b> <fis a cis>4. 8 | e=2-> \fermata r2 |
}
{{ end }}
