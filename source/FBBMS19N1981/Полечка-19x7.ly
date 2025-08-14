{{ define "rh1" }}
  g='16 a b c d8 f | e16(-> d c8)-. g( \acc { fis'=''8 } g=''8) |
{{ end }}

{{ define "lh1" }}
  \rep {{ .a }} { e,=8 <d' e> gis, <d'=' e> | }
{{ end }}

{{ define "lh2" }}
  {{ .a }} <f g> b <f g> | c' <e, g> a <e= g> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      a'='16(->\mf b c8)-. b-. a-. | b-. e-. e,4-- | b'8-. e-. e,4-- |
      b'='8 d c b | a16(-> b c8)-. d16( c b a) | b8-. e-. e,4-- |
      b'='16(-> c d8)-. c-. b-. |
      \alternative {
        \volta 1 { a='4 a'=''8 r | }
        \volta 2 { a,='8 c a \fine \bar "!!" b16 a=' | }
      }
    }

    \volta 2
    \repeat volta 2 {
      {{ template "rh1" }}
      f=''16(-> e d8)-.  g,( \acc { fis'=''8 } g8) |
      e=''16(-> d c8)-. c16(-> b a8)-. | {{ template "rh1" }}
      \alternative {
        \volta 1 { a=''8[ f e d] | g[ e d c=''] | }
        \volta 2 { a'=''8[ f d b] | e4-- e,='-- \bar "||" }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a=8-\frBass <c e>_\aSta e, <c' e> | {{ template "lh1" (w `3`) }}
  a=8 <c e> e, <c' e> | {{ template "lh1" (w `2`) }}
  a=8 <c e> a, r | a' <c e> a= r |

  {{ template "lh2" (w `b=8`) }} | b'=8 <f g> b <f g> | c'[ <e, g>8 8] r |
  {{ template "lh2" (w `b'=8`) }} | d=8 <f a d> b, <f' g> |
  c=8[ <e g>8 8] r | d[ <f a d>8 8] r | e[( f)-. fis( gis=])-. |
}
{{ end }}
