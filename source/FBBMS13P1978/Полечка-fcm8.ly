{{ define "rh1" }}
  \repeat volta 2 {
    {{ .a }} c bes8) g-. ees-. | bes'16( c bes8) aes-. f-. |
    bes='16( c d ees f8) c16( d |
    \alternative {
      \volta 1 { ees=''16 f g8) f-. bes=''-. | }
      \volta 2 { ees,=''16( f ees d) <g,=' ees'>4 | }
    }
  }

{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key ees \major
  \time 2/4
  bes''=''16(\mf c bes8) g-. ees-. | R2 |
  f=''16(\> g aes c bes4) | aes16( g f ees \af 4\! bes='4) |

  {{ template "rh1" (w `bes='16(\mp`) }}

  \repeat volta 2 {
    <ees'='' g>8\f 16( <d fis>) <des f>8 16( <c e>) |
    \duo { ees''=''8 ees16( d) c8( g'='') | } { b'='8 b c=''4 | }
    \alternative {
      \volta 1 { a='16( b c8) b16( c d8) | c16( d ees fis) <b,=' g'>4 | }
      \volta 2 { a='16( b c8) b16( c d ees) | c( d c b c=''4) | }
    }
  }

  {{ template "rh1" (w `bes='16(\mf`) }} \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key ees \major
  R2 | bes'='16(-\frBass c bes8) g-. ees-. | R2 | f16( g aes c bes='4) |

  r8 <ees,=' g>8[ bes c] | r <d fis>[ c d] | aes f' aes, f' |
  g,=8 ees' d bes= \clef bass | <g= bes>8 <f bes> <ees= bes'>4 |

  c=8 g' aes4-- | g8 f' <c ees>4 | <fis, d'>8 d <g d'> d |
  <fis= d'>8 d g16( f ees d) | <fis d'>8 d <g d'> f' |
  <c=' ees>8 aes <c,= g'>4 |

  ees=8 <ees' g> bes c | ees, <d' f> c d | <ees, aes> bes' d bes |
  <ees,= g>8 bes' d bes | <g bes> <f bes> <ees= bes'>4 |
}
{{ end }}
