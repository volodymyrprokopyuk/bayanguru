{{ define "rh1" }}
  {{ .a }} e16( g c,8)-> e16( g | d8)-> d16( f e-> d c8) | e-> e16( g='' %
{{ end }}

{{ define "lh1" }}
  c='8-> <e g>8-. a,-> <c e>-. | b-> <f' g>-. c-> <e g>-. |
  b=8-> <c e>-. a-> <c e>-. | g-> <f' a>-. <c=' e g>-- r |
{{ end }}

{{ define "lh2" }}
  a=8-> e-. d-> e-. | a-> e-. d-> r | c-> d-. {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  <c''='' e g>8->\mf <c f a>-> \rep 3 { <c='' e g>8-> <c='' f a>-> } \bar "||"

  \repeat segno 2 {
    {{ template "rh1" (w `e=''8->`) }} c,=''8)-> e16( g | f-> e d e c d e f |
    {{ template "rh1" (w `e=''8)->`) }} c,=''8)-> c16( a=' \bar "||"

    \alternative {
      \volta 1 {
        d=''16 c b g c8)-- c16( b | a8)-> <c e>-. b8-> <d e>16 16 |
        a='8-> c-. <gis b>-> e16 e | <fis a>8-> <gis b>16 16 <a c>8-. <b d>-. |
        <c='' e>8-> <d f>16 16 <c e>8-. <b d>-. |
        a='8-> <c e>16 16 b8-> <d e>16 16 | a16(-> c b a <gis b>8)-> e16 e |
        <fis=' a>8-> 16( b <gis c>8)-> <a c>16( d |
        <c='' e>8)-> 16( f <a, e'>8)-> <b=' d>( \bar "||"
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }
  d=''16 c b g c=''8)-- r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  <g'=' c e>8->-\frBass <f c' d>-> \rep 3 { <g=' c e>8-> <f=' c' d>-> } |

  \rep 2 { {{ template "lh1" }} } \clef bass |
  {{ template "lh2" (w `e=8-. fis-.`) }} | g=8-> g-. gis-. gis-. |
  {{ template "lh2" (w `e=8-> f-.`) }} | fis=8-> fis-. g-> g=-. \clef treble |
  g=8-> <f' a>-. <c=' e g>8-- r |
}
{{ end }}
