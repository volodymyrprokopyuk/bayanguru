{{ define "rh1" }}
  {{ .a }} 8 <e g> | <d fis>8 8 4 | <cis e>8 <d fis> <e='' g>4 |
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8 <cis e> | <b d>8 8 4 |
  <ais=' cis>8 <ais e'> <ais d> <ais=' cis> |
{{ end }}

{{ define "lh1" }}
  {{ .a }} dM! a8 a7! | d dM! a d@M | e'8 a@7! a,=,8 a7 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} bm! fis' fis7! | b, bm! fis' b@m | cis8 fis@7! fis=8 fis7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \major
  \time 2/4
  {{ template "rh1" (w `<fis''='' a>4\f`) }} | <d fis>4 4 |
  {{ template "rh1" (w `<fis='' a>4`) }} | <d fis>4 <ais=' e' fis>-> |

  {{ template "rh2" (w `<d='' fis>4\mf`) }}
  b='16( ais b cis d cis d e) |
  {{ template "rh2" (w `<d='' fis>4`) }} | b4 b=' \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  {{ template "lh1" (w `d=8-\stBass`) }} | d dM! a d@M |
  {{ template "lh1" (w `d=8`) }} | d4 cis=-> |

  {{ template "lh2" (w `b=,8`) }} | b, bm! fis' b@m |
  {{ template "lh2" (w `b,=,8`) }} | b,=,4 bm! |
}
{{ end }}
