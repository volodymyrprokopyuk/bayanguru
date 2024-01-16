{{ define "lh1" }}
  {{ .a }} gM! d' g@M | g,8 gM! d'= g@M |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Con moto"
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    d''=''4\mf c8 b | \rep 2 { d,='16( g b d c8) b=' | } d b a g=' |
  }
  \repeat volta 2 {
    fis='16(\mp g a4) a8 | bes16( a g fis g a bes g) | fis( g a4) a8 |
    \alternative {
      \volta 1 { bes='16( a g fis g='8) r | }
      \volta 2 { bes='16( a g fis g='8) r \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass`) }}
  {{ template "lh1" (w `g,=,8`) }}
  \rep 2 { d=8 d7! d d7 | g, gm! g=, gm | } g=,8 gm! g+gm r |
}
{{ end }}
