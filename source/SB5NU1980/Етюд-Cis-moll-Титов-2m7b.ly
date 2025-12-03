{{ define "rh1a" }}
  dis'=''8 dis, dis'_\dCre dis, |
  \rep 2 { bis'='8 bis,= } | \rep 2 { cis'=''8 cis,=' } |
  \rep 2 { dis'=''8 dis,=' } | \rep 2 { e'=''8 e,=' } |
  fisis'=''8_\dDim fisis,=' fisis' fisis, | \rep 2 { fis'=''8 fis,=' } |
  \rep 2 { eis'=''8 eis,=' } | fis'_\dCre fis, fis' fis, |
  \rep 2 { fis'=''8 fis,=' } \rep 2 { gis'=''8 gis,=' } |
  \rep 2 { fis'=''8 fis,=' } | \rep 2 { e'=''8 e,=' } |
  dis'=''8_\dDim dis, dis' dis,=' |
{{ end }}

{{ define "rh1b" }}
  \rep 4 { fisis,='16 ais=' } |
  \rep 4 { dis,='16 fis=' } | \rep 4 { e='16 gis=' } |
  \rep 4 { fis='16 a=' } | \rep 4 { gis='16 cis='' } |
  \rep 4 { ais='16 cis='' } | \rep 4 { gis='16 bis=' } |
  \rep 4 { b='16 cis='' } | \rep 4 { a='16 cis='' } |
  \rep 4 { a='16 b=' } | \rep 4 { b='16 e='' } |
  \rep 4 { a,='16 cis='' } | \rep 4 { gis='16 cis='' } |
  \rep 4 { fis,='16 gis=' } |
{{ end }}

{{ define "lh1" }}
  {{ .a }} r cism! r | dis r dis7! r | gis, r gis7! r | cis r {{ .b }} r |
  fis,=,8 r fism! r |
{{ end }}

{{ define "lh2" }}
  b=,8 r b7! r | e r eM! r | fis, r fism! r | gis r cis@m! r8 |
  gis=,8 r gis7! r | cis= r {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key cis \minor
  \time 2/4
  \duo {
    e''=''8\mp^\aLeg e,_\aLeg e' e, | {{ template "rh1a" }}
    \rep 2 { cis'=''8 cis,=' } |

    b'='4(\mf a | gis e) | b'( a | \af 2\! gis2)\> |
    r16 b='16( \rep 6 { cis=''16 b=' } cis b) |
    r16 b='16( \rep 6 { cis=''16 b=' } cis8) |
    cis=''4(\mf dis | bis e) | dis( fis | \af 2\! e2)\> |
    r16 dis=''16( \rep 6 { e=''16 dis='' } e dis) |
    r16 dis=''16( \rep 5 { e=''16 dis='' } e^\tRit dis e dis='') |

    e=''8\mp^\tATem e, e' e, | {{ template "rh1a" }}
    cis'=''8\> cis,=' \af 4\! cis'=''4 \bar "|."
  } {
    \rep 4 { gis'='16 cis='' } | {{ template "rh1b" }}
    \rep 4 { e='16 gis=' } |

    r16 cis,='16( \rep 6 { b=16 cis=' } b cis) |
    r16 cis='16( \rep 6 { b=16 cis=' } b8) |
    e='4(\f d | cis a) | e'( d | \af 2\! cis2)\> |
    r16 fis='16( \rep 6 { gis='16 fis=' } gis fis) |
    r16 fis='16( \rep 6 { gis='16 fis=' } gis8) |
    a='4(\mf fis | gis  e) | dis( ais | \af 2\! bis=2)\> |

    \rep 4 { gis'='16 cis='' } | {{ template "rh1b" }}
    \rep 2 { e='16 gis=' } e='4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key cis \minor
  {{ template "lh1" (w `cis=8-\stBass` `cism!`) }}
  {{ template "lh1" (w `cis'=8` `cis7!`) }}
  {{ template "lh2" (w `cism!8 r`) }}

  \rep 2 { b=,8 r b7! r | e= r eM! r | }
  \rep 2 { e=8 r e7! r | a,=, r aM! r | }
  fis=,8 r fism! r | gis r cis@m! r8 | gis r gis7! r | cis r cism! r |
  fis,=,8 r fism! r | gis r cis@m! r8 | dis' r dis7! r | gis,=, r gis7! r |

  {{ template "lh1" (w `cis=8` `cism!`) }}
  {{ template "lh1" (w `cis'=8` `cis7!`) }}
  {{ template "lh2" (w `cism!4`) }}
}
{{ end }}
