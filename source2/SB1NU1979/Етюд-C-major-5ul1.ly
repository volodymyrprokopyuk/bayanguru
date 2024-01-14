{{ define "rh1" }}
  {{ .a }} d e f g8)-. | e16( f g a b c=''' |
{{ end }}

{{ define "rh2" }}
  {{ .a }} g b g b8)-. | e,16( g c g c='''8)-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key c \major
  \time 3/8
  \repeat volta 2 {
    {{ template "rh1" (w `c''=''16(\mf`) }} | <f, a>8)-. 8-. 8-. | <e g>4. |
    {{ template "rh1" (w `c=''16(`) }} | g16 a g f e d | c=''4.) |
  }

  \repeat volta 2 {
    {{ template "rh2" (w `d=''16(\f`) }} | <d, g b>8-. 8-. 8-. | <e g c>4. |
    {{ template "rh2" (w `d=''16(`) }} | b16( a g f e d | c=''4.) |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=8(-\stBass cM!)-. cM-. | c( cM!)-. cM-. | c[_\aSim f@M! fM8] |
  \rep 3 { c=8 cM! cM | } g g7! g7 | c= cM! cM |

  \rep 3 { g=,8 g7! g7 | g[ c@M! cM8] | } g g7! g7 | c= cM! cM |
}
{{ end }}
