{{ define "rh1" }}
  {{ .a }} gis a)-. bes-. | c( b c)-. a-. | bes( a bes)-. g='-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Giocoso
  \clef treble
  \key f \major
  \time 2/4
  {{ template "rh1" (w `a'='8(\mf`) }} | a='8( aes g)-. aes-. |
  {{ template "rh1" (w `a='8(`) }} | a='8(\> g f \af 8\! e=') |

  d='8(\p cis) d-. e-. | f( e) f-. d-. |
  e='8(_\dCre dis) e-. f-. | g( fis) g-. e-. |
  f='8( e) f-. g-. | a( gis) a-. f-. |
  g='8( fis) g-. a-. | bes-. a-. bes-. g-. |
  a='8(\f gis a)-. bes-. | c( b c)-. a-. |
  bes='8-. c-. d-. e-. | f=''4-- r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key f \major
  f'='8(-\frBass e f)-. g-. | a( gis a)-. f-. |
  g='8( fis g)-. e-. | f( e dis)-. e-. |
  f='8( e f)-. e-. | ees( d ees)-. c-. |
  d='8( cis d)-. bes-. | c( bes a g=) \clef bass |

  f=8( e) f-. g-. | a( gis) a-. f-. |
  g=8( fis) g-. a-. | bes( a) bes-. g-. |
  a=8( g) a-. bes-. | c( b) c-. a-. |
  bes=8( a) bes-. c-. | d-. c-. d-. e-. |
  f='8( e f)-. e-. | ees( d ees)-. c-. |
  bes=8-. a-. g-. ges-. | f4( f,=,8) r |
}
{{ end }}
