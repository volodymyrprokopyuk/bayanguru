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
      <e'=' g c>8\(\< <g c e> dis'16 \af 16\! e | <a, c>8\> b \af 8\! <f a> |
      gis='8 a e | f e d\) |
      \alternative {
        \volta 1 {
          <d=' b' d>4(--\> <e c'>8 | b'4 \af 8\! a8 | e='4.)\p \fermata |
        }
        \volta 2 {
          <d=' b' d>8.(\> c'32 b s8 | b4 \af 8\! a8 | <e=' e'>4.)\p \fermata |
        }
      }
    } {
      s4 b'='8 | s4. | r8 a,4~ | a8 r r | s4. | b'8 g f | s4. | s4 <c' e>8 |
      b='8 g f=' | s4. |
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
