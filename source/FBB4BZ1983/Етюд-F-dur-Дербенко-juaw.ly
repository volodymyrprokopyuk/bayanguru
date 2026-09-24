{{ define "rh1" }}
  {{ .a }} r16 bes]( a8[) r16 bes]( a8[) r16 d]( e8[) r16 \af 16\! f]( |
  e=''4)\> d c(-> \af 4\! bes=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key f \major
  \time 4/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      a'='8[\mf r16 f]( c8[) r16 a'16]( g4) r | g8[ r16 e]( c8[) r16 g']( f4) r |
      d='8[\< r16 e]( d8[) r16 e]( f8[) r16 g]( a8[) r16 \af 16\! bes] |
      \alternative {
        \volta 1 { c=''4\> bes a(-> \af 4\! g=') | }
        \volta 2 { c=''4 <bes, c>-> <a= c f>-> r \fine \bar "||" }
      }
    }

    \volta 2
    {{ template "rh1" (w `a'='8[\mp\<`) }}
    a='8[\< r16 a]( bes8[) r16 a]( d8[) r16 a]( f8[) r16 \af 16\! d='] |
    \duo { gis'='2(->\> \af 4\! a='4) } { r4 <d'=' f>4 <cis=' g'> } r |

    {{ template "rh1" (w `a'='8[\mf\<`) }}
    a='8[\< r16 bes]( a8[) r16 bes]( \af 2\! c2) |
    g='8[\< r16 a]( g8[) r16 a]( \af 2\! bes2) |
    f='8[\mf\< r16 g]( f8[) r16 g]( a8[) r16 bes]( a8[) r16 \af 16\! bes='] |
    \duo { a'='2\f\> \af 2\! g=' \bar "|." } { r4 <d'=' f>4 r <c=' e> | }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  f=4-\frBass <a c>_\aSta g <bes d> |
}
{{ end }}
