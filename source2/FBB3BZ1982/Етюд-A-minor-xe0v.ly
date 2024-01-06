{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valzer"
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 2,1
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      fis'='8(\p g a g e'4) | e,8( f g f d'4) |
      dis,='8( e f e c'4) | cis,8( d e d a' g) |
      fis='8( g a g dis' e) | e,( f g f cis' d) |
      dis,='8( e f e b' c) | cis,( d a' g <e=' c'>4) \fine |
    }

    \volta 2
    \duo {
      e''=''8(\f f e f e4) | d8( e d e d4) | c8( d c d c4) | b8( c d c e d) |
      e=''2( f4) | d2( e4) | c2(\> d4) | b8( c^\tRit d b \af 4\! a='4) \bar "||"
    } {
      <e'=' c'>2. | <f b> | <e b'> | f |
      c'=''8( b c b a4) | b8( a b a gis4) | a8( gis a g fis4) | f2( e='4) |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  c'='4-\frBass e g | g, b f' | a, c e | f, a b |
  \trio { b'='4 \rest-- s4 g='4 | b \rest-- s4 f | b \rest-- s4 e,='4 | }
  { s4 e'='2 | s4 b2 | s4 c='2 } { \stemDown c'='2. | g | a= | }
  <f= a>4 <g= b> \clef bass <c,= c'> \clef treble |

  \rep 3 { a'=8( gis a gis a=4) | } | <gis d'>4 <a c> <gis b> |
  a=4 b c | d e f | e ees d | <a c> <gis b> <a= c> |
}
{{ end }}
