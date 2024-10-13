{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  <a'=' e'>8(\mf c16 <d f> <c e>8 <b d> | <c e> d16 b a8 c) |
  c=''16( a b8 a <e e'>) | e'16( c <b d>8 a4) |
  \duo {
    <c''='' e>8.( <b d>16 <c e>8. <b d>16 | e8 d16 b a8 c) |
    c=''16( a b8 a <c e>) | e16( c d8 a='4) |
  } { e'='4 e | c'8 g dis4 | e2 | g8 gis a='4 | }

  r16\mf\< e='16( fis gis a b c d | e f fis g a b \af 8\! <e, c'>8) |
  \duo {
    g''=''4( e8 d | <a c> <g b> a4) | <g c>8.(\mf <f b>16 <e a>8. <d g>16) |
    r8 d'=''8( c a) | c16(\< a b8 a \af 8\! f') \fermata |
    g=''8(\> g16 e \af 4\! a=''4) \bar "|."
  } { e''=''8 d c bes | s2 | s2 | e,2 | g4 a | c8 d c=''4 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  c'='8(-\frBass b a4) | g f | e8( d c4) | f8.( g16 a4) | a8( g fis f) | e4 f |
  \duo { a=8 gis a fis | c'( b a=4) \clef treble | e'='2 | g=' | }
  {
    fis=8( e16 d c8 d) | e4 a,=, \clef treble |
    e''='8( d c16 b a8) | g'( f e16 d c='8) |
  }

  c''=''16( a b8 a f) | e16( c d8 a c) | e( d c b | c8. b16 a8 c) |
  e='4( f8 d) \fermata | \duo { e'='4 e=' | } { c'='16( a b8 a=4) | }
}
{{ end }}
