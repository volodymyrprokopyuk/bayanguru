{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key a \minor
  \time 2/4
  e''=''2(\p | a,) | e'4( f8 e | d4) a8( b | c\< d c \af 8\! b) |
  c=''8(\> b16 a g8 e16 \af 16\! g | <e a>2) |
  e'=''4. a,8 | e'4( f8 e | d c16 b a8 b | c4) a |
  a'=''4\mf g8 f | e4 g8( f | e\> d c \af 8\! b | <e,=' a>2)\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  \rep 3 { R2 | } | f'='2-\frBass | e4( d | c b | a2) |
  r8 g'='4.~ | g2 | f | e | <d a'> | c4 b c8 d e d | c4 a= |
}
{{ end }}
