{{ define "rightHand" }}
\relative {
  \tempo Tranquillo
  \clef treble
  \key c \major
  \time 2/4
  \duo {
    \partial 4 { e'='8(\mf f | }
    g='8 g g g | a g f e) | g( f e f | d4) d8( e |
    f='8 f f f | g f e d) | c( d e f | <e g>4) c'8( b |
    a='8 c b a) | g( b a g) | f( a g f | e4) e8( e |
    a='8 g f e | d a') b( a | c\> g f \af 8\! d | c='4) %
  } {
    s4 | e'='4 e | e r | c2 | b4 r | c2 | b | bes~ | bes4 r |
    f'='2 | d | c | b4 r | cis2 | a4 dis | e a,8 b= | s4 %
  } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  c'='4-\frBass b | <a c> r | <d, a'>2 | <g, f'>4 r |
  <d'= a'>2 | <g, f'> | e'4 d | c r | <f c'>2 | <e b'> |
  <d= a'>2 | <d gis>4 r | <a g'>2 | f'4 fis | g( g,) | <c= e> r |
}
{{ end }}
