{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } %
{{ end }}

{{ define "rh1" }}
  {{ template "t1" (w .a) }} a'2 |
  {{ template "t1" (w `g=''8( f e)`) }} a2 |
  {{ template "t1" (w `a=''8( g f)`) }} d'2 |
  {{ template "t1" (w `c='''8( bes a)`) }} g=''2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 3/4
  \meter 1/4 1,1,1
  {{ template "rh1" (w `f''=''8(\mf e d)`) }}
  {{ template "t1" (w `a=''8( g f)`) }} e2 |
  {{ template "t1" (w `g=''8( f e)`) }} d2 |
  e=''8( f e f e d | cis4 e a='') |

  {{ template "rh1" (w `f=''8( e d)`) }}
  {{ template "t1" (w `bes=''8( a g)`) }} f2 |
  {{ template "t1" (w `a=''8( g f)`) }} e2 |
  \rep 3 { {{ template "t1" (w `d=''8( f e)`) }} } | d=''2. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=4-\stBass dm! dm | cis a@M! aM4 | d dm! dm | d g@m! gm4 |
  cis=4 a@M! aM4 | d dm! dm | e= eM! eM | a+aM! r r |

  d=4 dm! dm | cis a@M! aM4 | d dm! dm | bes g@m! gm4 |
  a=,4 d@m! dm4 | a aM! aM | d= dm! dm | d+dm!2. |
}
{{ end }}
