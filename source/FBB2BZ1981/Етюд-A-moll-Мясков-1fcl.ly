{{ define "rh1" }}
  {{ .a }} a) b-. c-. b-. a-. | e'[-.-> r c]-. d[-. r b]-. | c=''8[-. r a=']-. %
{{ end }}

{{ define "lh1" }}
  {{ .a }} r r fis'-. r r | f-. r r e-. r r | dis-. r r d='-. r r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key a \minor
  \time 6/8
  \repeat volta 2 {
    {{ template "rh1" (w `e'='8(\mf`) }} b[-. r g]-. | a[-. r f]-. e4. |
    {{ template "rh1" (w `e='8(`) }} b( g e) |
    \alternative {
      \volta 1 { a='2. | }
      \volta 2 { a='2. | }
    }
  }

  b='8(\p c b e, f e) | c'(_\dCre d c e, f e) | d'( e d b c d | e2.)\mf |
  dis=''8(\mp e dis b cis b) | e( fis e b cis b) |
  fis'=''8( gis fis b, cis b) | e( fis e) e(^\tRit f e='') |

  {{ template "rh1" (w `e,='8(\mp^\tATem`) }} b[-. r g]-. | a[-. r f]-. e4. |
  {{ template "rh1" (w `e='8(`) }} b( g e) |
  R2. | c''='''8[-.-> r a]-. b( g e) | <c='' a'>-> r4 r4. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key a \minor
  {{ template "lh1" (w `a=8-.->-\frBass`) }} | c='8-. r r d( c b) |
  {{ template "lh1" (w `a=8-.->`) }} | g='8( f e) d( c b) | f'( e d) c( b a=) |

  gis=4.( d') | a( c) | b g8( a b) | c( b c) b( a g) |
  b=4.( dis) | gis( e) | dis( a') | gis d8( c b=) |

  {{ template "lh1" (w `a=8-.->`) }} | c='8-. r r d( c b) |
  {{ template "lh1" (w `a=8-.->`) }} | c='8[-.-> r a]-. b( g e) |
  R2. | <a= e'>8-> r4 r4. |
}
{{ end }}
