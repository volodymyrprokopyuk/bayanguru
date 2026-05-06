{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 3/8
  d'='4\(\p g8 | g4 fis8 | a4 g8 | b4 a8\) |
  e='4\( c'8 | c4 b8 | a4.~ | a8\) r r |
  e='4\( e'8 | e4 d8 | d4 a8 | c b a\) |
  d,='4\( b'8 | b4 a8 | g4.~ | g='8\) r r |

  \duo {
    e'='4\( e'8 | e4 d8 | d4 a8 | c b a\) |
    d,='4\( b'8 | b4 a8 | g4.~ | g8\)\< b \rest \af 8\! b=' \rest |

    d,='4\(\mf g8 | g4 fis8 | a4 g8 | b4 a8\) | e4\( c'8 | c4 b8 | a='8.\) %
  } {
    \rep 3 { e'='4.~ | } e='4. | d4.~ | d4 c8 | b4.~ | b=8 s s |

    d='4. | c4. | d4. | fis4. | e4. | d4. | c='8. %
  }

  e='16( c b | a8.) b16[( c d] | e4)( <c' e>16 e, | <c' e>4 <b d>8 |
  <b=' d>4 <a c>16 e | <a c>8 <g b> <fis a>) |
  d='4\( <g b>16 d | <fis b>4 <fis a>8 | g4.~ | g8.\) a16[( g fis] |
  e='8. gis16[ b d] | f4 e8) | d8.( c16[ b a] | c b a g fis e) |
  d='8.( g16[ b d] | b8. a16[ e fis]) | g(_\dDim d b d^\tRit b a |
  g=8)\p r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  b,=,8(-\frBass g') g | c,( g') g | d( g) g | dis( fis) fis |
  e=8( gis) gis | d( gis) gis | c,( e a) | b,( d f=) |

  e=4\( c'8 | gis4 b8 | f4 d'8 | fis,4 c'8\) |
  b=4\( g8 | d'4 c8 | b4 a8 | g4 fis=8\) |

  e=8 fis gis | d' c b | a b c | fis, g a | b a g |
  d=8 e fis | g e d | c b a=, |

  g=,8-\stBass gM! gM | e'[ c@M! cM8] | d[ g@M! gM8] | d dM! dM |
  c=8 cM! cM | e e7! e7 | a, am! am | e'[ a@m! am8] |
  e=8 e7! e7 | gis,[ e@7! e78] | a am! am | fis[ a@m! am8] |
  d'=8[ g@M! gM8] | d d7! d7 | g, gM! gM | b b7! b7 |
  e=8 eM! eM | d[ e@M! eM8] | c[ a@m! am8] | fis,[ a@m! am8] |
  d'=8[ g@M! gM8] | a+a7!4 d+dM!8 | g,=,[ gM!] d+d7!8 | g+gM! r r |
}
{{ end }}
