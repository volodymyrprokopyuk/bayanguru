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
  r4 <g,=, d'>4(-\frBass | <c e> <d fis> | <e g>2) |
  r4 <b=, fis'>4( | <c e> <d fis> | <e g>2) |
  \duo { r4 a=4( | fis a | b a8 b | c4) a( | fis a | b=2) | }
  { \rep 2 { R2 | b,=,2 | e= | } } |

  \rep 2 { d'='4.( b8 | e4 d8 c | b4 g=) | }
  a=8[( g fis e] | d4 e8 fis | g4 g) | a8[( g fis e] | d4 e8 fis | g=2) |

  \meter 1/2 #'(1)
  b=8_\aSta a b g | c g b a | g a b c | b a b g | c g b a | g fis e d |
  <c= e>4 a'8 g | <c, fis>( e) fis d | b d g fis |
  <c= e>4 a'8 g | <c, fis>( e) fis d | <g,=, d'>2 |
}
{{ end }}
