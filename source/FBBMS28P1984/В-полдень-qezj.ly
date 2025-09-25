{{ define "rh1" }}
  {{ .a }} 8 8 <g c e> <a c f> <g c e> <f c' d>4 |
  | <c' e g>8 8 <e g c> <c e g> <a c f> <g c e> {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Moderato. Largamento"
  \clef treble
  \key c \major
  \time 4/4
  r4\mf <e'=' a c>4 <c f a>2 |
  \duo { g'='8(-- g-- g-- e f e d='4) | } { r4 c'='4 b=2 | }
  c='4(\> a) c'8( a g e | d4. e8 a,=4) \clef bass \af 4\! <d,= aes' b> |
  <e= g c>2\p \clef treble <e''='' c'>\pp |

  {{ template "rh1" (w `<c,=' e g>8\mf` `<f= c' d>4`) }} \clef bass |
  <e= g c>4 <e g a> <f a d> <f g> |
  <e= a c>8\< 8 8 <e g> <f= a d>4 \clef treble \af 4\! <b= f' g> |

  {{ template "rh1" (w `<c'='' e g>8\f` `<f=' c' d>4`) }} |
  <e=' gis b>4 <a e'>8 b \duo { c''=''8( b a e'='') | } { e'='2 | }
  <b=' d>2~ 8 r %
  \duo { <a'=' b>4 | <gis b>2. <g bes>8(\> <f aes> | \af 8\! <e=' g>) } %
  { cis'='8 dis | e2. d4 | c='8 } %

  r8 c'='''4(\p a g8 f | e4 g8 e d e f a | <g, c e g>2.) %
  \duo { d''=''8( f | g2.) g,8( d'='') | } { <f'=' d'>4 | <e b' d>2. f='4 | }
  <e=' a c>2\mf <c f a> |
  \duo {
    g'='8(--\>^\tRit g-- g-- e f e d='4) \clef bass |
    \af 1\! c='1-- \bar "|."
  } { c'='2 b | e,=1-- | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  a=8(---\frBass a-- a-- e f e d4) | r <a e'> <d f>2 | <e g>4( f) r %
  \duo { d'='8( c | a=4) } { <e= g>4( | f=) } r r ges,8( f=,) |

  c=,8_\aLeg g' c, g' \rep 9 { c,=,8 g' c, g'=, } |

  c,=,8 g' c e f g a aes | g c, d e f g a ais | b e, fis gis a b c4 |
  d='8 b g fis g a b4 | r8 e,, ais b e fis g4~ | <c,= g'>8 \clef treble %

  <c'=' e g>8[ 8 <g c e>] <a c f> <g c e> <f= c' d>4 \clef bass |
  <c= g'>8 \clef treble <c'=' e g>8[ 8 <g c e>] <a c f> <g c e> <f c' d>4 %
  \clef bass r8 c,=,8 g' c e g c4 | r8 e,, b' e g b( <g b>4) |
  a=8(-- a-- a-- e f e d4) | <a e'>2 <d f> | <c,=, g'>1 |
}
{{ end }}
