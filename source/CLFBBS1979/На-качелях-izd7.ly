{{ define "rh1" }}
  \rep 2 { {{ .a }} r | } <b=' e>4 r8 <b=' d>4 r8 |
{{ end }}

{{ define "rh2" }}
  fis='4.) e'8( {{ .a }} c fis, | e4.) e'8( c e, | d4 b'8) d,4( a'='8 |

{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 6/8
  \partial 4. { r4.\mf | }
  {{ template "rh1" (w `<c''='' e>4.`) }} | d=''8( c e) r4. |
  {{ template "rh1" (w `<c='' e>4.`) }} | c=''4 r8 %

  \repeat volta 2 {
    \partial 4. { e=''8(\mf c g | }
    {{ template "rh2" (w `_\dCre`) }} | d,='4 g8) e'( c g |
    {{ template "rh2" (w ``) }} | g='4.) r4.\mf |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
}
{{ end }}
