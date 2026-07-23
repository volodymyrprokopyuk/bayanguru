{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 4/4
  c'='8(\mf e g e c' g e' c | g' d b d g, b d, g) |
  d='8( f a f d' a f' d | a' e c e a, c e, a) |
  f='8( a c a f' c a' f | c' g e g c, e g, c) |
  g='8( b d b g' d b' g | c g e g c, e g, c='') |

  <g=' c e>4-. r <e g c>-. r | <d g b>-. r r2 |
  <a'=' d f>4-. r <f a d>-. r | <e a c>-. r r2 |
  <c'='' f a>4-. r <a c f>-. r | <g c e>-. r r2 |
  <g=' d' f>4-. r <f g d'>-. r | <e=' g c>4-. r4 r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-.-\frBass r <e g>-. r | b-. r <d g>-. r |
  d=4-. r <f a>-. r | c-. r <e a>-. r | f-. r <a c>-. r |
  e=4-. r <g c>-. r | d-. r <f g>-. r | <c= e g>-. r r2 |

  c,=,8( e g e c' g e' c | g' d b d g, b d, g) |
  d=,8( f a f d' a f' d | a' e c e a, c e, a) |
  f=,8( a c a f' c a' f | c' g e g c, e g, c) |
  g=,8( b d b g' d b' g | c g e g c,=4) r |
}
{{ end }}
