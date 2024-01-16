{{ define "lh1" }}
  {{ .a }} gM! d' g@M | g,8 gM! d' g@M | a8 d@7! d=8 d7 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} dM! dis b@7! | e8 em! g, e@m | a8 a7! cis= a@7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    d'='8(\mf g) g-. g-. | d( g) g 4 | a8-. a( b a | g)-. g-. g4 |
    \meter 1/2 #'(1)
    \duo { d'='8( g) g-. g-. | d( g) g='4 | } { b=2 | b= | }
    <c,=' a'>8 8 <d b'> <c a'> | <b= g'>8 8 4 \fine \bar "||"

    \volta 2
    fis'='4 a | g8( fis e4) | e8( g fis e | fis) fis d4 |
    fis='8[ fis]( a) a( | g fis e4) | e8( g fis e | d) d d='4 \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }} | g,8 gM! d' g@M |
  {{ template "lh1" (w `g,=,8`) }} | g,8 d' g,=,4 |

  {{ template "lh2" (w `d'=8`) }} | d8 dM! fis d@M |
  {{ template "lh2" (w `d=8`) }} | d=8 dM! d+dM4 |
}
{{ end }}
