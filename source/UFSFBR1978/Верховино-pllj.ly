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

}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
