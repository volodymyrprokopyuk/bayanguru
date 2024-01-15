{{ define "t4" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } \tuplet 3/2 { {{ .d }} } |
{{ end }}

{{ define "t2" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
{{ end }}

{{ define "rh1" }}
  {{ template "t4" (w .a `f'( d a)` `d( b g)` `e'( c g)`) }}
  {{ template "t2" (w `c=''8( a f)` `d'( b a)`) }}
  gis='8.(\< \trill fis32 gis \af 8\! a8)-. r |
{{ end }}

{{ define "lh1a" }}
  {{ template "t4" (w `r4 am!8` `r4 dm!8` `r4 g7!8` `r4 cM!8`) }}
  {{ template "t2" (w `r4 fM!8` `r4 dm!8`) }} e7!4( am!8)-. d \rest |
{{ end }}

{{ define "lh1b" }}
  {{ .a }} d, g c | f, d e( a=,8)-. s8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key a \minor
  \time 4/4
  {{ template "rh1" (w `e''=''8(\mp c a)`) }}
  {{ template "t4" (w `e'=''8( c a)` `a'( f d)` `d( b g)` `g'( e c)`) }}
  {{ template "t2" (w `c'='''8( a fis)` `b( g e)`) }} %
  dis=''8.(\< \trill cis32 dis \af 8\! e=''8)-. r |

  r4\mf \tuplet 6/4 { a=''16( g f e d c) } %
  r4 \tuplet 6/4 { g'=''16( f e d c b) } |
  r4 \tuplet 6/4 { f'=''16( e d c bes a) } %
  \tuplet 6/4 { d=''16(\< c bes a g \af 16\! f) } \af 4\! e='4\> \trill |

  {{ template "rh1" (w `e'=''8(\p c a)`) }}
  cis=''8.(\mf\< \trill c32 cis \af 8\! d8)-. r %
  gis,='8.(\p\< \trill fis32 gis \af 8\! a8)-. r |
  {{ template "t4" (w `e='8( c a)` `f'( d a)` `a'( f d)` `d'( a f)`) }}
  {{ template "t4" (w `e'=''8(\< c \af 8\! a)` `f'(\> c \af 8\! a)`
     `e'(\< c \af 8\! a)` `fis'(\> d \af 8\! a)`) }}
  <a=' c e a>1\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  \duo {
    \hideTupletBracket
    {{ template "lh1a" }}
    {{ template "t4" (w `r4 am!8` `r4 dm!8` `r4 g7!8` `r4 cM!8`) }}
    {{ template "t2" (w `r4 am!8` `r4 em!8`) }} b7!4( eM!8)-. d \rest |

    r4 \tuplet 3/2 { r8 dm!4 } r4 \tuplet 3/2 { r8 cM!4 } |
    r4 \tuplet 3/2 { r8 besM!4 } \tuplet 3/2 { r8 bes@M4 } e7!4 |

    {{ template "lh1a" }} | a7!4( dm!8)-. d \rest e7!4( aM!8)-. d \rest |
    a@m!4 d@m!4 r4 d@m!4 | a@m!4( f@M!4) a@m!4( d@M!4) | a@m!1 |
  } {
    {{ template "lh1b" (w `a,=,4-\stBass`) }}
    a=,4 d, g c | a e b'( e,=,8)-. s8 |

    \tuplet 3/2 { cis'=8-. e-. a,-. } d4-- %
    \tuplet 3/2 { b=,8-. d-. g,-. } cis4-- |
    \tuplet 3/2 { a=,8-. c-. f,-. } bes4-- f-- e=,-- |

    {{ template "lh1b" (w `a=,4`) }}
    a=,4( d,8)-. s8 e4( a8)-. s8 | s2 b=,2 | s1 | s1 |
  }
}
{{ end }}
