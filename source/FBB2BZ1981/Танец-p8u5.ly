{{ define "rh1" }}
  {{ .a }} b-. c-. b]-. | d16( c b a b8)-. e,='-. |
{{ end }}

{{ define "rh2" }}
  a='8[-. b-. c-. e]-. | dis16( c b a <gis=' e'>4)-- |
{{ end }}

{{ define "rh3" }}
  <e=' c'>8 4 {{ .a }} b'8 | <c, a'>16( g' f8 <b, g'>4) | <e c'>8 4 {{ .b }} |
{{ end }}

{{ define "rh4" }}
  <c=' e>8 4 {{ .a }} 8 | r <c a'>[ r <b g'>] | <c=' e>8 4 {{ .b }} 8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    {{ template "rh1" (w `a'='8[-.\mf`) }}
    {{ template "rh2" }}
    {{ template "rh1" (w `a='8[-.`) }}
    a='16( b c b d c b a | e'8)-. e,-. a='4-- |
    a='8[-.\f b-. c-. e]-. | dis16( c b a b8)-. e,-. |
    {{ template "rh2" }}
    {{ template "rh1" (w `a='8[-.\p`) }}
    a='16( b c b d c b a | <gis e'>8)-. e-. a='4 \fine \bar "||"

    \volta 2
    {{ template "rh3" (w `\f` `g='8`) }} | <f a>16( b c8 <f, d'>4) |
    {{ template "rh3" (w `\p` `a='8`) }} | <f b>16( c' <f, d'>8 <e=' c'>4) |
    {{ template "rh4" (w `\f` ``) }} | r <f a> <f g>4 |
    {{ template "rh4" (w `\p` `^\tRit`) }}
     <c=' a'>8\< 8 \af 4\! <d=' gis>4 \fermata \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a=8[-\frBass e' g, d'] | f, c' e, b' | a[ e' a, e'] | a, dis e, d' |
  a=8[ e' g, d'] | f, c' e, b' | <f dis'>4. 8 | <e d'>8-. 8-. <a= c>4-- \clef treble |
  \duo {
    a'='2 | a4 gis | g2 | fis4 f=' \clef bass | e='2 | f4 fis | g f=' |
  } {
    a'='8 a,4 a8 | a' a, gis' a, | g' a,4 a8 | fis' a, f' a,= |
    e'='8 a,4 a8 | f' a, fis' a, | g' a, f' a,= |
  }
  e'='8-. e,-. <a= c>4 |

  c,=8 4 8 | f4( g8 g,) | c8 4 8 | f4( g) |
  c,=8 4 8 | f4( g8 g,) | a8 4 8 | d( g c,=4) |
  c'='8 4 b8 | a16( g f8 g8 g) | c8 4 b8 | a16( b c8 d4) |
  c='8 4 b8 | a16( g f8 g8 g) | a8 4 g8 | f16( e d8 e=4) \fermata |
}
{{ end }}
