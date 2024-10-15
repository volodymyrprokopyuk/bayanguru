{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  g'='8(\p e c' a | b4 a8 b | e,2) | e4 <e fis> | <e g> %
  \duo {
    g'='8( a) | g2 | e4(\mf e' | <fis, d'>8 <e c'> <d b'>4) | b'8( a g e) |
    <fis=' a>4( d'8 c | b\> g \af 4\! a4) | e8\< fis g \af 8\! a=' |
  } { dis'='4 | e c8( b) | e2 | s2 | b4 c | s4 dis | e dis | e='2 | }

  <e=' g b>4\f <e b' d> | \duo { d''=''8 e fis4 | e8 fis g=''4 | }
  { <fis'=' a>4 <g b> | <a c> <b=' d> | }
  <c'='' e fis>4 <e fis c'> | <d g b> %
  \duo { b''=''8( a | \af 2\! e=''2)\> | } { cis''=''4 | d8 c b a=' | }

  g,='16(\mf e fis g a fis g a | <e b'>4) \duo { b'='16( c b a) | } { dis'='4 | }
  <e=' g>16( b cis dis e fis g a) | b( g a b c a b c | <b d>4) %
  \duo { e''=''16( c b a | \af 2\! <g=' b>2)\< | } { fis'='4 | s2 | }
  <e,=' g>4\f <e g c e> | <b' d>16( <c e> <b d> <a c> <g b>4) |
  \duo {
    <g'=' b>16( <a c> <g b> <fis a> g4) | <c, e fis> <b' d>8( <a c> |
    <d,=' b'>4)\> <g b>8( \af 8\! <fis a> | <e e'>4) b'16\< g a \af 16\! b |
    c=''8( g e' c | <d fis>16 <c e> <b d> <a c> b4) | d16( c b a g='4) \fermata |
  } {
    s4 e'='8 b | s4 e | s4 dis | s4 f | e g | s4 g8 e | fis dis e='4 \fermata |
  }
  fis='16(\mf g a b c e b' a | g e b g) %
  \duo { <g'=' b>8( <a cis> | \af 2\! <e=' g b e>2)\> \bar "|." } { dis'='4 | s2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
