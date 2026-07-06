{{ define "rh1" }}
  {{ .a }} \acc { dis=''8 } <a e'>8 8 8 | 8 8 c16( b a='8) |
{{ end }}

{{ define "rh2" }}
  a='8 \acc { dis=''8 } <a e'>8 8 8 | c8.\sf b16( a='4)\sf |
{{ end }}

{{ define "rh3" }}
  {{ .a }} <g d'>8 8 8 | 8 8 8 8 | 8 g'16( f e8) d |
  e=''4\sf <gis, e'>\sf | {{ .b }} c16( b a8) e | a a a e |
  a='8 c16( b a8) e | a4\sf <a=' c e a>\sf |
{{ end }}

{{ define "lh1" }}
  a=,8 {{ .a }} e a e | \rep {{ .b }} { a=,8 e a e=, | }
{{ end }}

{{ define "lh2" }}
  {{ template "lh1" (w `-\puBass`  `2`) }} | <a e'>4 4 |
  {{ template "lh1" (w `` `1`) }}
  f=,8 f e e | a4 <a e'>4 | \rep 2 { g=,8 d' g, d'= | }
  g,=,4(-> a8)-. b-. | c4 b | {{ template "lh1" (w `` `2`) }} |
  a=,4 a+am! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 3/4
  \partial 2 { r8\p\< e'='8[( a8. \af 16\! b16] | }
  c=''4~\mf c8 b16 a gis8. a16 | b4~ b8) e,[(\< gis \af 8\! b] |
  <f=' d'>4~ \tuplet 3/2 { 8 c'-- b-- } %
  <gis=' e'>4\>^\tTen | a4~ \af 16.\! a='8) %
  \duo {
    s4. | s4 e''=''4~ e8.\> s16 | s4 \af 16.\! e4. s8 |
    s4 f=''4( e | \af 2.\! a,='2.)\> \bar "||"
  } {
    e'='8[(\< a8. b16] | c4~ c8 b16 \af 32.\! a gis8. a16 |
    b='4~ b8) e,[( gis b] | d4~ \tuplet 3/2 { d=''8 c b } gis4 | a='2.) |
  }

  \tempo Allegretto
  \time 2/4
  {{ template "rh1" (w `a='8\p`) }} {{ template "rh2" }}
  {{ template "rh1" (w `a='8`) }}
  <dis,=' c'>8 8 <e b'> c'16( b | a4)\sf <c, e a>\sf |
  {{ template "rh3" (w `g'='8` `a8`) }} \bar "||"

  \tempo Adagio
  \time 4/4
  r2 r8 \duo {
    s4. | r8\f e''=''8( a b c) s8 s4 |
    r8 e,=''8( gis a b) s8 s4 |
    r8 e,=''8( gis b \tuplet 3/2 { d='''8) r8 r8 } r4 |
    r8\> e,=''8( c \af 8\! e a) s8\< \af 4\! s4 |
    r8\f e=''8( a16 e a b c8) s8 s4 |
    r8 e,=''8( gis16 e gis a b8) s8 s4 |
    r8 e,=''16( f gis a b c \tuplet 3/2 { d='''8) r8 r8 } r4 |
    r8 e,=''8( c e \af 2\! <c='' a'>2)\> \fermata \bar "||"
  } {
    e'='8[(\mf\< a8. \af 16\! b16] |
    c=''2~ c8 b16 a gis8. a16 | b2~ b8) e,[( gis b] |
    d=''2~ \tuplet 3/2 { d=''8 c b } e4 | a,2~ a8) e[( a8. b16] |
    c=''2~ c8 b16 a gis8. a16 | b2~ b8) e,[( gis b] |
    d=''2~ \tuplet 3/2 { d=''8 c b } <gis e'>4 | a2~ a=') \fermata |
  }

  \tempo Andante
  \time 2/4
  {{ template "rh1" (w `a='8\p`) }} {{ template "rh2" }}
  a='8_\dCre \acc { dis=''8 } <a e'>8 8 8 | 8 8 c16( b a b |
  c=''8) c b c16( b | a4)\sf <c,=' e a>\sf |
  {{ template "rh3" (w `\tempo Allegretto g'='8` `\tempo Presto a8`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \partial 2 { r4 r | }
  a,=,4-\stBass am!-- r | e a7!-- r | b' d@m!-- %
  \duo { s4 | r4 am!8 } { e,=,4( | a~ a=,8) } r8 r4 |
  a=,4 am!-- r | e e7!-- r | b'=, d@m!-- %
  \duo { s4 | r4 am!2 | } { e,=,4( | a=,2.) | }

  {{ template "lh2" }}

  R1 | a=,4( am!8)-. am-. am4 r | e( e7!8)-. e7-. e74 r |
  b'=,4( e@7!8[)-. e78]-. d@m!4 e,4( | a)( am!8)-. am-. am4 r |
  a=,4( g fis f | e2) eM!4 r | b'( d@m!) dm4 e,( | a=,)( am!) a+am!2 \fermata |

  {{ template "lh2" }}
}
{{ end }}
