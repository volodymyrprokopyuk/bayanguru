{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key g \minor
  \time 3/4
  \meter 1/4 1,1,1
  d'='8(\p\< g g4 \af 4\! bes | a8\> g fis4 \af 4\! d) |
  d='8(\< g g4 bes | c8 ees \af 2\! d2) | d8(\mp d c4 a) |
  c=''8( ees d4 bes) | a8( bes c ees d c | bes\> a \af 2\! g='2) |

  \tempo "Con moto"
  bes,=8(\mf d g d g bes | a bes a g fis d) |
  f='8(_\dCre bes d bes d f | c ees d c d4) |
  ees=''8( f ees d c a) | d( ees d c bes g) |
  a='8( bes c d f ees | d\>^\tRit c bes a \af 4\! g='4) \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key g \minor
  R2. | R2. | bes=4(-\frBass d2 | f4 bes2) |
  \duo { f'='4( ees2) | f( d4) | ees4 d2~ | d='2. \clef bass | }
  { bes=2( c4) | a4( bes2) | c4( fis,2 | g=2.) | }

  g,,=,4-\stBass gm! gm | d' d7! d7 | bes besM! besM | f f7! bes+besM! |
  c'=4 cm! cm | f, f7! bes@M! | ees'4 c@m! cm4 | d= d7! g+gm! \fermata |
}
{{ end }}
