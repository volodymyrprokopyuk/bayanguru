{{ define "rh1" }}
  r4\p {{ .a }} <d g>2) | e4( a <d, g>2) |
  \duo { {{ .b }} \af 2\! c2 | b4 a d=''2) | } { s2 a'='4 g | fis2 g=' | }
  r4 <b'=' d>4( <a e'>2) |
{{ end }}

{{ define "lh1" }}
  c=4 cM! a am! | d d7! b=, g@M! |
{{ end }}

{{ define "lh2" }}
  {{ .a }} gM! f@M!2 | g4 gM! c@M!2 | e'4 e7! {{ .b }} | d=4 d7! g@M!2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Commodo
  \clef treble
  \key c \major
  \time 4/4
  {{ template "rh1" (w `e'='4(` `e'='4(\< g`) }}
  r4 <d='' f>4( <c e>2) | <gis d'>(\> \af 2\! <a c>) |
  <fis=' d'>2(\> \af 2\! <g b>) | d'( e8\< a, c e | d4 g \af 2\! <c, e>2) |
  <c='' e>4(\> <b d> <a c> <g e'> | <fis d'>2 \af 2\! g=') |

  {{ template "rh1" (w `e='4(` `e'='8(\< g a b`) }}
  <b=' d>2( <a c>) | c4( a g a) | r4\p e4( <d g>2) | e4( a <d, g>2) |
  r4^\tRal \duo { a'='4(\> g a | \af 2.\! <e=' c'>2.) \fermata } %
  { s4 d'='2 | s2. } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4(-\stBass cM! f@M!2) | c4( cM! f@M!2) | {{ template "lh1" }}
  {{ template "lh2" (w `g=,4_\aSim` `a@m!2`) }}
  {{ template "lh2" (w `g,=,4` `a,=,4 am!`) }}

  \rep 2 { c=4 cM! f@M!2 | } {{ template "lh1" }}
  g=,4 gM! f@M!2 | gis4 e@M! a@m!2 | f+d@m!4 r4 g+g7! r |
  \rep 3 { c=4 cM! f@M!2 | } | c@M!2-\fermata c=4 \fermata r |
}
{{ end }}
