{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key bes \major
  \time 2/4
  bes'='4(\mp\< f') | bes,8 bes( \af 4\! f'4) |
  bes=''4(\> bes,) | f'8( ees16 d c8 \af 8\! f,) |
  bes='4(\< f') | bes,8 bes( \af 4\! f'4) |
  bes=''8(\> bes, f' ees16 d | c8 f, \af 4\! bes='4) |

  \af 8.\! <g=' c>4(\< \af 4\! <fis d'>)\> |
  \duo {
    \af 8\! c''=''8--\< c-- \af 4\! d4\> |
    <g,=' bes>8(\< <a c> d \af 8\! g) |
    c,=''8(\> d16 ees d8 \af 8\! c='') |
  } { g'='4( fis) | s4 bes | bes a=' | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
}
{{ end }}
