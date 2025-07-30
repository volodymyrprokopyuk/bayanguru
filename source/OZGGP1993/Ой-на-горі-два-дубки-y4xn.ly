{{ define "lh1" }}
  {{ .a }} a' b, gis' | c, a' cis, a' | d,4. c8 | b4. b8 |
  e,=,8 e' e, e' | f, f' e, e'= |
{{ end }}

{{ define "lh2" }}
  {{ .a }} r e r | a,=,, r r4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  \duo { c''=''4 b | a g | }
  { c''=''16(\mf c, e a) b( d, e gis) r8 <c, e>[ r e='] | }
  d'='8 e <d f>4 | <d f>8 <e g> <f a>4 | <e a c>8 8 8 d' |
  <ees,=' a c>4 <d gis b> | <c=' e a>2~ | 8 r r4 |

  <c=' e>8 8 8 8 | \duo { c''=''4 b | a2~ | a=' | }
  { r8 <d'=' e>8[ r8 8] | \rep 2 { r8 <c=' e>8[ r8 8] | } | }
  <b= f' g>8 8 8 <b a'> | \duo { g'='4 f | e2~ | e=' | }
  { r8 b=8[ r b] | r <g c>8[ r8 8] | r <gis d'>8[ r8 8] | }

  \repeat volta 2 {
    <e=' c'>4 <d b'> | <c e a> <e g> | d8 e <d f>4 |
    <d=' f>8 <e g> <f a>4 | <e a c>8 8 8 d' | <ees, a c>4 <d gis b> |
    \alternative {
      \volta 1 { <c=' e a>2 | r4 fis16 gis a b=' | }
      \volta 2 { <c,=' e a>2~ | 8 r r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8-\frBass`) }} {{ template "lh2" (w `a,=,8`) }}

  a'=,4 e | b' e, | a e | a e' | d g, | d' g, | c g | b e,=, |

  {{ template "lh1" (w `a=,8`) }} | a,=,4 e' | b'16 c d e r4 |
  {{ template "lh2" (w `a,,=,8`) }}
}
{{ end }}
