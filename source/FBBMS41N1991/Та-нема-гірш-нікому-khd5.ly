{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key fis \minor
  \time 4/4
  \meter 1/4 1,1,1,1
  \duo {
    fis'='8 _\tenuto\mp\< fis_\tenuto fis_\tenuto fis_\tenuto \af 2\! fis='2 |
  } { s2 e'='8 d cis b= | }
  \time 2/4
  \af 2\! <fis= cis' fis>2\> \fermata |
  \time 4/4
  cis''=''8\p b a gis a4. gis16 fis | b2 a8 gis fis eis |
  fis='4 e8 d cis4 fis | e\mp e8 fis e4 d8 cis |
  b=4 fis' eis8 gis fis4 | cis='2 %
  \duo {
    a'='4 b8 gis | cis2. e8 cis | b4 a gis fis |
    e='4 e' b8 d cis4 | fis,='2. \fermata %
  } {
    r8 fis'='8 d4 | cis8 bis' b a gis fis e4~ | e8 d~ d cis~ cis b~ b d |
    d='2 e4. eis8 | r <a, bis>-> <a e'>->^\tRit <a d>-> <a= cis>4 \fermata %
  } r4 |

  \tempo "Con moto"
  \duo {
    cis''=''4.->\f gis8-> a4.-> gis16 fis | b2 a8 gis fis eis |
    fis='4 e8 d cis4 fis | e e8 fis <ais, e'>4 <b d>8 <ais cis> |
    b=4 fis'4 eis8 gis fis4 | cis( <b d>8 <d fis>) a'4 b8 gis |
    cis=''2. e8 <a, cis> | <gis b>4 <fis a> <eis gis> fis |
    e='4^\tRit e' b8 d cis=''4 |
  } {
    cis''=''8-> b-> a-> cis,-> r <cis fis>8[ 8] r |
    r8 <d=' fis>8 8 <cis d fis> <bis fis'>4 <gis b> |
    r8 <a= d>8 b4 a2 | <g b>4 4 fis2 | r8 a gis4~ <gis b> a~ |
    a=2 fis'8( e d4) | cis8 <fis ais>8 8 <eis gis> <fis ais> <dis fis> e4~ |
    e='8 d~ d cis~ cis b r <a cis> | r d16 b e8 <a cis> e4 a8 gis=' |
  }
  \trio { fis''=''2. \fermata } { fis'='2. \fermata } %
  { b'='8 \rest <cis='' e>8 8 <b dis> <a=' cis>4 \fermata } r4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key fis \minor
  \meter 1/4 1,1,1,1
  R1 | fis,=,2-\frBass \fermata | R1 |
  r8 d''='8 d cis~ cis4 d | r8 d cis b a gis a4 |
  r8 e=16( fis gis4~ gis8) a b ais | b2~ b4 a |
  cis='8 fis,16 gis a8 b cis4 a8 b | a a gis fis e b cis a' |
  gis=4 f e d | e8 fis e fis gis4 a8 gis |
  r8 d=8 d d  fis=4 \fermata r4 |

  r8 fis=4-> e8-> r d4-- r8 | r gis,4 b8 d4 cis |
  r8 b=,16( a g4~ g8) e fis4 | g8 fis g e fis ais fis4 |
  g=,8 fis' e d cis4 d8 d | e e b4 d8 cis b4 |
  cis=4 dis8 eis dis b a4 | b cis d cis8 a | gis4 a gis cis |
  r8 a=,8 a gis fis=,4 \fermata r4 |
}
{{ end }}
