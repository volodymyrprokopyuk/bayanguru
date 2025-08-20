{{ define "rh1" }}
  {{ .a }} cis)-. a( cis)-. | d-> d-> cis( a=') |
{{ end }}

{{ define "rh2" }}
  {{ .a }} bes a4) | g8( bes a4) | g8-> f-> e-> f-> | d4-- {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key d \minor
  \time 2/4
  {{ template "rh1" (w `a'='8(\mf`) }}
  {{ template "rh1" (w `a='8(`) }}
  {{ template "rh2" (w `g='8(\p` `d='--`) }}
  {{ template "rh2" (w `g='8(\f` `d'=''--`) }}

  \duo {
    a'='8-> cis-> a-> cis-> | d-> d-> d-> a-> |
    a='8-> e'-> cis-> a-> | d-> d-> d-> a='-> |
  } { \rep 2 { g'='2( | fis=') | } } |
  g,='16-> bes-. g-. bes-. a-> d,-. a'-. d,-. |
  bes'='16-> d,-. g-. bes-. a-> d,-. a'-. d,-. |
  g='16 f e f g a g a | \rep 2 { f='16(-> d a'8)-. f-> a='8-> | }
  \af 2\! <f=' a bes d>2->\> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \duo { <cis'=' e>2( | <d f>4) <e g> | 2( | <d f>4) <cis=' e> | }
  { a=2~-\frBass | a | a~ | a= | }
  d'='8 e f4 | cis4 d8 c | <bes d>4 %
  \duo {
    g=8 <a cis> | r8 <a d>4 8 | r <bes d>[ r <a d>] |
    r8 <g= cis>8[ r <cis ees>] | r <d f>[ r <a cis>] | r <a d> f'='4 |
  } { g=4 | f2 | g4 f | e f | bes g | f d'=' | }

  \rep 3 { a=4~ a16 b a=8~ } | a=4 d8 c=' |
  \duo { \rep 2 { r8 <d'=' e>8[ r <a= d>] | } } { bes=4 f | g f= | }
  \rep 2 { a=8-> <g= cis>-. } | \rep 2 { a=8-> <f= d'>-. } |
  \rep 2 { a=8-> <f= bes d>-. } |
  \duo { bes=4( a=) | } { <d= d'>2-> \fermata | }
}
{{ end }}
