{{ define "lh1" }}
  e=8[( b' b b] | a a g16 fis e8) | g4( a16 g a8 | b[ a g fis=]) |
{{ end }}

{{ define "lh2" }}
  e=8[( b' b b] | a a g16 fis e8) | c'4( a= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  e'='8[(\p b' b b] | a a g16 fis e8) | g4( a16 g a8 | b4. a8) |
  \duo { g'='8[( b b b] | a a g16 fis e8) | g4( a | e='2) | }
  { e'='2~ | e4 r | e8[ d c d] | e='2 | }

  r4\mf e='4( | c' b16 a g8) | b( e, c'4 | b cis8 dis) |
  \duo { e''=''4( d | c b) | a8(\> g \af 4\! fis4 | b=')\< \af 4\! b \rest | }
  { g'='2 | e8 fis g4 | e2 | dis='4 s4 | }

  e,='4(\mf d' | c b16 a g8) | b( e, c'4 | b cis8 dis) |
  \duo { e''=''4( d | c b) | a8(\> g fis4 | \af 2\! e='2) \bar "|." }
  { g'='2 | e8 fis g4 | e c | b=2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  r4 e=4(-\frBass | fis g) | b( c | g a) |
  r4 d='4( | c b) | c8[( b a fis] | e=2) |

  {{ template "lh1" }} {{ template "lh2" }} | b=8[ a g fis]) |
  {{ template "lh1" }} {{ template "lh2" }} | e=2) |
}
{{ end }}
