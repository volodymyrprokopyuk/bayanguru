{{ define "rh1a" }}
  {{ .a }} bes c \af 8\! ees | d\> c bes \af 8\! a=' |
{{ end }}

{{ define "rh1b" }}
  f'='4 g | bes8 ees, d c | d( ees f g | <d f> <c ees> <d=' f>) s8 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key g \minor
  \time 2/4
  \meter 1/2 #'(1)
  \duo {
    {{ template "rh1a" (w `d''=''8\(\p\<`) }} | g2~ | g4.\) b8 \rest |
    {{ template "rh1a" (w `d=''8\(\mp\<`) }} | bes2~ | bes4.\) b8 \rest |
    bes='8(\mp a bes) d | c( bes a) ees' | d(-. c-. bes-. g)-. |
    \af 4.\! a='4.\< d8(\mf | bes a bes) d | c(\< bes a) \af 8\! ees' |
    ees=''8->\> d c \af 8\! bes | a8[ f16( g] a[ bes c=''8]) |

    {{ template "rh1a" (w `d=''8\(\p\<`) }} | g2~ | g4.\) b8 \rest |
    {{ template "rh1a" (w `d=''8\(\mp\<`) }} | bes2~ | bes4.\) b8 \rest |
  } {
    g'='4 g | d'8 a d,4 | bes( c8 ees | <bes d> <a c> <bes d>) s8 |
    {{ template "rh1b" }}
    e='2( | ees) | f8(-. <ees f>-. <d f>-. <des f>)-. | <c f>4. r8 |
    e='2( | ees) | g8-> f ees des | c=' s4. |

    g'='4 g | s4 g8 d | bes4( c8 ees | <bes d> <a c> <bes d>) s8 |
    {{ template "rh1b" }}
  }

  c'='8(\mp b d des) | f(\< e g \af 8\! ges) |
  f='8(\>^\tRit fis g c \fermata | \af 4.\! <d,=' bes'>4.) r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
}
{{ end }}
