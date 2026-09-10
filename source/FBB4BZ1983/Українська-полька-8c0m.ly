{{ define "rh1a" }}
  g'=''8-. <c, e>-. e16( dis e g | f8)-. <b, d>-. d16( cis d f='' |
{{ end }}

{{ define "rh1b" }}
  g='8-. e-.  g16( fis g e' | f,8)-. d-. f16( e f d'='' |
{{ end }}

{{ define "rh2a" }}
  {{ .a }} c' b a | g f) b,16( d f {{ .b }} |
{{ end }}

{{ define "rh3a" }}
  {{ .a }} e) gis,16( b d e | d8 c) a16( b c {{ .b }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \minor
  \time 2/4
  \duo {
    \repeat volta 2 {
      <c''='' e g>4 <c f a> | {{ template "rh1a" }}
      e=''8)-. c-. c16( c e f | <c e g>4) <c f a> |
      {{ template "rh1a" }} | c=''8)-. <g e'>-. <e=' c'>4 |
    }

    {{ template "rh2a" (w `e='8(` `g='`) }} |
    {{ template "rh3a" (w `f='8` `d=')`) }}
    {{ template "rh2a" (w `e='8(` `g=')`) }} |
    f='16( e dis e f fis g gis | a16 gis a b c b c d='') |

    {{ template "rh2a" (w `e=''8(` `g=''`) }} |
    {{ template "rh3a" (w `f=''8` `d='')`) }}
    {{ template "rh2a" (w `e=''8(` `g='')`) }} |
    f=''16( e dis e f fis g gis | a4)-> <c,='' e a>-> \bar "|."
  } {
    g'='4 a | {{ template "rh1b" }}
    g,='8)-. e-. e16( f g a | g4) a |
    {{ template "rh1b" }} | e,='8)-. e-. c='4 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
