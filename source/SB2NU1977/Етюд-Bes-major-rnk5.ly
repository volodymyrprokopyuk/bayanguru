{{ define "rh1" }}
  d=''8-. d16( ees f8) r | d'-.\pp d16( ees f='''8) r |
{{ end }}

{{ define "lh1" }}
  a=,8[ f@M! fM8 fM] | a8[ f@M fM8 fM] |
  bes=,8 besM! besM besM | bes=, besM besM besM |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key bes \major
  \time 2/4
  \repeat volta 2 {
    bes'='4.(\p d8) | f4.( bes8) | a16( bes c bes a8)-. g-. |
    f=''4( d8)-. f-. | ees-. ees-. ees16( g f ees | d8)-. d-. d16( f ees d) |
    c=''16( d e f g a bes g) | f( a c f f,=''8) r |
  }

  \repeat volta 2 {
    c'='''4.(\p a8 | f4. ees8) | {{ template "rh1" }}
    ees='''4.(\p c8) | ees[( c a ees]) | {{ template "rh1" }}
    bes,=''4.(\p f8 | d'[ c bes a]) | c[(\< bes a \af 8\! g] |
    fis=''8[ g ees c]) | f4 f, | f'(~ f16 ees c a) |
    bes='8-.\> f16( d' bes8)-. f16( \af 16\! d' |
    bes='16 d f d bes='8) r |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  \meter 1/2 #'(1)
  bes,=,8(-\stBass besM!)-. besM-. besM-. | bes( besM)-. besM-. besM-. |
  bes=,8[_\aSim ees@M! eesM8 eesM] | bes besM! besM besM |
  a+f@M!8[ a+fM8 a+fM] r | bes+besM!8 bes+besM bes+besM r |
  c+c7!8 c+c7 c+c7 r | f=, fM! fM r |

  {{ template "lh1" }} {{ template "lh1" }}
  d=8[ bes@M! besM8 besM] | d[ bes@M besM8 besM] |
  ees=8 eesM! eesM eesM | ees[ c@m! cm8 cm] |
  f,=,8[ bes@M! besM8 besM] | f f7! f7 f7 |
  bes=,8[ besM!] bes besM | bes=,8 besM! besM r |
}
{{ end }}
