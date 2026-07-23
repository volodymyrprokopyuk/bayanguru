{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key e \minor
  \time 4/4
  \partial 4 { c''=''4-.\f | }
  \repeat volta 2 {
    b='4-. fis( g) e'-. | d-. a( b) g'-. | fis-. e( dis e | fis b,) b-. fis'-. |
    g=''4-. dis( e) b-. | c-. gis( a) d8(\< c |
    \alternative {
      \volta 1 { b='4) a-. g-. \af 4\! a-. | b2.\f c=''4-. | }
      \volta 2 {
        \hSpace b='4\< \sSlur nb #'() ( a)-. g-. \af 4\! dis-. | e2.\f c4(\p |
      }
    }
  }

  \repeat volta 2 {
    b=4) r r fis'( | e) r r a( | g fis8 g a4) ais-. | b2. fis'4-.\mf |
    g=''4-. dis( e) b-. |
    \alternative {
      \volta 1 {
        c=''4-. gis( a) e8( fis | g4) g-. a-. a-. |
        fis='2. c='4\p \sSlur uf #'((wb . 4)) ( %
      }
      \volta 2 {
        c'=''4)-. gis( a) d8(\< c | b4) a-. g-. \af 4\! dis-. | e='2.\f \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \partial 4 { r4 | }
  dis=2(-\frBass e4) r | fis2( g4) e-. | dis-. cis( b cis | dis b) b-. r |
  b=,2( c4) r | e2( c4) b8( a | g4) fis-. e-. fis-. | b-. fis-. b,-. r |
  g'=,4 \sSlur ub #'((wb . 3)) ( fis)-. b-. b-. | e-. b-. e,-. e'=( |

  dis=4) b-. b-. a( | g) b-. b-. c( | b a8 b c4) cis-. | dis-. b-. b,-. r |
  b'=,2( c4) r | e2( c4) c8( dis | e4) e-. fis-. fis-. |
  dis=4-. fis-. b,-. e \sSlur nf #'() ( | e2)( c4) b8( a |
  g=,4) fis-. b-. b-. | e-. b-. e,=,-. %
}
{{ end }}
