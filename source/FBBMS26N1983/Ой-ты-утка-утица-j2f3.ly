{{ define "rh1" }}
  {{ .a }} a g e] | f16( e d f e8) c=' |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} r8 8] | | r <bes d>[ r <c=' e>] |
{{ end }}

{{ define "lh2" }}
  r8 <g= d'>8[ r <a c>] | r8 <gis d'>[ r <a c>] |
  r8 a=8[ d f] | r g,[ d' f] | r g,[ c e='] |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 2/4
  {{ template "rh1" (w `g'='8[\mf`) }} {{ template "rh1" (w `g'='8[`) }}
  \rep 2 { g'='8[ f e c='] | } | a'2 | g c='' |

  \rep 2 { g'=''16 a g a g f e g | f e d f e d c e='' | }
  \rep 4 { g=''16 f e c='' } | \rep 4 { a'='' a,=' } | \rep 4 { g'=''16 g,=' } |
  \rep 8 { c=''16 g a g=' } | c^\tRit g a g c=''4 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `<c'=' e>8[-\frBass`) }}
  {{ template "lh1" (w `<c=' e>8[`) }} {{ template "lh2" }}

  \rep 2 { {{ template "lh1" (w `<c=' e>8[`) }} | } {{ template "lh2" }}
  r8 g,=8[ c e] | \rep 2 { r8 <c=' e>[ r <bes= d>] | } | r8 g=8 c='4 \fermata |
}
{{ end }}
