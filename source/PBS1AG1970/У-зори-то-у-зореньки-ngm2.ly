{{ define "rh1" }}
  \stemDown
  b='4( <a f'>8 <b d> <c e>4\> <b d> | \af 1\! a'=''1) \stemUp |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key a \minor
  \time 4/4
  \duo {
    e''=''1~\p | e | d4. e8 f e16 f g8 f | e1 \stemDown |
    <e='' g>4.(\mp <d f>8 <c e>4 <b d>8 <c e>16 <b d> \stemUp |
    a='4. b8 c b a4) | {{ template "rh1" }}
    g=''1 | f2 e | {{ template "rh1" }}
  } {
    e''=''4. d8 c d b c16 b | a4. b8 d b a4~ | a1~ | a |
    s1 | a='2~ a8 e a4 | s1 | a1 |
    <e'='' g>4. <d f>8 <c e>4 <b d>8 <c e>16 <b d> |
    <a=' c>4. <b d>8 <c e> <b d> <a c>4 | s1 | a='1 |
  }

  e''=''4.( d8 c d b c16 b | a4. b8 c b a='4) |
  \trio { \stemDown d''=''4.( e8 f e16 f g8 f \stemUp | e1) | }
  { s1 | r4 g'='8 a bes4 a8 g=' | } { s1 | s4 c''=''4 d cis='' | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
