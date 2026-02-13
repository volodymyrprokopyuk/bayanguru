{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 1,1,1
  a'='8(->\p\< <c e>)-. b-> <c e>-. a(-> a')-. |
  a,='8(-> <c e>)-. b-> <c e>-. a(-> a')-. |
  e=''8\mp e d e c4 | e8 e d e a,4 | c8 c d b a4 |
  c=''8 c d b a4 | c8(-> e)-. d-. b-. a(-> a')-. |
  e=''8 b d4 a8(-> a'='')-. |

  \duo {
    \rep 2 { r8 <c''='' e>8[ 8 <b d>] <c='' e>4 | }
    r8 <b=' d>8[ 8 <a c>] <b d> <a c> |
    r8 <a=' c>8[ 8 8] r <ees a> | r8 <c e>8[ 8 8] r <e a> |
    e='2\> \af 4\! <a,= a'>4 |
  } {
    a'='2.->\mf | g-> | f-> | e4.-> d8 c4 | b2-> a4 |
    r8 <b= c>8[ 8 8] r <c=' e> |
  }

  a,,=8(->\p c) e d c e | a,16 b c8 e d e a,= |
  \duo {
    r8 <e'=' a>8[ r <f b> r <a c>] | r <a c>[ r <b d> r <c e a>] |
    e=''4. d8 c=''4 |
  } {
    c'='4-> d-> e-> | f-> g-> a-> | r8 <g a c>8[ 8 <f a c>] r <d=' f a> |
  } | <c=' e a>8 8 <d f b>8 8 <c=' e a>4 |

  a=16\mf e a c b d c b a e' a e | c_\dCre d e f g a g f e g c e='' |
  \duo {
    <e''='' g>8[-. 8-. 8-. <d f>]-. <c e>4-- |
    <g=' c>8 8 <b d> <d f> <c e>4 | <a c>2 <e e'>4 | c'4. b8 a='4 |
  } {
    c''=''4. a8 g4 | e4 g8 a g4 | r8 <g e'>[ 8 <f d'>] r <a c> |
    r8 <ees=' f a>8[ 8 <b d>] r <c=' ees> |
  }

  a,='8(->\p <c e>16 b) <c e>8-. b-. a(-> <e' a>)-. |
  a,='8(->_\dCre <a c>16 <b d>) <c e>8-. <b d>-. a(-> <e' a>)-. |
  <a='' c>8(-> g)-. <f a c>-. 8-. <e a c>(-> d)-. |
  <c='' e a>16(-> b' <e, a c>8)-. <f='' a d>-. 8-. %
  \duo { c'''='''4 | } { r8 <e''='' a> | }
  <c='' e a>8(-> g')-. <a, d f>-. <f a d>-. <e c' e>(-> a)-. |
  <f=' a c>8(-> d')-. <f, a c>-. b='-. \duo { a'='4 | } { r8 <c'=' e> | }

  a,=16 b c d dis e fis gis a b a gis | a b c d dis e fis gis a b c d |
  a=''16 c a c aes c aes c g c f, c' | e, g e g d g d g c, d c b |
  a='16 e' a e a, c b c a='4 |

  a,=8(-> c)-. e-. d-. c(-> e)-. | a,16(-> b cis8)-. e-. d-. cis(-> a=)-. |
  \duo {
    \time 4/4
    r8\< <e'=' a>8[ r <fis a> r <a cis> r \af 8\! <b d>] |
    \time 3/4
    r8 <d='' fis>8[ 8 <cis e>] r <cis='' e> |
  } { cis'='4-> d-> e-> fis-> | gis2-> a='4\f | }

  a'='8(->\p\< <c e>)-. 8-. <b d>-. a(-> a')-. |
  a,,=8(->^\tRit <c e>)-. b-. <c e>-. a(-> \af 8\! <e'=' a>)-. |
  \duo {
    r8\> <ees'=' f a>8[ 8 <f b>] r <a c> |
    r8 <ees'='' f a>8[ 8 \af 8\! 8] <c='' e a>4\pp \fermata \bar "|."
  } { c'='2-> e4 | a='2.-> \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \meter 1/4 1,1,1
  \rep 4 { R2. | }
  r8 a@m![-\stBass r8 d@m! r8 a@m!] | r8 d@m![ r8 d@m! r8 a@m!] |
  c=8 cM! d dm! a r | g gM! f d@m! e'=8 a@m! |

  \rep 5 { a,=,8[-. r r a]-. a=,4-- | } | r8 a[ a a a a=,] |

  a=,8 am! r e'-. a, am! | e' a@m! r8 g,-. c f@M! |
  a=,8[ r g r c] r | d dm! e em! a,4 | c8 cM! d dm! f fM! |
  c=8 a@m! b8 d@m! a8 e'= |

  a,=,8 am! b e@7! c8 a@m! | c8 cM! b g@7! c8 cM! |
  c=8 b bes g c cM! | g c@M! g8 g7! c cM! |
  a=,8 c@M! d8 dm! c a@m! | f,8[ f7! f7] g a=,4 |

  \rep 4 { \rep 3 { a=,8-. e'=-. } | }
  a,=,8 g@M! a8 g@M! a8 f@M! | d+dm!8 r f+d@m! r8 a=, r |

  r8 a+am! r e=,[-. a]-. r | r c+a@m! r8 e[-. a]-. r |
  f'=8 fM! e f@m! d8 dm! | g, c@M! g8 g7! e' e7! |
  a,=,8 am! f fM! a=, am! |

  a@m!8[ am8] a@m![ f@M!8] a@m!8[ am8] | c@M!8[ cM8] c@M![ d@M!8] a@m!8[ am8] |
  a=,8[-> r b-> r cis-> r d]-> r | e4-> e-> a,-> |
  \rep 2 { a=,8-> r r e'[-. a,=,]-> r | }
  f=,8[ f7! f7 f7] a am! | f[ f f f] a=,4 \fermata |
}
{{ end }}
