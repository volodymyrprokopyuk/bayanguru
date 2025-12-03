{{ define "rh1" }}
  {{ .a }} fis gis a b c | d c b c b a) | g4.-> g-> | g'-> e-> |
  e,='8( fis gis a b c | d c b c b a=') |
{{ end }}

{{ define "lh1" }}
  R2. | R2. | {{ .a }} a b c d e | f e d c4.) | e,4.-> e=-> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key a \minor
  \time 6/8
  {{ template "rh1" (w `e'='8(\f`) }} | b='4.-> b-> | <b dis>-> e=''-> |

  e=''8(\p d c d c b) | f'( e d e d c) | a'( g f g f e | f e d e4.) |
  e=''8(_\dCre d c d c b) | c( b a g fis e) | b'( a g fis e dis | e g b e=''4) r8 |

  {{ template "rh1" (w `e,='8(\f`) }} | f'=''8( e d c b a | e a gis a='4) r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `g=8(-\frBass`) }} | e'='4.-> a,8( b c=' \clef treble |
  b=8 cis dis e fis g | a g fis e='4.) \clef bass |

  <c,= g'>2. | 2. | <f c'>4. <e c'> | <g b> <c, c'> |
  <c= gis'>2. | <c a'>4. <c ais'> | <b b'> <b a'> | <e g> e,=,4 r8 |

  {{ template "lh1" (w `g'=8(`) }} | e'='4.-> a,-> |
  <d,= f bes>4. <dis fis c'> | <e c'>4 <e d'>8 <a= c>4 r8 |
}
{{ end }}
