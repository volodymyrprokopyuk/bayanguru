{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key e \minor
  \time 2/4
  \duo { b'='4(\p c8 b) | a4( b8 a) | g4( fis8 fis | e='2) | }
  { g'='2 | fis | e4 dis=' | s2 | }
  <d'=' b'>4( <e c'>8 <d b'>) | <c a'>4( <d b'>8 <c a'>) |
  <b= g'>4( <a fis'>8 8 | <g= e'>2) |

  \duo {
    g'='4(\< a8 a | \af 2\! b2) | d4(\> c8 b | \af 2\! e2) |
    b='4(\p a8 b) | a4( b8 a=') |
  } { d'='2~ | d | g( | g4 fis) | e2 | e=' | }
  <e'=' g>4( <b fis'>8 <a fis'> | <g= e'>2) |

  \duo {
    fis'='4(\mf g8 fis) | e4( fis8 e) | d4( cis8 cis | d4 cis) |
    fis='4( g16 b, fis' b,) | e4( fis16 b, e b) | d4( cis16 ais d cis=') |
  } {
    b=2 | b | b4 b | b ais | r16 d( cis b) s4 | r16 b16( cis b) s4 |
    r16 b=16( a g=) s4 |
  }

  b=4. cis8 | <a d>4(\< <b e>8 8 | <cis fis>4) a16( b d \af 16\! fis=') |
  \duo {
    a'='4(\> g8 fis | \af 4\! e4) dis16( fis a c) | b4(\mp c8 b) | a4( b8 a=') |
  } { b=2 | cis4 s4 | e2 | e=' | }
  <b,= g'>4\> <a fis'>8^\tRit 8 | \af 2\! <g= e'>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
}
{{ end }}
