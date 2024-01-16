{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
{{ end }}

{{ define "rh1" }}
  {{ template "t1" (w .a `e f g`) }}
  {{ template "t1" (w `a=''16 bes a` `g a bes`) }}
  \acc { d='''8) } c-. a-. \acc { d='''8 } c-. \af 8\! a=''-. |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro al unghero"
  \clef treble
  \key f \major
  \time 2/4
  \meter 1/8 2,2
  \set subdivideBeams = ##t
  \repeat volta 2 {
    {{ template "rh1" (w `f''=''16(\p\< g f`) }}
    \acc { c='''8 } bes-.\> g-. \acc { f='' } e-. c-. |
    {{ template "t1" (w `f=''16( g f` `e f a`) }} \af 4\! c,4) |
    {{ template "rh1" (w `f=''16(\p\< g f`) }}
    \tuplet 3/2 { g=''16( c e } g8)-. \tuplet 3/2 { d,16( f g } b8)-. |
    \tuplet 3/2 { c,=''16( e g } c8)-. c,=''4 |
  }

  \repeat volta 2 {
    {{ template "t1" (w `b'=''16(--\p\< c d` `c b c`) }} \af 4\! g4) |
    {{ template "t1" (w `gis=''16(--\< a bes` `a gis a`) }} \af 4\! f4) |
    {{ template "t1" (w `fis=''16(--\< g a` `g fis g`) }} c,8)-. \af 8\! c-. |
    c=''8(\> \acc { e=''8 } f)-. f( \acc { gis=''8 } \af 8\! a)-. |
    {{ template "t1" (w `b=''16(--\p\< c d` `c b c`) }} \af 4\! g4) |
    a=''8(\f \acc { e'='''8 } f)-. bes,( \acc { e='''8 } f)-. |
    c='''8-.\> \tuplet 3/2 { d='''16( c a } bes8)-. \tuplet 3/2 { c16( bes g } |
    f=''8)-. \tuplet 3/2 { f=''16( c a' } \af 8\! f=''8)-. r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \meter 1/2 #'(1)
  f,=,8-\stBass fM! fM fM | f fM fM fM | c' c7! c7 c7 | f, fM! fM fM |
  f=,8 fM! fM fM | f fM fM fM | g[ c@M! g=,8 g7!] | c@M![ cM8] cM4 |

  e=,8[ c@7! c78 c7] | f fM! fM fM | c' c7! c7 c7 | f, fM! fM fM |
  e=,8[ c@7! c78 c7] | f[ fM! d' bes@M!] |
  c=8[ f@M! c=8 c7!] | f+fM![ f+fM] f+fM r |
}
{{ end }}
