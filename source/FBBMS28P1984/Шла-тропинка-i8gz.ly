{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  f'='4(\mp\< c' | bes8 a16 bes a8 \af 8\! g | f4.\> \af 8\! f8) |
  f='4(\mf\< c' | bes c8 \af 8\! bes | a='4) %
  \duo {
    c''=''8( c | d c bes a | g g  c bes | a4) f8( f |
    g='8[ f e d] | c[ c d e] | f='4) %
  } {
    a'='4~ | a bes8 a | g f e4 | f8 e d4 | d4. d8 | c bes4 bes8 | a=4 %
  } r4 |

  r16\mf c=''16( <f a> c) r c( <f a> c) |
  r16 c=''16( <f a> c) r c( <g' bes> c,) |
  r16 c=''16( <f a> c) <f g> bes, <f' g> bes, |
  r16 a='16( <c f> a) r a( <c e> a) |
  r16 g='16( <d' e> g,) r g( <c e> g) |
  r16 f='16( <c' d> f,) <a d>\( f <a c> fis |
  <g=' bes>16 f <a c> e <bes' d> d, <a' c> d, |
  <g=' bes>16 d <f bes> d\) %
  \duo { bes'='8( c | a='4) } { e'='16( d f e | f='4) } <f=' a f'>8 8 |
  <g=' b g'>8\f <f b f'> <e b' e> <f=' g d'> |
  \duo { c''=''8 c d e | f=''4-- } { <e'=' g>4 f8 g | a='4-- } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  \rep 3 { R2 | } | f'='2(~ | f4 e | f) e( | ees d | e8 d c c |
  d='4) \clef bass c='4 | b8 bes4 bes8 | a g c, c | f16 g a c bes g d e= |

  f=4( c' | bes8 a16 bes a8 g | f4. f8) | f4( c' | bes c8 bes | a4) c8( c |
  d='8 c bes a | g g c bes | a e) d c | b a g b | c bes a g | f c f=, 4 |
}
{{ end }}
