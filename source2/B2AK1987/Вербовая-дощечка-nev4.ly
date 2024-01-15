{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  e'='8(\p b') b b | a4( b8 g) | a4\( b8 g | fis e b'4\) |
  e,='8( b') b b | a4( b8 g) | fis4\( g8 fis | e\) e e4 |
  e='8\(\mp <g b>8 8 8 | <fis a>4 <g b>8 g\) |
  \duo { fis'='4\( g8 fis | e\)\> e \af 4\! e='4 | }
  { d'='2\( | e8\) e e='4 | }

  r8\mp <b=' e g b>8[ r8 8] | r <c e fis a>[ r <b e g>] |
  r8 <a=' c e fis>8[ r <b e g>] | r <g e'> <fis a b dis>4 |
  <e=' b' e>4\< <e b' d> | <e a c> \af 4\! <e b' d> |
  <e=' a c>4\> <dis a' b dis>4 | \af 2\! <e=' g b e>2 |

  \duo {
    e''=''8[(\< b') b b] | a4( b8 \af 8\! g) |
    fis=''4(\> g8 fis | e8) e \af 4\! e=''4 |
  } { b'='2 | cis | d | e8 e e=''4 | }

  e'=''16(\mf g b8) b16( e, g b) | a( c, e a) b( g e b) |
  a='16( c, e a) b( b, e g) | fis( a, c e) %
  \duo { b'='4 | } { b'='16 a g fis=' | }

  \duo {
    b'='2\(\< | c4 \af 4\! cis |
    d=''4 dis | e8\)\> e \af 4\! e4 |
    e=''8\(\< b' b b | a4 b8 \af 8\! g\) |
    fis=''4\(\> g8 fis | e-- e-- \af 4\! e=''4\)-- \bar "|."
  } {
    e'='2~ | e2 | fis4( g8 fis | e2) |
    <e=' b'>8 <b' e> <b f'>4 |
    <c='' e>4 <cis g'>8 <a cis> |
    <b=' d>2 | <g c>8-- <fis c'>-- <e=' b'>4-- |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=8-\stBass em! g, e@m |
  \rep 2 { a=,8 am! g=, e@m! | }
  a=,8 am! b b7! | e em! d e@m | c8 a@m! b8 e@m! |
  a=,8 am! b b7! | e em! b e@m |
  e=4-\puBass d | c b | d b |
  \duo { r4 em! | } { e=2 | }

  e,=,8( b') b b | a4( b8 g) |
  a=,4( b8 g | fis e b'4) |
  e,=,8( b') b b | a4( b8 g) |
  fis=,4( g8 fis | e) e e=,4 |

  g=,4( gis | a2) | b4.( d8 | e c e=4) |

  e=8-\stBass em! g, e@m | a8 am! b e@m! |
  c=8 a@m! b8 e@m | a8 am! b=, b7! |

  e,=,8\(-\puBass b' b b | a4 b8 g\) |
  a=,4\( b8 a | g fis e4\) |
  g=,4( gis | a2) | b4.( d8 | c)-- a-- <e=, b'>4-- |
}
{{ end }}
