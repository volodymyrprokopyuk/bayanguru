{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 6/8
  \duo {
    \partial 8 { e'='8(\p | }
    fis='4 gis8 a4) e'8( | d4 f8 e4) a,8( | d4 b8 c4) e,8( |
    fis='4^\tRit b8 b4) e,8( | fis4^\tATem gis8 a4) e'8( |
    d=''4 f8 e4) a,8( | d4 b8 c4) e,8( | gis4. a='4) %
  } {
    \partial 8 { s8 | }
    d'='4.( <c e>4) s8 | <a' b>4.( <a c>4) a8~ | a4.~ a4 s8 |
    <a,= dis>4.( <gis e'>4) s8 | dis'4( d8 c4) s8 |
    <a'=' b>4.( <a cis>4) a8~ | a4.~ a4 s8 | <b, d>4.( <c=' e>4) %
  } r8 |

  r4 \duo {
    gis'='8( a4 c8 | e4 d8 c4) e8( | e'4 d8 c4) c,8(^\tRit |
    d=''4. e)~ \fermata | e~^\tATem e=''4 %
  } {
    s4. e'='8( | b'4. e,4) e'8~ | <e~ b'>4. e4 s8 |
    b='4( a8 <gis b>4) \fermata e8( | <gis b>4 c8 a='4) %
  }
  \trio { e''=''8( | d4 f8 e=''4) a,8( | b4 d8 c=''4) } %
  { s8 | b'='4.( c4) s8 | f,4.( fis='4) } { s8 | a''=''2. | s4. s4 } %
  \duo { fis'='8( | gis4. a='4) \bar "|." } { s8 <b= d>4.( c='4) } %
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \partial 8 { r8 | }
  e=4.(-\frBass a,=,4) r8 |
  \duo { f'='4.( e='4) } { a=4.~ a=4 } r8 |
  \duo { f'='4( d8 e='4) } { a=4.~ a=4 } r8 |
  b=,4.( e,4) r8 | e'4.( a,=,4) r8 |
  \duo { f'='4.( g) | f4( d8 e='4) } { a=2.~ | a4.~ a=4 } r8 |

  e'=4.( a,4) e'8( | e'4 d8 c4 a8 | gis4. a=4) \clef treble a'='8( |
  gis='4. a4) e8( | f4. e='4.) \fermata \clef bass |
  \duo { d'='4.( c='4) } { e=4.( a=4) } r8 |
  \duo { f'='4.( e='4) } { a=4.~ a=4 } r8 | d,=4.( dis) | e( a,=,4) %
}
{{ end }}
