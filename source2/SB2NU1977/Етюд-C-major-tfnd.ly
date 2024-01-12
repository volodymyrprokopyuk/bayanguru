{{ define "t1" }}
  r16{{ .a }} {{ .b }}( {{ .c }} {{ .b }}) %
  r16 {{ .b }}( {{ .c }} {{ .b }}) |
{{ end }}

{{ define "t2" }}
  \rep 2 { r16 {{ .a }}( {{ .b }} {{ .a }}) } |
{{ end }}

{{ define "t3" }}
  r16 {{ .a }}( \rep 2 { {{ .b }} {{ .a }} } {{ .b }} {{ .a }}) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \major
  \time 2/4
  r16\mf <g'=' e'>16( <c g'> <g e'>) r16 <g=' e'>16( <c g'> <g e'>) |
  {{ template "t3" (w `<f=' d'>16` `<a f'>`) }}
  {{ template "t2" (w `<d=' b'>16` `<g d'>`) }}
  {{ template "t3" (w `<e=' c'>16` `<g e'>`) }}
  {{ template "t2" (w `<e=' c'>16` `<a e'>`) }}
  {{ template "t3" (w `<f=' d'>16` `<a f'>`) }}
  {{ template "t2" (w `<d=' b'>16` `<g d'>`) }}
  r16 <e=' c'>16( <g e'> <c g'> <e='' c'>4) \bar "||"

  \key e \minor
  {{ template "t1" (w `\f` `<b=' g'>16` `<e b'>`) }}
  {{ template "t3" (w `<c='' fis>16` `<e a>`) }}
  {{ template "t2" (w `<a=' dis>16` `<b fis'>`) }}
  {{ template "t3" (w `<g=' e'>16` `<b g'>`) }}
  {{ template "t2" (w `<b=' g'>16` `<e b'>`) }}
  {{ template "t3" (w `<c='' a'>16` `<e c'>`) }}
  {{ template "t2" (w `<c='' fis>16` `<d a'>`) }}
  r16^\tRit <b=' g'>16( \rep 2 { <d='' b'>16 <b=' g'> } <d b'> <b=' g'>) \bar "||"

  \keyChangeBeforeBar
  \key c \major
  {{ template "t1" (w `\mf^\tATem` `<g=' e'>16` `<c g'>`) }}
  {{ template "t3" (w `<f=' d'>16` `<a f'>`) }}
  {{ template "t2" (w `<d=' b'>16` `<g d'>`) }}
  {{ template "t3" (w `<e=' c'>16` `<g e'>`) }}
  r16 <g=' e'>16( <c g'> <g e'>) r16 <c g'>( <e c'> <c g'>) |
  {{ template "t3" (w `<c='' a'>16` `<f c'>`) }}
  r16 <e='' c'>16( <g e'> <e c'>) r16 <d b'>( <g d'> <d b'>) |
  \ottava #1 r16 <e='' c'>16( <g e'> <c g'> <e=''' c'>4) \ottava #0 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | d dm! | g, g7! | c cM! |
  a=,4 am! | d dm! | g, g7! | c= cM! |

  \key e \minor
  e=4 em! | a, am! | b b7! | e em! |
  e=4 em! | a, am! | d d7! | g,=, g7! |

  \keyChangeBeforeBar
  \key c \major
  c=4 cM! | d dm! | g, g7! | c cM! |
  bes=,4 c@M! | a4 f@M! | g4 g7! c= cM! |
}
{{ end }}
