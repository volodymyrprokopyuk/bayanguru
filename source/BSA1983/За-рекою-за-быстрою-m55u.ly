{{ define "rightHand" }}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key a \major
  \time 2/4
  e''=''4.\pp d8 | cis e b4 | a %
  \duo {
    s4 | e''=''4. d8 | cis e b4 | a b | cis e | d cis8 e | b4 a8 b |
    <a=' cis>4 4 | <gis b> <fis a> | <gis=' e'>2 |
  } {
    \once \stemUp a'='4~ | a e | fis gis | a gis | fis e | fis2 |
    gis='4 a8 gis | fis4 e | dis cis | b=2 |
  }

  \duo {
    e''=''4.\mf d8 | cis e b4 | a8[ b cis d] | e4. d8 | cis e b4 |
    a='4 a8 b | cis4 e | d cis8 e | b4 a8 b | cis4 cis | b a | r4 <gis=' b e> |
  } {
    r8 e'='[( fis e]) | \rep 4 { fis='8[( e fis e=']) | }
    fis='8( e) a( gis) | \rep 3 { a='8( gis) gis( fis=') | }
    fis='8( e) e( dis) | d( cis) cis( dis) | e='2 |
  }

  \meter 1/2 #'(1)
  e''='''8\p fis e d | cis b a gis | a b gis fis | e fis e d |
  cis=''8 b a gis | a b cis4~ | cis8 a cis e | d e cis e | b e a, b |
  \duo { cis''=''4\<^\tRit <a cis> | b8 cis \af 4\! a4 | <gis=' e'>2\f \fermata \bar "|." }
  { r8 fis'='4 e8 | <dis gis>4 <cis fis> | b=2 | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  \rep 10 { R2 | } r4 b,=,4-\stBass | e=2 |

  \rep 2 { a,=,4 aM! | e' b@m! | a,4 aM! | } % a aM! | e' b@m! | a,4 aM! |
  fis=,4 fism! | b bm! | e e7! | a, fis@m! | gis4-- fis-- |
  \duo { r4 eM! | } { e,=,2-- | }

  a=,4 aM! | a e@7! | a4 b@m! | a4 aM! | a e@7! | a4 aM! | gis a@M! |
  fis'=4 e | d dM! | a aM! | b fis@m! | a+aM!2 \fermata |
}
{{ end }}
