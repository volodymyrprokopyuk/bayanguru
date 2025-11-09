{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key e \minor
  \time 3/4
  \repeat volta 2 {
    b'='8(\mf c b ais b g') | fis( g fis e c e) |
    b='8( c b ais b a') | g(\< a g fis e \af 8\! g) |
    b=''8( c b ais b e) | c( d c b a g) |
    fis=''8(\> g fis b, b' dis, | \af 2\! e=''2) r4 |
  }

  \repeat volta 2 {
    fis=''8( g fis b, b' fis) | g(_\dCre a g fis e g) |
    a=''8( b a d, d' a) | b( c b a g d') |
    e='''8(\f fis e d c a) | b( c b a g e) |
    fis=''8(\> g fis b, b' dis, | \af 2\! e=''2) r4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=4-\stBass em! em | a, am! am | dis b@7! b74 | e em! em |
  \duo { r4 e@m! r4 | } { g,=,2( gis=,4) | } | a,=,4 am! am |
  b=,4 b7! b7 | e= em! em |

  dis=4 b@7! b74 | e em! em | fis d@7! d74 | g, gM! b |
  c=4 a@m! fis4 | b, e@m! em4 | b b7! b7 | e= em! em |
}
{{ end }}
