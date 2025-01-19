{{ define "rightHand" }}
\relative {
  \tempo Mederato
  \clef treble
  \key g \major
  \time 2/4
  e'='8\(\p\< g g g | a4 \af 4\! g | fis8\> e fis4 | \af 2\! e2\) |
  g='8\(\mp\< b b b | c4 \af 4\! b | a8\> g a4 | \af 2\! g2\) |
  b='8(\mf\< d d \af 8\! d | e4\> \af 4\! d) |
  g,='8(\mp\< b b \af 8\! b | c4\> \af 4\! b) | a8 g fis='4 |

  \duo {
    r8\< <fis'=' a>8 <g b>8 \af 8\! 8 | 8\f <b d>8 8 8 |
    <c='' e>4 <b d> | <e, g>8 <g b>8 8 8 | <a c>4 <g b> |
    <c,=' a'>8\> <b g'> <a fis'>4 | \af 2\! <g= e'>2 \fermata \bar "|."
  } {
    e'='2 | g4 fis | e8( fis) e( d) | e4 dis | e8( d) e( d) |
    e='4 e8 dis | b( c b=4) \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \major
  e'='8-\frBass b_\aSta e b | e b e b | a c b a | b g c b |
  e='8 d e d | e d e d | c ees d c | b8. c16 d8 e |
  f='8 g f g | f g f g | f e f d | f e f d | c e b=4 \clef bass |

  e,=2 | g8 d' g, d' | g, d' g, d' | c, c' b c | a c g d' |
  fis,=8 cis c b | fis'( e) fis,( \fermata e=,) \fermata |
}
{{ end }}
