{{ define "rh1" }}
  {{ .a }} c') c8-. d-. bes-. | f,16( c') c8-. d-. bes-. |
  g='16( a bes='8) %
{{ end }}

{{ define "rh2" }}
  {{ .a }} c' c, b bes g e8)-> | g16 g c,8-. g'16 g c,8-. |
  a'='8-. f16( g a bes c d='') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} f7! bes, besM! | f' f7! bes, besM! |
  ees=8 eesM! d bes@M! | c8 f@7! bes=,8 besM! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  \repeat volta 2 {
    {{ template "rh1" (w `f''=''16(\mf`) }} f bes16( d) |
    f=''16( ees c ees) d8( f) |
    {{ template "rh1" (w `f=''16(`) }} d,-. g16( bes |
    d=''16 d' a bes g=''4) |
  }

  \repeat volta 2 {
    {{ template "rh2" (w `c,=''16(\f`) }}
    c=''16 c f8-. c16 c f8-. |
    {{ template "rh2" (w `c=''16(`) }}
    c=''16( a) bes( g) f='4-> |
  }

  {{ template "rh1" (w `f'=''16(\mf`) }} f bes16( d) |
  f=''16( ees c ees) d8( f) |
  {{ template "rh1" (w `f=''16(`) }} f-. bes16( d |
  f=''16 ees c d bes='4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  {{ template "lh1" (w `f=8-\stBass`) }}
  \rep 2 { f'=8 f7! bes, besM! | }
  ees=8 ees7! d g@m! | d8 d7! g,=, gm! |

  \rep 2 { e'=8 c@7! c=8 c7 | }
  \rep 2 { f=8 fM! c f@M | }
  \rep 2 { e=8 c@7! c=8 c7 | }
  f=8 fM! c f@M | e8 c@7! f=8 fM! |

  {{ template "lh1" (w `f=8`) }}
  \rep 2 { f'=8 f7! bes,=, besM! | }
  ees=8 eesM! f bes@M! | f8 f7! bes,=, besM! |
}
{{ end }}
