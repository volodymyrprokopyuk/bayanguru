{% macro rightHand() %}
\relative {
  \tempo Lento
  \clef treble
  \key fis \minor
  \time 2/4
  \meter 1/2 #'(1)
  R2\p | R2 | fis'='4\( cis | cis'4. a8 |
  b='8\< a gis \af 8\! fis | gis[ e] cis\) r |
  a'='4\(\p fis8 cis' | d4. cis8 |
  b='8\< <gis fis'> <cis e> \af 8\! <b d> |
  <a=' cis>8[ <b d>] <cis e>\)\< \af 8\! g |
  \duo {
    <cis''='' e>4(\mf <b d>) | r8\< <b d>( <a cis> \af 8\! <gis=' b>) |
  } { fis'='2 | eis='4. r8 | }
  fis='8( <a, d fis>\> gis' a) | \af 8\! b[( fis]^\tRit %
  <fis=' b fis'>8 \fermata d'='' \fermata) | cis(\pp a gis fis) |
  \duo { \af 8.\! dis'='4(\< \af 4\! eis\> | fis='2) | }
  { r8 <gis= bis>[ r <gis= b>] | }

  \duo {
    cis''=''4(\p fis,8 fis') | fis[( fis] fis fis) |
    gis,='8(\< <d' fis> <cis e> \af 8\! <b d>) | e4 <cis e> |
    g='8[\(\< \af 16.\! <cis e>] d cis |
    e=''8[\mf d] cis b\) | \af 2\! cis2\> |
    \af 8.\! dis,='4\< \af 4\! eis\> | fis='2 |
  } {
    cis''=''4 fis, | d'8[( cis] b a) | gis4 r | cis8( b a gis) |
    g='4 b8 ais | fis[ b] a gis | cis( a gis fis) |
    r8 <gis,= bis>8[ r <gis b>] | r <a cis>[ r <a= cis>] |
  }
  r8\< <a,= d fis>4 \af 8\! 8 | r <gis bis dis fis>4 8 |
  r8\> <gis= b d fis>4 \af 8\! 8 | r\p <a cis fis>4^\tRit %
  \duo {
    s8 | a'='4\> \af 4\! cis | cis=''\pp %
  } {
    \once \stemUp
    <cis'=' fis( >8 | fis) fis4 <fis a>8~ | <fis=' a>4 %
  }
  r4 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key fis \minor
  \meter 1/2 #'(1)
  fis,=,8(-\stBass fism!) fism fism | fis( fism) fism fism |
  fis=,8_\aSim fism! fism fism | a[ fis@m! fism8 fism] |
  gis=,8[ b@m! bm8 bm] | cis cism! cism cism |
  fis,=,8 fism! fism fism | b bm! bm bm |
  e=8 e7! e7 e7 | a, aM! fis@7![ ais8] |
  b=,8 bm! bm bm | cis cis7! cis7 cis7 |
  d=8( cis b a | gis) b@m! bm4 \fermata |
  cis=8[ fis@m! fism8 fism] | r gis[ r cis=] |

  fis,=,8 fism! fism fism | ais[ fis@7! fis78 fis7] |
  b=,8 bm! bm bm | e e7! e7 e7 |
  a,=,8 aM! aM aM | ais fis@7! fis8 fis7 |
  b=,8 bm! bm bm | cis[ fis@m! fism8 fism] |
  gis=,4 cis | fis8( gis fis e) | d( cis b a) |
  gis=,2 | b4 a8( gis) | fis[( cis'] fis=) fism!~ | fism4 r | R2 |
}
{% endmacro %}
