{{ define "lh1" }}
  {{ .a }} am! c a@m! | b8 b7! fis b@7! | e'8 em! {{ .b }} e@m! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 2/4
  \meter 1/2 #'(1)
  R2\mp | R2 | R2 | r4 b'='8(\< b | c b a \af 8\! g |
  b='8\> a g fis | \af 8.\! e4) b'8(\< b | \acc { d=''8 } c b a \af 8\! g |
  b='8\> a g fis | \af 8.\! e4) g8(\< g | a g fis \af 8\! e |
  b=4 g'8 fis | \af 4\! e4) g8(\< b | a g fis \af 8\! e |
  b=4\> g'8 fis | \af 8\! e4) e'16\pp e' b e=''' |

  \meter 1/4 1,1
  e,=''16_\aSta e' g, d' e, e' b e | e, e' c e e, e' a, e' |
  e,=''16 b' e b e, e' g, e' | e, e' g, e' e, e' b e |
  e,=''16 e' c e e, e' a, e' | e, <g b e>16 16 e r8 <b=' e_~ g^~> |

  <c=''_~ e g>4 <c e a> | <e g b>8 8 <c e g> <c e a> |
  \duo { <g''='' b>8( <fis a>) <e, g>4~ | 4 <e=' a> | }
  { e''=''4 e,8( d | c='2) | } | r8 <e,=' g b>8^\tRit r <fis b d> |
  r8 <g=' b e>8 \fermata g16^\tAcc a g e=' |

  c='16 e a b a g fis e | dis e fis g a b cis dis |
  e=''16 g e b' g a g e | c e a b a g fis e |
  dis=''16 b fis' b, b' b, dis b | e b g b e fis g b='' |

  \duo {
    a''=''8[ g fis e] | dis b g' fis | e4 e,16 fis g b |
    a='8[ g fis^\tRit e] | dis b g' fis | e='4 \fermata %
  } { c''=''2 | a4 b8 a | g4 s4 | c,2 | a4 b8 a | g=4 \fermata } %
  r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=8(-\frBass <g b>) e( <a c>) | e( <g b>) e( <bes' c>) |
  e,=8( <g b>) e( <a c>) | e( <g b>) b,( <e g>) |
  a=8( <e g>) b( <e g>) | a( <d, fis>) c( <d fis>) |
  g,=,8( e') b( <e g>) | a( <e g>) b( <e g>) |
  a=8( <d, g>) b( <dis fis>) | b( <e= g>) r4 |
  \meter 1/2 #'(1)
  c'='8( b a g | g a b a | g fis) e4( |
  c'='8 b a g | g a b a | g=4) b8( b |

  c='8 b a g | b a g fis | e4) b'8( b |
  c='8 b a g | b a g fis | e4) g8( g |
  a=8 g fis e | b4 g'8 fis | e4) g8( b |
  a=8 g fis e | b4 g'8 fis | e=4) \fermata r |

  \meter 1/4 1,1
  {{ template "lh1" (w `a,=,8-\stBass` `b=,`) }}
  {{ template "lh1" (w `a=,8` `g,=,`) }}
  a=,8 am! c a@m! | b8 b7! dis b@7! | e8 em! g, e@m! |
  a=,8 am!4 am8 | b=, b7!4 b78 | e@m!4-\fermata r4 |
}
{{ end }}
