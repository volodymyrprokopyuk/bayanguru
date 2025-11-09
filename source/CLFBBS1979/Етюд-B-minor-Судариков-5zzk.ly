{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key b \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \af 2.\! <a= fis'>2.\p\< | \af 2.\! <b g'>\> |
    <a= fis'>2\< \af 4\! <d a'>4 | \af 2.\! <b g'>2.\> |
    <a= fis'>2\< <d g>4 | <fis a> <e b'> \af 4\! fis |
    <e=' g>2.\> | \af 2.\! <g=' b>2. |

    \duo {
      d''=''4\mp cis b | e_\dCre d cis | <d fis> <cis e> <b d> | g' fis g |
      a=''4\mf e g | fis e d | g_\dDim d fis | e d e | fis d b | e d cis |
      b='2.~ | b=' \fine \bar "||"
    } {
      a'='2. | b | s2. | d | cis | c | b | bes |
      a='2. | gis2 fis4~ | fis2\> \af 4\! e4 | d='2.\p |
    }

    \volta 2
    \key a \major
    e='4\mp e e | a2 a4 | gis gis gis | cis2\< \af 4\! cis4 |
    e=''4\mf cis a | d cis b | cis2 a4 | \af 2.\! b='2.\> |

    r4\mf <d='' fis>4( <cis e>) | r4_ \dCre <d fis>( <cis e>) |
    r4 <d='' fis>4( <cis e>) | r4 <d fis>( <e gis> | <fis a>2.\f | <e gis>) |
    r4 <d='' fis>(_\dDim <cis e> | <d fis>2.) |
    \rep 2 { r4 <cis='' e>4( <b d> | <cis='' e>2.) | }
    r4^\tRit <cis='' e>4( <b d> | <cis e>2.) |
    \keyCancelChangeBar
    \key b \minor
    \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  d'='4-\frBass cis b | e d cis | d cis b | e d cis |
  d='4 cis b | cis2 dis4 | e d cis | e d e=' \clef treble |

  fis='2. | g | a | b | a~ | a | g~ | g | fis | eis2 e4~ | e d cis | b=2. |

  \key a \major
  r4 <b= d>4 4 | r <cis e>4 4 | r <d fis>4 4 | r <e gis>4 4 |
  r4 <e=' g>4 4 | r <d fis>4 4 | r <dis fis>4 4 | r <e=' gis>4 4 |

  e='4 e e | a2 a4 | gis gis gis | cis2 cis4 |
  d=''4 b a | b gis fis | ais2. | b4 a fis |
  e='2. | a4 fis e | fis2 gis4 | a fis e | gis fis gis | a='2. \clef bass |
  \keyCancelChangeBar
  \key b \minor
}
{{ end }}
