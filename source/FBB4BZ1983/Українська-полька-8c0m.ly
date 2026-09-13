{{ define "rh1a" }}
  g'=''8-. <c, e>-. e16( dis e g | f8)-. <b, d>-. d16( cis d f='' |
{{ end }}

{{ define "rh1b" }}
  g='8-. e-.  g16( fis g e | f8)-. d-. f16( e f d=' |
{{ end }}

{{ define "rh2a" }}
  {{ .a }} c' b a | g f) b,16( d f {{ .b }} |
{{ end }}

{{ define "rh2b" }}
  c='8( e d c | b a~ a=4) |
{{ end }}

{{ define "rh3a" }}
  {{ .a }} e) gis,16( b d e | d8 c) a16( b c {{ .b }} |
{{ end }}

{{ define "rh3b" }}
  {{ .a }} gis~ gis4) | b8( a~ {{ .b }} |
{{ end }}

{{ define "lh1" }}
  {{ .a }} e' <a c> e | d a' <d f> a | e gis <d' e> gis,= |
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
      e=''8)-. c-. c16( d e f | <c e g>4) <c f a> |
      {{ template "rh1a" }} | c=''8)-. <g e'>-. <e=' c'>4 |
    }

    {{ template "rh2a" (w `e='8(` `g='`) }} |
    {{ template "rh3a" (w `f='8` `d=')`) }}
    {{ template "rh2a" (w `e='8(` `g=')`) }} |
    f='16( e dis e f fis g gis | a16 gis a b c b c d='') |

    {{ template "rh2a" (w `e=''8(` `g=''`) }} |
    {{ template "rh3a" (w `f=''8` `d='')`) }}
    {{ template "rh2a" (w `e=''8(` `g='')`) }} |
    f=''16( e dis e f fis g gis | a4)-> a,='-> \bar "|."
  } {
    g'='4 a | {{ template "rh1b" }}
    g='8)-. e-. e16( f g a | g4) a |
    {{ template "rh1b" }} | e='8)-. e-. c='4 |

    {{ template "rh2b" }} {{ template "rh3b" (w `a=8(` `a=4)`) }}
    {{ template "rh2b" }} | gis4 d'8 b | c16( b c d e d e f) |
    c'=''8( e d c | b a~ a4) | {{ template "rh3b" (w `a='8(` `a='4)`) }}

    c=''8( e d c | b a~ a4) | <b d>2 | <a c>4-> <a,= c e>-> |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  <c= g'>4-\frBass <f a> | c8_\aSta g' e g | g, g' f g | c,8 g' e g |
  <c,= g'>4 <f a> | c8 g' e g | g, g' f g | <c,= g'>8 8 4 |

  \rep 3 { {{ template "lh1" (w `a=,8`) }} | a, e' <a c> e= | }
  {{ template "lh1" (w `a,=,8`) }} | a,4-> <a=, e'>-> |
}
{{ end }}
