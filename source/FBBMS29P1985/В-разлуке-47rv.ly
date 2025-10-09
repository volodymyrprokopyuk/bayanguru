{{ define "rh1a" }}
  {{ .a }} c b d | c4. bes16 aes \af 2\! {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \minor
  \time 4/4
  \duo {
    {{ template "rh1a" (w `g'='4(\mp` `g='2)\>`) }}
    f='4( ees8 d c4 c | b\< d g \af 4\! f) |
    {{ template "rh1a" (w `g='4(\mf` `bes='2)\<`) }}
    aes='4( f'8 d ees4 d8 ees | \af 1\! c=''1)\> \fermata \bar "|."
  } {
    s1 | s2 g'='4 ees8 d | c2 s2 | s1 | ees2 g4 f~ |
    f='2 g | aes g4 <f g> | <ees=' g>1 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  c=2-\frBass d | ees4 f g2 | aes1 | g4 f ees d | c2 d4 g, |
  aes=,4 bes~ bes8 c d ees | f2 g | c='1 \fermata |
}
{{ end }}
