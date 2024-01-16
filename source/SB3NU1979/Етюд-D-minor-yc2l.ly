{{ define "rh1" }}
  {{ .a }} e d c bes a) | e'( d c bes a g) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} g f e d cis | d e f g gis a\) |
{{ end }}

{{ define "rh3" }}
  {{ .a }} bes a g f e | f g a bes b c\) |
{{ end }}

{{ define "rh4" }}
  {{ .a }} gis a bes b cis | d e f g gis \af 16\! a=''\) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} dm!4 | g,8 gm!4 | a8 a7!4 | d=8 dm!4 |
{{ end }}

{{ define "lh2" }}
  {{ .a }} fM! r | bes besM! r | c c7! r | f,=, fM! r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key d \minor
  \time 3/8
  {{ template "rh1" (w `f''=''16(\mf`) }}
  {{ template "rh2" (w `a='16\(`) }}
  {{ template "rh1" (w `f'=''16(`) }}
  {{ template "rh4" (w `a='16\(\<`) }}
  {{ template "rh1" (w `f'='''16(\f`) }}
  {{ template "rh2" (w `a=''16\(`) }}
  {{ template "rh1" (w `f'='''16(`) }}
  a=''16\(\>^\tRit g f e d cis | d cis c b bes \af 16\! a='\) |

  {{ template "rh1" (w `f'=''16(\p^\tATem`) }}
  {{ template "rh3" (w `c=''16\(`) }}
  {{ template "rh1" (w `f=''16(`) }}
  c=''16\(\< b c cis d e | f g a bes b \af 16\! c\) |
  {{ template "rh1" (w `f='''16(\f`) }}
  {{ template "rh3" (w `c='''16\(`) }}
  {{ template "rh1" (w `f='''16(`) }}
  c='''16\(\>^\tRit bes a g f e | f e f g a \af 16\! g=''\) |

  {{ template "rh1" (w `f=''16(\p^\tATem`) }}
  {{ template "rh2" (w `a='16\(`) }}
  {{ template "rh1" (w `f'=''16(`) }}
  {{ template "rh4" (w `a='16\(\<`) }}
  {{ template "rh1" (w `f'='''16(\f`) }}
  {{ template "rh2" (w `a=''16\(`) }}
  {{ template "rh1" (w `f'='''16(`) }}
  a=''16\( gis a bes b cis | d8\)\f <d,='' f a d> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `d=8-\stBass`) }}
  {{ template "lh1" (w `d=8`) }}
  {{ template "lh1" (w `d=8`) }}
  d=8 dm!4 | g,8 gm!4 | a8 a7!4 | d( c=8) |

  {{ template "lh2" (w `f,=,8`) }}
  {{ template "lh2" (w `f=,8`) }}
  {{ template "lh2" (w `f=,8`) }}
  f=,8 fM! r | bes besM! r | c c7! r | f4( e=8) |

  {{ template "lh1" (w `d=8`) }}
  {{ template "lh1" (w `d=8`) }}
  {{ template "lh1" (w `d=8`) }}
  d=8 dm!4 | g,8 gm!4 | a8 a7!4 | d=8 d+dm! r |
}
{{ end }}
