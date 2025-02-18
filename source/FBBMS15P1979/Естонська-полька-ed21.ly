{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \meter 1/2 #'(1)
  \repeat volta 2 {
    d'='8\<_\markup \dAlt mf pp g <d b'> \af 8\! <e d'> |
    <f=' d'>8(\>_\aSta <fis c'>)-. a \af 8\! fis | d\< fis a <a c> |
    <ais=' e'>8(\> <b d>)-. b \af 8\! g | d\< g <d b'> \af 8\! <e d'> |
    <f=' d'>8\> <fis c'> a \af 8\! fis | d\< fis <fis a> \af 8\! <e c'> |
    <d=' b'>8( <c g'>)-. <b= g'>4-> |
  }

  \repeat volta 2 {
    r8\p b=8(_\dCre <a d> g') | g( e)-. e4-- |
    e='8-. e16( fis <e g>8[)-. <c e>]-. | <c e>8( <b d>)-. 4-- |
    d'=''8(\f b g b) | d( c)-. c4-- | c8( a fis a) | a( g)-. g='4-- |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  g,=,8-\frBass d'_\aSta d, d' | \rep 2 { a=,8 d d, d'= | }
  \rep 2 { g,=,8 d' d, d'= | } \rep 2 { a=,8 d d, d'= | }
  g,=,8( e')-. <g,=, d'>4-> |

  g'=4(-- fis-- | e8 <g c>8)-. 4-- | r c,8( e16 fis) |
  g,=,8( g')-. g4-- | f8( <g d'>4 8)-. | e( <g c>4 8)-. |
  d=8( <g c>4 <fis c'>8)-. | g,( <g' c>)-. <g= b>4-- |
}
{{ end }}
