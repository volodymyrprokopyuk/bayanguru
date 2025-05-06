{{ define "lh1" }}
  \duo { r4 aM! | } { a,=,2 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key a \major
  \time 4/4
  \meter 1/4 1,1,1,1
  a'='8\mf a \acc { gis'=''8 } a4-> a,8 a \acc { gis'=''8 } a4-> |
  a,='8[ a] cis[ d] e4. d8 | cis cis b4 a2 |
  a='4(\f <a cis>8 <b d> <cis e>4. <b d>8) |
  <a=' cis>8 8 <gis b>4 a='2 |

  cis=''8(\p e) b-. b-. cis-. cis-. d( b) |
  cis=''16(\< a cis e) b( gis b e) cis( a cis e) d8( \af 8\! b) |
  cis=''8 <a cis> <gis b>4 a2 |
  <e=' a cis>8\> 8 <d gis b>4 \af 2\! <cis=' e a>2 |

  \duo { \acc { gis''=''8 } a2(->\f gis4. fis=''8) | }
  { r8 a'='8[( cis e] e4. d=''8) | }
  <cis'='' e>8 8 <b d>4 <a cis>2 |
  \duo {
    \acc { dis''=''8 } e4\(->\p cis8 dis e4. dis8 |
    cis=''8 e b4 a='2\) \barFermata |

    \tempo Moderato
    cis=''8[( e]) b[-. b]-. cis[-. cis]-. d[( b=']) |
  } {
    r8 e'='8[( a fis] gis2) | a4( gis a='2) |

    a='4( gis g fis=') |
  }
  cis=''16(^\tAcc_\dCre e, a e' b e, b' d cis e, a cis <fis, d'>8 b) |
  cis=''16( e, a cis) b( d, e gis) a( e fis gis a^\tRit gis a b) |
  \tempo Lento
  <e,=' a cis>8--\f 8-- <d e gis b>4-> <cis=' e a>2-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \major
  \meter 1/4 1,1,1,1
  r8 a@M! r8 d@M! r8 a@M! r8 d@M! |
  \rep 2 {
    a,=,8 aM! e' e7! a, aM! e' e7! |
    a,=,8 aM! e'= e7! {{ template "lh1" }} %
  }

  \rep 2 { a,=,8 aM! e' e7! a, aM! d= dM! | }
  a=,8 aM! e' e7! {{ template "lh1" }} %
  e=8 a@M! e=8 e7! {{ template "lh1" }} %

  a,=,8[( aM!) aM aM] e'[( e7!) e7 e7] |
  a,=,8 aM! e' e7! {{ template "lh1" }} %
  a,=,8[( aM!) aM d@M] e'8[( e7!) e7 e7] |
  a,=,8 aM! e'= e7! {{ template "lh1" }} %

  a,=,8 aM! e' e7! a, aM! d dM! |
  a=,8 aM! e' e7! a, aM! b bm! |
  a=,8 aM! e' e7! a, aM! a+aM r |
  e'=8 a@M! e=8 e7! {{ template "lh1" }} %
}
{{ end }}
