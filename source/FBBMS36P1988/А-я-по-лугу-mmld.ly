{{ define "rh1" }}
  {{ .a }} b' g {{ .b }} b e, b' g \af 16\! b |
  e,=''16\> b' g b e, b' g \af 16\! b='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 2/4
  {{ template "rh1" (w `e''=''16\p\<` `_ \aSta`) }}
  {{ template "rh1" (w `e,=''16\<` ``) }}
  e,=''16\< b' g b e, b' g \af 16\! b | e,\> b' g d' a e' c \af 16\! e |
  a,=''16\< e' c e b e a, \af 16\! e' | g,\> e' b e a, e' c \af 16\! e |
  c='''16\< e fis, e' g, e' fis, e' | b e g, e' e,8( \af 8\! b'='' |

  b=''4.\mf a8 | g4) e8( g | b4. a8 | g4) fis8( fis | fis a g fis |
  e=''4.) c8 | c e <b d> <a c> | <g=' b e>4-- e16 g e g |

  b='16_\aNLeg e b e a, e' c e | b a g fis e g e g |
  b='16 e b e a, e' c e | b g' e b' a b c b |
  a=''16 g fis e dis e dis b | e fis e b a b c b |
  a='16 g fis e d e fis a | g a b d='' %

  \duo {
    g'='8(\f b | d4.^\tAcc c8 | b4) g16( a b c | d4 d8 c | b4) %
  } { s4 | r8 e'='8( fis4) | g r4 | b8( d,) e( fis) | g( d=') } %

  <d,=' fis>8 <e g> | <fis a> <g b> <a c> <c e> |
  <b=' d>8 <b g'> <d fis> <e g> | <d fis> <c e> <b d> <a=' c> |

  \duo {
    <g'=' b>8( <fis a>) \af 8\! s4\< | r8 \ff <c' e>8[ 8] 8 |
    r8 <b=' e>8 s4 | r8 <d g>[ r8 <c e>] | r8 <b=' d> %
  } {
    dis'='4 <e e'>8 <g g'> | <b b'>4. <a a'>8 |
    <g=' g'>4 <e e'>8 <b' b'>8 | 4 <a a'>4 | <g=' g'>4 %
  }

  fis'=''16\mf g a g | fis e d c b a g fis |
  e='16\< b e g fis g a \af 16\! b | c^\tRit d e fis g b fis b='' |
  \duo { r8\f <g''='' b e>8 } { e''=''4 } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R2 | r4 e'='8( b' | b4. a8 | g4) e8( b' | b4. a8 |
  g='4) fis8( fis | fis a g fis | e4) fis16( g a8 |
  a='8 c b a | e='4) r4 |

  r8 <c'='' e fis>8[_\aSta 8 8] | <b cis e>8 8 r4 |
  r8 <c='' e fis>8[ 8 8] | <b cis e>8 8 r e( |
  d=''8 c b a | g b) fis16 g a8 | a fis~ fis e~ |
  e='8 \clef bass e,=-- r4 |

  e=8-\stBass em! fis, a@m! | g8 e@m! b8 e@m! |
  g=,8 e@m! fis8 a@m! | e'8 em! c a@m! |
  e=8 a@m! fis,8 b@7! | g8 e@m! c8 a@m! |
  fis,=,8 a@m! a8 d@7! | b=,8 g@M! r4 |

  g=,8 c@M! a8 d@7! | g8 gM! d' g@M! |
  g,=,8 gM! a d@7! | g8 gM! c b |
  a=,8 am! a d@7! | b8 g@M! c8 a@m! |
  d=8 d7! a d@7! | b4 g=,8 e@m! |

  g=,8[ c@M! cM8 cM] | b e@m! g8 e@m! |
  d'=8 g@M! c8 a@m! | b8 g@M! a8 am! |
  c=8 a@m! dis8 b@7! | e8 em! c a@m! |
  c=8 c7! b b7! | e@m![ e=8] r4 |
}
{{ end }}
