{{ define "rightHand" }}
\relative {
  \tempo "Tranquillo caloroso"
  \clef treble
  \key b \minor
  \time 6/8
  \duo {
    \partial 4 { r8\p r8 | }
    r8 fis''=''8( e d4.~ | d8) d[( cis] b4.~ |
    b='8)\mf cis[( d] e4.~ | e8) d[( e] fis) r\p r |
    r8 fis=''8( e d4.~ | d8) d[( cis] b4.~ |
    b='8) cis[( d] e4.~ | e8) d[( e] fis) r r |
    r8 c=''8( d e4.~ | e8) fis[( e] d4.~ |
    d=''8) e[( d] c4.~ | c8)\mf d[( c] b) r r |
    r8 c=''8( b a4.~ | a8) b[( a] g4.~ |
    g='8) a[(^\tRal g] fis=') r\p r | \time 9/8 r4. r4. r4. |
    % \time 6/8
  } {
    d'='8( cis |
    b=4.~ b8) d[(_\dCre e] | fis4.~ fis8) e[( fis] |
    g='4.~ g8) fis[(_\dDim e] | d='4.~ d8) d[( cis] |
    b=4.~ b8) d[( e] | fis4.~ fis8) fis[(\< g] |
    \af 4.\! a='4.~ a8)\f b[( a] | fis4.~\> \af 8\! fis8) d[(\p fis] |
    a='4.~ a8) g[( a] | b4.~ b8) a[(_\dCre g] |
    fis='4.~ fis8) e[( d] | g4.~ g8) fis[( d] |
    dis='4.~ dis8) g[(_\dDim fis] | e4.~ e8) e[( d] |
    cis='4.~ cis8) cis[( b] | ais cis g' fis g fis e) d[(\p^\tATem cis=']) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
