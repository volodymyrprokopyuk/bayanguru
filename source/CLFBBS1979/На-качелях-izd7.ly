{{ define "rh1" }}
  \rep 2 { {{ .a }} r | } <b=' e>4 r8 <b=' d>4 r8 |
{{ end }}

{{ define "rh2" }}
  fis='4.) e'8( {{ .a }} c fis, | e4.) e'8( c e, | d4 b'8) d,4( a'='8 |
{{ end }}

{{ define "lh1" }}
  g='4.) g,8( c e | a4.) g,8( b e | g4 g,8) f'4( g,=8) |
{{ end }}

{{ define "lh2" }}
  {{ .a }} r | <d g c>4. r |
  \duo { r4. c'='4.( | b=) } { <d= fis>2.( | g=4.) } %
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
    {{ template "rh2" (w `_ \dCre`) }} | d,='4 g8) e'( c g |
    {{ template "rh2" (w ``) }} | g='4.) r4.\mf |

    {{ template "rh1" (w `<c='' e>4.`) }} | d=''8( c e) r4.\p |
    {{ template "rh1" (w `<c='' e>4.`) }} | c=''4. %
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  \partial 4. { g=8(-\frBass c e | }
  {{ template "lh1" }} | f'='8( e g) g,( c e |
  {{ template "lh1" }} | <c=' e>4 r8 %

  r4. \clef bass |
  {{ template "lh2" (w `<d,= a' c>4.`) }} r4. |
  {{ template "lh2" (w `<d= a' c>4.`) }}

  \partial 4. { \clef treble g=8( c e | }
  {{ template "lh1" }} | f'='8( e g) g,( c e |
  {{ template "lh1" }} | <c=' e>4. %
}
{{ end }}
