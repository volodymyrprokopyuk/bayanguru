{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  e''=''8\p c d b | c4 c8 d | e c d b | c4 e |
  a,='8 a g b | c c c c | a a g b | c4 c='' |

  c=''16(\mp^\tAcc g e'8) d16( g, g'8) | c,16( d c b a g a b) |
  c=''16( g e'8) d16( g, g'8) | e16( d c d e f fis gis) |
  a=''16( e c'8) b16( e, e'8) | c16 d c b a f a b |
  c='''16_\dCre a e' a, b e, e' e, | a c b a g f e d='' |

  <g,=' c e>4\f <f g d'> | <e g c> <g c e>8 <g b d> |
  <g=' c e>4 <g d' f> | <g e' g> <gis d' e gis> |
  <a=' c e a>4 <d g b d> | <c e g c> <a c e a>8 <g c e g> |
  <a=' c e a>4^\tRit <d g b d> | <c='' e g c>2 \bar "||"

  \tempo Lento
  \key c \minor
  g'=''2\(\pp\< | \af 2\! aes | ees\> | \af 2\! c\) |
  g'=''2\( | aes | bes~ | bes4\) b | c2\( | f, | ees | c\) |
  aes='2( | g | c,8)\> g'-. c-. g'-. | \af 2\! c='''2-- %
  \keyCancelBarChange \bar "||"

  \tempo Allegro
  \key c \major
  e,=''8\mf c_\aSta d b | c4-- c8 d | e c d b | c4-- e-- |
  a,='8 a g b | c c c c | a a g b | c4-> \acc { b'=''8 } c='''4-> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c@M!8[-\stBass a@m!8] f@M!8[ g@7!8] | c@M!8[ a@m!8] c@M!8[ f@M!8] |
  a@m!8[ c@M!8] d@m!8[ e@7!8] | \rep 2 { a@m!8[ c@M!8] } |
  d@m!4 e@m!4 | \rep 2 { a@m!8[ c@M!8] } | f@M!4 g@7!4 | c@M!8[ f@M!8] c@M!4 |

  e=8 c@M! f,8 g@7! | e'8 c@M! f,8 d@m! | g8 c@M! d'8 g@7! | c8 cM! b e@7! |
  c=8 a@m! e8 e7! | a, am! f f7! | fis a@m! gis8 e@7! | a8 am! b=, g@7! |

  c=8-\puBass a b g | a g a b | c a b g | c d c b |
  a=,8 a g b | c c c c | a a g b | c g c=4 \clef treble |

  \key c \minor
  \meter 1/2 #'(1)
  r8 ees''=''-\frBass d c | r f ees d | r g, aes g | r bes aes g |
  r8 ees'='' d c | r bes c d | r d( ees f | g f ees d) |
  c=''8( bes aes g) | bes( aes g f) | r g aes g | r g ees d |
  r8 c='8 d c | r f( ees d | c2) | r8 g''8 c,=''4 |

  \key c \major
  \meter 1/4 1,1
  c=''8 g b g | e g e g | c g b g | e g a g |
  f='8 e f d | a' g a g | f e f d | e g c,='4-> |
}
{{ end }}
