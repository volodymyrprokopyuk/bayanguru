{{ define "rh1" }}
  {{ .a }} \acc { dis8 } <a e'>8 8 8 | 8 8 c16( b a='8) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key a \minor
  \time 3/4
  \partial 2 { r8\p\< e'='8[( a8. \af 16\! b16] | }
  c=''4~\mf c8 b16 a gis8 gis | b4~ b8) e,[(\< gis \af 8\! b] |
  <f=' d'>4~ \tuplet 3/2 { 8 c'-- b-- } %
  <gis=' e'>4\>^\tTen | a4~ \af 16.\! a='8) %
  \duo {
    e'='[\< a8. b16] | s4 \af 8.\! e4~ e8.\> s16 | s4 \af 16.\! e4. s8 |
    s4 f=''4( e | \af 2.\! a,='2.)\>) \bar "||"
  } {
    s4. | c''=''4(~ c8 b16 a gis8. a16 | b4~ b8) e,[( gis b] |
    d=''4~ \tuplet 3/2 { d8 c b } gis4 | a='2.) |
  }

  \tempo Allegretto
  \time 2/4
  {{ template "rh1" (w `a='8\p`) }}
  a='8\p \acc { dis8 } <a e>8 8 8 | a8.\sf g16( a4)\sf |
  {{ template "rh1" (w `a='8`) }}
  <dis,=' c'>8 8 <e b'> c'16( b | a4)\sf <c, e a>\sf |
  g'='8 <g d'>8 8 8 | 8 8 8 8 | 8 g'16( f e8) d |
  e=''4\sf <gis, e'>\sf | a8 c16( b a8) e | a a a e |
  a='8 c16( b a8) e | a4\sf <a=' c e a> \bar "||"

  \tempo Adagio
  \time 4/4
  r2 r8 \duo {
    e'='8[\mf\< a8. \af 16\! b16] | r8 e( a b c) s8 s4 |
    r8 e,=''8( gis a b) s8 s4 | r8 e,( gis b \tuplet 3/2 { d) s8 s8 } r4 |
    r8 e,=''8( c e a) s8 s4 | r8 e( a16 e a b c8) s8 s4 |
    r8 e,=''8( gis16 e gis a b8) s8 s4 |
    r8 e,=''16( f gis a b c \tuplet 3/2 { d8) s8 s8 } r4 |
    r8 e,=''8( c e <c='' a'>2) \fermata \bar "||"
  } {  }

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
