{{ define "lh1" }}
  d'=8 d7! fis, d@7 | g8 gm! g gm | c c7! c c7 | f,=, fM! {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key f \major
  \time 2/4
  a''=''16(\f bes c a g bes a g) | f( g a f d e f d) |
  g=''16( a g f e f e d) | c(\> d e d c bes a \af 16\! g) |
  \repeat volta 2 {
    c=''8(\mf a) g16( bes a g) | f( a d,8) d4 |
    g='16( bes a g) f8 d | e16( g c,8) c='4 |
  }

  <f=' f'>8 8 <a e'>8 8 | <bes d>4 4 |
  <c='' e>8 8 <bes d>8 8 | <a c> <f c'> <a c>4 |
  <d,=' d'>8 8 <a' c>8 8 | <g bes>8 8 8 8 |
  <c,=' c'>8 8 <g' bes>8 8 | f f f16( g a c) |
  <bes=' d>8 c16( bes) <a c>8 bes16( a) |
  bes='16( c <bes d>8) g g | c16( c, d e) g( bes a g) |
  f='16( g a c) <f,=' f'>4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f,=,8-\stBass fM!4 c@7!8 | d'8 dm!4 dm8 |
  g,=,8 g7!4 g78 | c cM!4 c7!8 |
  f,=,8 fM! c' c7! | d dm! d dm |
  c=8 cM! d dm! | c= cM! r cM |

  f,=,8 fM! a f@M | bes8 besM! d bes@M |
  c=8 c7! e c@7 | f,8 fM! f fM |
  {{ template "lh1" (w `fM8 r`) }} {{ template "lh1" (w `fM4`) }}
}
{{ end }}
