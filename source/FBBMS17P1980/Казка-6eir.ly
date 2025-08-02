{{ define "rh1" }}
  {{ .a }} fis) fis | a(\> \af 4\! fis='4) |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} | r8 <cis e>4 | r8 <b d>4 | r8 <cis=' e>4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key b \minor
  \time 3/8
  {{ template "rh1" (w `b'='8(\p`) }}
  {{ template "rh1" (w `b='8(`) }}
  d'=''8(\mp cis b) | b( ais) ais | b(^\tRit_\dDim a g) | g( fis4) |
  \tempo Animato
  cis='8(\p d e) | fis(_\dCre b,) b | e( fis g) | a( d,4) |
  a'='8( b d) | cis( b a) | b(\< cis \af 8\! d) |
  e=''8(\mf a,) a | fis( e d) | a'( e) e | d( cis b) |
  cis='8(\< a b | cis d \af 8\! e) | fis(\> cis cis |
  cis'=''8^\tRit fis, \af 8\! fis' | fis=''4.) \fermata |

  {{ template "rh1" (w `b,='8(\pp^\tATem`) }}
  {{ template "rh1" (w `b='8(`) }}
  d'=''8(_\dDim cis b) | cis(^\tRit a) a | d( b e) |
  fis=''8( b,) b=' \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  {{ template "lh1" (w `<b= d>4-\frBass`) }}
  r8 <d=' fis>4 | r8 <cis e>4 | r8 <b d>4 | r8 <ais cis>4 |
  <e= fis>4._(~ | <d fis>4) r8 | <g a>4._(~ | <fis a>8) r8 8 |
  <f= a>4._(~ | <e a>4) r8 | <d e>4._(~ | <cis e>) | <b e>(^~ | <a e'>) |
  <a=, fis'>4. | <a e'> | <g e'> | <fis ais e'>~ | 4.~ | 4. \fermata |

  {{ template "lh1" (w `<b'= d>4`) }}
  <b= d>4. | <a e'> | <e d'> | <b=, fis'> \fermata |
}
{{ end }}
