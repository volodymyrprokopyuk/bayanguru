{{ define "rh1" }}
  {{ .a }} a g a g8) c-. | g16( a g a g8) e'-. | e( d16 c d8) b='-. |
{{ end }}

{{ define "rh2" }}
  e=''16( d c d e8) c-. | d( b16 c d8) b-. | c( a16 b c8) a='-. |
{{ end }}

{{ define "lh1" }}
  {{ .a }} cM! g c@M | c8 cM g c@M | b8 g@7! g=,8 g7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `g'='16(\mf`) }} | d( c16 b c8) a-. |
    {{ template "rh1" (w `g='16(`) }} | d( c) c=''4 \fine \bar "||"

    \volta 2
    {{ template "rh2" }} | d( b16 c d8) b-. |
    {{ template "rh2" }} | g4-> g='-> \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  {{ template "lh1" (w `c=8-\stBass`) }} | c8 cM! g c@M |
  {{ template "lh1" (w `c=8`) }} | c=8( cM!) cM4 |

  \rep 3 { d=8 d7! fis d@7 | g,8 gM! b=, g@M | }
  d=8 d7! fis d@7 | g,=,8( gM!) gM4-> |
}
{{ end }}
