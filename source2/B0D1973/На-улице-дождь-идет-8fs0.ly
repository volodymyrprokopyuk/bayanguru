{{ define "rightHand" }}
\relative {
  \tempo Lento
  \clef treble
  \key c \major
  \time 2/4
  \repeat volta 2 {
    c''=''8\(\mf g' g g | f e d c | b a b g | c4 g\) |
    c=''8( g')-. c,( g')-. | f\( e d c | b a b g | c4 b='\) |

    a='8\( c c c | d c b a | b d c b | a4 e\) |
    a='8( e')-. a,( e')-. | d\( c b a | b d c b | a4 a'=''8\) r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  c=4-\stBass cM! | d dm! | g, gM! | c cM! |
  c=4 cM! | d dm! | g, gM! | c8 r e= r |

  a,=,4 am! | d dm! | e eM! | a, am! |
  a=,4 am! | d dm! | e eM! | a@m!4 a,=,8 r |
}
{{ end }}
