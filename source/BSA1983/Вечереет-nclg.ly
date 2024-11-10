{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key d \minor
  \time 3/4
  \partial 4 { d'='8\(\pp d | }
  g='4. f16 e d8 bes' | \time 2/4 a g16 f a8 g | d4\) f8\(\p d |
  \time 3/4 g='4\< <d a'> <g bes>8 \af 8\! <f d'> |
  \time 2/4 \duo { c''=''8 d='' } { e'='4 } <d f>8\> <c g'> |
  \af 8.\! <f=' a>4\) %
  \duo {
    c''=''8\( a | \time 3/4 bes4. a8 g[ e] | \time 2/4 <f a> <d a'> a' g |
    d='4\) c'8( bes | a4) c8( a | \time 4/4 g2~ g8) f16( e d8 e |
    \time 2/4 <a,= a'>8\> <d a'> a' \af 8\! g | d2)_~ | d4 %
  } { f'='4 | d2. | s4 e4 | d2~ | d4 f | d8( c16 d bes2.) | s4 e='4 | s2 | s4 } %
  d='16\(\< e f \af 16\! g=' |

  \time 3/4 a='4.\mf e'8\f d c16 bes |
  \time 2/4 a='8. f16 a\> g e \af 16\! f | d4\) f8^\(\< d |
  \time 3/4 g='4 <d a'> <g bes>8 \af 8\! <f d'> |
  \time 2/4 \duo { <a'=' c>8\mf <bes d> <d, f> <e=' g> | } { e'='4 bes= | }
  \af 8.\! <a,= c f a>4\)\< %
  \duo {
    c''=''8\(\f a | \time 3/4 <bes, bes'>4. <c a'>8 g'[ e] |
    \time 2/4 a='8 a a g | d\)\> <e d'>( <f c'> \af 8\! <g bes> |
    <f=' a>4) <bes, f' c'>8( <c e a> |
    \time 3/4 g'='4.) a8( g f16 e | \time 2/4 a8 a a g |
    \af 2\! d='2)_~\> | d='4 \fermata %
  } {
    <c'=' f>4 | d8( e f4) d | <a f'>8 <a d> <a e'>4 | d2~ | d8 c s4 |
    d='8( c16 d bes2) | <a d>8 <a f'> <a= e'>4 | s2 | s4 %
  }
  d='8(\p d | \time 3/4 g4. f16 e d8) bes'( |
  \time 2/4 a='8\>^\tRit g16 f) a8-- \af 8\! g-- | <d=' d'>2--\pp \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \partial 4 { r4 | } | R2. | R2 | R2 |
  bes,=,4-\puBass a g | c d8( e | f e d4) | g,4.( a8 bes4 | a4.) a8 |
  c=8( bes a g | f e d4) | bes'8( a g2.) | f4 c'8( a) | d4 f8( e | d=4) r4 |

  R2. | R2 | d=8( c bes a | bes c bes[ a] g4) | c d8( c) | f( e d4) |
  g,=,4.( a8 bes4) | a8( bes c4) | bes8( c16 bes) a8( g | f' e d c |
  bes=,8 a) g( f16 g) e8( f16 g) | f4 c'8( a) | bes( a16 g f8 g |
  d'=2) \fermata | R2. | f4-- e-- | d=2-- \fermata |
}
{{ end }}
