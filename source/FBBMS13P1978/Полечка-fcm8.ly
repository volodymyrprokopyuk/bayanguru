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
}
{{ end }}
