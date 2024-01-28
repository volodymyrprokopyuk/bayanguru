{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  a'='4\(\p a8 b | c4 b8 a | b4\< e | a, \af 4\! g\) |
  c=''4\(\mf c8 d | e4 d8 c | d4 g | e=''2\) |

  \repeat volta 2 {
    f=''4(_\markup \dAlt f p e8 d | e4 c) | d( c8 b | c4 a) |
    a='4 a'8\( f | e[ d c b] | a2~ | a='4\) r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  a=4\(-\frBass f' | e2 | d | c4\) r | c\( a' | g2 | f4 e8 d | c='2\) |

  \duo { a'='2~ | a~ | a~ | a='4 } { d'='2\( | c4 e | f2 | e='4\) } r |
  <d=' f>2\( | e | a,~ | a=4\) r |
}
{{ end }}
