{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key c \major
  \time 2/4
  g'='4\(\p\< c | c \af 4\! c | e e | d c\) |
  b='8\( c d4 | d g, | e' d | c2\) |
  r4\mf \acc { dis=''8 } e=''4 | r_ \dCre \acc { fis=''8 } g4 |
  r4 \acc { b=''8 } c='''4 | r4 \acc { dis='''8 } e4 |
  f='''4( d | f2) | g4(\> f | \af 2\! e='''2) \bar "||"

  \key ees \major
  r4\p <ees,='' g>8( aes) | r4 <ees g>8( aes) |
  r4 <g='' aes c>8( f) | r4 <aes c d>8( g) |
  r4 <f='' g b>8( ees) | <f g>( ees) <f g>( d) |
  ees=''8( g d f | ees=''2) |
  \rep 4 { <ees='' g>8 aes='' } | \rep 4 { <g='' aes c>8 f='' } |
  <f='' g d'>8 ees <f g b> b, | \rep 4 { <aes'='' c d>8 g='' } |
  \af 2\! <ees='' g c>2\> \keyCancelBarChange \bar "||"

  \key c \major
  <e,=' g>4\mf\< <e g c> | <f a c>4 4 | <g c e>4 \af 4\! 4 | <a d>4 <a c> |
  \duo { b'='8 c d4 | d g, | e' d~ | d c='' | } { f'='2~ | f | f( | e=') | }
  <e=' g>4 <e g c> | <e a c>4 4 | <e a c e>4 4 |
  \duo { d''=''8( c) b( a=') | } { <ees'=' a>4 <c=' fis> | }
  <b= f' g>4 <f' g b> | <f b d>\>^\tRit <f g> |
  <e=' g e'>4 <f a d> | \af 2\! <e=' g c>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \rep 8 { R2 | }
  g'='4\(-\frBass c | c c | e e | d8 c b a\) | g4\( b | d g, | e' d | c=''2\) |

  \key ees \major
  g='4\( c | d8 b c d | ees4 ees8 d | c g c ees\) |
  d=''4\( d8 c | b g b g | c g b4 | c8 g c,='4\) |
  g=4\( c | c c | ees ees | d c\) | b8\( c d4 | d g, | ees' d |
  c='8 g' c=''4\) \fermata \clef bass |

  \key c \major
  c,,=4-\stBass cM! | f, d@m! | e4 c@M! | fis4 d@M! |
  g=,4 g7! | b g@7! | gis4 e@d! | a4 am! |
  c=4( a8 g | fis4) a@m! | f4 a@m! | fis4 ees' |
  d=4 g@7! | g,4 g7! | c g@7! | c=4 cM! |
}
{{ end }}
