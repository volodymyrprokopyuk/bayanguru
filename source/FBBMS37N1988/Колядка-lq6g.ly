{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 3/4
  \meter 1/4 1,1,1
  a'='8->\p\< <c e>-. b-> <c e>-. a(-> a')-. |
  a,='8-> <c e>-. b-> <c e>-. a(-> a')-. |
  e=''8\mp e d e c4 | e8 e d e a,4 | c8 c d b a4 |
  c=''8 c d b a4 | c8(-> e)-. d-. b-. a(-> a')-. |
  e=''8 b d4 a8(-> a'='')-. |

  \duo {
    \rep 2 { r8 <c''='' e>8[ 8 <b d>] <c='' e>4 | }
    r8 <b=' d>8[ 8 <a c>] <b d> <a c> |
    r8 <a=' c>8[ 8 8] r <ees a> | r8 <c e>8[ 8 8] r <e a> |
    e='2\> \af 4\! <a,= a'>4 |
  } {
    a'='2.->\mf | g-> | a-> | e4.-> d8 c4 | b2-> a4 |
    r8 <b= c>8 8 8 r <c=' e> |
  }

  a,,=8(->\p c) e d c e | a,16 b c8 e d e a,= |
  \duo {
    r8 <e'=' a>8[ r <f b> r <a c>] | r <a c>[ r <b d> r <c e a>] |
    e=''4. d8 c=''4 |
  } {
    c'='4-> d-> e-> | f-> g-> a-> | r8 <g a c>8[ 8] <f a c> r <d=' f a> |
  } | <c=' e a>8 8 <d f b>8 8 <c=' e a>4 |

  a=16\mf e a c b d c b a e' a e | c_\dCre d e f g a g f e g c e='' |
  \duo {
    <e''='' g>8-. 8-. 8-. <d f>-. <c e>4-- |
    <g=' c>8 8 <b d> <d f> <c e>4 | <a c>2 <e e'>4 | c'4. b8 a='4 |
  } {
    c''=''4. a8 g4 | e4 g8 a g4 | r8 <g e'>[ 8 <f d'>] r <a c> |
    r8 <ees=' f a>8[ 8 <b d>] r <c=' ees> |
  }

  a,='8(->\p <c e>16 b) <c e>8-. b-. a(-> <e' a>)-. |
  a,='8(->_\dCre <a c>16 <b d>) <c e>8-. <b d>-. a(-> <e' a>)-. |
  <a='' c>8(-> g) <f a c>-. 8-. <e a c>(-> d)-. |
  <c='' e a>16(-> b' <e, a c>8) <f='' a d>-. 8-. %
  \duo { c'''='''4 | } { r8 <e''='' a> | }
  <c='' e a>8(-> g') <a, d f>-. <f a d>-. <e c' e>(-> a)-. |
  <f=' a c>8(-> d') <f, a c>-. b='-. \duo { a'='4 | } { r8 <c'=' e> | }

  a,=16 b c d dis e fis gis a b a gis | a b c d dis e fis gis a b c d |
  a=''16 c a c aes c aes c g c f, c' | e, g e g d g d g c, d c b |
  a='16 e' a e a, c b c a='4 |

  a,=8(-> c) e-. d-. c(-> e) | a,16(-> b cis8) e-. d-. cis(-> a=) |
  \duo {
    \time 4/4
    r8\< <e'=' a>8[ r <fis a> r <a cis> r \af 8\! <b d>] |
    \time 3/4
    r8 <d='' fis>8[ 8 <cis e>] r <cis='' e> |
  } { cis'='4-> d-> e-> fis-> | gis2 a='4\f | }

  a'='8(->\p\< <c e>) 8-. <b d>-. a(-> a')-. |
  a,,=8(->^\tRit <c e>) b-. <c e>-. a(-> \af 8\! <e'=' a>)-. |
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
  \rep 4 { R2. | }
  r8 a@m![-\stBass r8 d@m! r8 a@m!] |
}
{{ end }}
