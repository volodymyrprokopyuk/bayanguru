{{ define "rh1a" }}
  {{ .a }} <g c e>] dis'16 \af 16\! e | <a, c>8\> b \af 8\! <f a> |
  gis='8 a e | f e d='\) |
{{ end }}

{{ define "rh1b" }}
  s4 b'='8 | s4. | r8 a,4~ | a=8 r r |
{{ end }}

{{ define "rh2a" }}
  <d=' b' d>4(--\> <e c'>8 | b'4 \af 8\! a8 | {{ .a }} |
{{ end }}

{{ define "rh2b" }}
  s4. | b'8 g f=' | s4. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Largo
  \clef treble
  \key a \minor
  \time 3/8
  e'='8(\mf\< a b | c\> b \af 8\! a) | <a c>[( <c e>] <b dis>16 e |
  c=''8-> b a) | <c e>4(-> <b dis>8 | <c e> <b d> <a c> | <gis=' b>4.) |

  \repeat volta 2 {
    \duo {
      {{ template "rh1a" (w `<e'=' g c>8[\(\<`) }}
      \alternative {
        \volta 1 { {{ template "rh2a" (w `e='4.)\p \fermata`) }} | }
        \volta 2 {
          <d=' b' d>8.(\> c'32 b s8 | b4 \af 8\! a8 | <e=' e'>4.)\p \fermata |
        }
      }
    } {
      {{ template "rh1b" }} {{ template "rh2b" }}
      s4 <c'='' e>8 | b8 g f=' | s4. |
    }
  }

  e,=8\(\f a b | c b a | c[ e] dis16 e | c8 b a\) |
  <e'=' c' e>4\(->\ff <dis b' dis>8 | <e c' e>^\tRit <d b' d> <c a' c> |
  <b= gis' b>4.~ | 4.\) |
  \duo {
    {{ template "rh1a" (w `<e'=' g c>8[\(\p\<^\tATem`) }}
    {{ template "rh2a" (w `e='4.)\p`) }}
  } { {{ template "rh1b" }} {{ template "rh2b" }} }

  \duo { s4. | e''=''4. | e | a,=' | }
  {
    <c''='' e c'>8[^\(\mf\< <e e'>] <dis b' dis>16 \af 16\! <e e'> |
    <c='' a' c>8\f <b b'> <a a'> | <gis gis'> <a a'> <e e'> |
    \acc { <g=' g'>8 } <f=' f'>8 <e e'> <d=' d'>\) |
  }
  <d'='' b' d>8.[\( c32 b] <e c' e>8 | <b g' b>4\>^\tRit <a f' a>8 |
  \af 4\! \af 4\p <e'='' e'>4.\) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
