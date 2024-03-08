{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 3/4
  \trio { e'='4( g b | e2 b4) | a2( g='4) | }
  { e'='2.~ | e | e=' | }
  { s4 \stemDown g'='2_~ | g='2. | s2. | }
  <e'=' g>2.( | <dis fis>) |
  \trio { a'='4( b c | b2 a4) | g2( fis4 | e='2.) | }
  { e'='2.~ | e | e4( dis2 | e='2.) | }
  { s2. | f=4 \rest \stemDown b=4 c=' | s2. | s2. | }

  \trio { b'='4\( e fis | g2 fis4 | e2 b4 | d2 c8 b | <c,=' a'>2.\) | }
  { b'='2.\(~ | b4 g2~ | g4 e2~ | e e8\) r | r4 e='2 | }
  { \rep 3 { s2. | } a'='4 \rest \stemDown gis='8 b8 \rest s4 | s2. | }
  <e=' fis a>4-- <e fis a c>-- <fis a c e>-- |
  \duo {
    <g'=' b>2( <fis a>4) | <e g>2( fis4 | <b, e>2.) |
    b'='4( e fis | g2 fis8 g) | e2( b8 c) | d2( c8 b | <c, a'>8)( e c b a g |
    \time 4/4 fis=8^\tRit a c e r a~ <a c>~ <a c e>) \fermata |
    \time 3/4 <g=' b>2^\tATem a8( b) | <e, g>2^\tRit fis8( g=') |
  } {
    e'='2. | r4 cis dis | s2. | b'='2.~ | b8 e b e b4 |
    r8 g='8( e g e4) | e8[( b' gis e]~ e) r | s2. |
    \time 4/4 s2 fis='2 \fermata |
    \time 3/4 e='8( dis d cis) <c e>4 | cis8( c b ais) <a= dis>4 |
  } <g,= b e>2.~ | 4 r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  R2. | \duo {
    \stemDown e=4\( g b | \stemUp c2 b4~ | b2 b4~ | b2 b4\) |
    \stemDown c='4( b a | g2 fis4) | \stemUp b2( <a b>4) | r g b= |

    d,=4 \rest \clef treble g'='4\( fis | e2 d4 | c2 gis4 | b= %
    \clef bass \stemDown e,=4 fis8 g | g,4 \rest e'_~ \stemNeutral <a,=, e'>\) |
  } {
    s2.- \frBass | r4 e=4 r | r b r | r b r | s2. | s2. | r4 b2( | e=2.) |

    \rep 4 { s2. | } \clef bass a=2. |
  }

  <a= c>2. | \duo { r4 cis'='4( c=') | } { g=2( a4) | }
  b=4( ais <b, a'> | <e= g>2.) |
  \clef treble r4 g'='4\( fis | e2 d4 | c2 gis8 a | b=4. %
  \clef bass e,=8 fis[ gis] | a\) r r4 r |
  \duo { r8 fis=8~ <fis a>[~ <fis a c>8]~ 2 \fermata | } { d=1 | }
  g=4 r fis | b8 r r4 <b, fis' b> | e2.~ | e=4 r r |
}
{{ end }}
