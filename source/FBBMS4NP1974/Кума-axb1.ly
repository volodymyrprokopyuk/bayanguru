{{ define "rh1" }}
  {{ .a }} b8 | e4 d8 c | b4\> \af 4\! g=') |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <fis=' a d>4( | <g b>) %
  \duo { b'='8( a | g[ a b d='']) | } { fis'='4 | g='2 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh1" (w `d''=''4.(\p`) }}
  {{ template "rh1" (w `d'=''4.(`) }}
  \duo {
    a'='8[( g fis e] | d4 d8 fis | g4_\tenuto g)_\tenuto |
    a='8[( g fis e] | d4 e8 fis | g='2) |
  } { \rep 2 { r4 c'='4 | d=' r4 | s2 | } } |

  {{ template "rh2" (w `r4\f`) }}
  {{ template "rh2" (w `r4`) }}
  r4 <d=' a'>4( | d') %
  \duo { d''=''4-- | d=''2-- | } { d''=''8( c | b[ a b g=']) | }
  r4 <d,=' a'>4( | d') %
  \duo { d''=''4-- | d=''2-- | } { d''=''8( c | b='2) | }

  \duo {
    {{ template "rh1" (w `d''=''4.(\p`) }}
    {{ template "rh1" (w `d'=''4.(`) }}
  } { \rep 2 { g'='2 | g | d4 e=' | } } |
  <e,=' a>8[(_\dCre g) fis-. e]-. | d4 e8-. fis-. | g4 g |
  <e=' a>8[(\f g) fis-. e]-. | d4 e8-. fis-. | <b,= g'>2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
