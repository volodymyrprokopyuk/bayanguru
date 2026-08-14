{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \meter 1/2 #'(1)
  r8\p \duo {
    a'='8\( c e | d f e c | b d c b | g2~ | g8 a f g |
    e='8 c d e | c a b c | <gis=_~ d'^~>2 | 4.\) \fermata %
  } { a'='4.~ | a2~ | a4 g8 f | e2~ | e8 c d4 | s2 | s2 | s2 | b=4. \fermata } %

  \duo {
    e'='8( | c4. e8 | g4 d8 a' | e4.) a8( | c\< a b c |
    e=''4. d8 | g, c d \af 8\! e | g4.\f f8 | e4. c8 |
    d=''8\> e d \af 8\! a | c4. d8 | b a b fis | c'4. b8 |
    <e,=' a>4~\p\< 8) b'8 \rest | \af 2\! \tweak staff-position #0 R2 |
  } {
    r8 | c'='2 | b(~ | b4 c8) r | f2 | a | g | gis | a | fis | f | dis |
    e='4 d(~ | d c='8) s8 | s2 |
  }

  \duo {
    e''=''4.(\mf a8 | g e f g | e4-- c) | c4.(\mp f8 | e c d e |
    c=''4-- a) | b8(_\dDim a b fis | c'4 a) | g8( f g d | f4 d) |
    e='8(^\tRit d e c | <gis=_~ d'^~>2 | 4.) \fermata %
  } {
    <a'=' c>2~ | 2 | b4(-- a) | a2~ | a | g4(-- fis) | dis2 |
    g='4( fis) | s2 | c4( b) | a2 | s2 | b=4. \fermata %
  } r8 |

  r8\p^\tATem a'='( c e | d f e c | b d c b) |
  <d,=' e>2~^\tRit | \af 2\! 2\> | r8(\p^\tATem a c e | d\< f e \af 8\! c |
  b=8\>^\tRit d a \af 8\! c) | R2 | <a b>2~\pp\<^\tATem | \af 2\! 2 | R2 |
  \af 2\! <a'=' e'>2\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  r4 e'='4(-\frBass | f g | f e8 d=') \clef bass |
  r8 g,=8[( f e] | a,4) <b a'> | <c g'> <b gis'> | <a f'> <g d'> |
  r8 \trio { e,=,8[ b' e]~ | e=4. \fermata } { e,=,4.~ | e=, \fermata } %
  { s8 \stemDown b,=,4~ | b=,4. } r8 |
}
{{ end }}
