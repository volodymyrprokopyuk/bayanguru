{{ define "rh1" }}
  {{ .a }} am! am | c a@m! am4 | d= dm! dm |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key a \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    e'='4\(\p a c | e d c | f, b c | d2.\) |
    e,='4\( gis b | d c b | e, a b | c2.\) |
    e,='4( a c | e d c) | f,( a d | f e d) |
    e=''4\( c a | e gis b | a c e | a=''2.\) \fine \bar "||"

    \volta 2
    g=''4\(\mf e c | g c e | g f d | b2.\) |
    g'=''4\( f d | b d f | a g e | c2.\) |
    g'=''4( e c | g c e) | g( f d | b d f) |
    e=''4( c a) | f'( d b) | e( d c | b^\tRit a gis=') \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "rh1" (w `a,=,4-\stBass`) }} | f=4 d@m! dm4 |
  e=4 eM! eM | gis, e@M! eM4 | a am! am | e' a@m! am4 |
  {{ template "rh1" (w `a,=,4`) }} | b=,4 d@m! dm4 |
  c=4 a@m! am4 | e eM! eM | a,=, am! am | a+am!2. |

  c=4 cM! cM | e c@M! cM4 | \rep 2 { b=,4 g@M! gM4 | g=, gM! gM | }
  c=4 cM! cM | g c@M! cM4 | c cM! cM | e c@M! cM4 | d dM! dM |
  f=4 d@m! dm4 | a, am! am | d dm! dm | e eM! eM | e= eM! eM |
}
{{ end }}
