{{ define "rh1" }}
  {{ .a }} e a c a e a c) | a( e a e' d c b a=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  a'='8\p a a a | a( c b a) |
  gis='8 gis gis gis | gis( b a gis) |
  a='8 a a a | a( c b a) |
  gis='8( b e gis, | a2) |
  c=''8\mf c c c | c( e d c) |
  b='8 b b b | b( d c b) |
  a='8 a a\> a | a( c b a) |
  gis='8( b e \af 8\! gis, | a='2) |

  a='8(\mf c16 b a8 c16 b) | a8( c b a) |
  gis='8( b16 a gis8 b16 a) | gis8( b a gis) |
  a='8( c16 b a8 c16 b) | a8( c b a) |
  gis='8( b e \af 8\! gis, | a2) |
  c=''8( e16 d c8 e16 d) | c8( e d c) |
  b='8( d16 c b8 d16 c) | b8( d c b) |
  a='8( c16 b a8 c16 b) | a8( c b a) |
  gis='8( b e gis | a=''2) |

  {{ template "rh1" (w `a,='16(\p`) }}
  gis='16( e gis b gis e gis b) | gis( e gis b e d c b) |
  {{ template "rh1" (w `a='16(`) }}
  gis='16( e gis b e d c b | a2) |
  c=''16( g c e c g c e) | c( g c g' f e d c) |
  b='16( g b d b g b d) | b( f b f' e d c b) |
  {{ template "rh1" (w `a='16(`) }}
  gis='16( e gis b e d e gis | a=''2) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! | a am | e' eM! | e eM |
  a,=,4 am! | c a@m | e4 eM! | a, am! |
  c=4 cM! | c cM | g gM! | gis e@M! |
  a=,4 am! | c a@m | e4 e7! | a,=, am! |

  a=,4( am!) | c( a@m) | e4( eM!) | d( e@M) |
  c=4( a@m!) | a4( am) | e'( e7!) | a,( am!) |
  c=4( cM!) | e( c@M) | g,4( gM!) | gis( e@M!) |
  a=,4( am!) | c( a@m) | e4( e7!) | a,=,( am!) |

  a=,4 am! | c a@m | b4 e@7! | e4 e7 |
  a,=,4 am! | c a@m | e4 e7! a, am! |
  c=4 cM! | e c@M | g,4 g7! | gis e@7! |
  a=,4 am! | c a@m | e4 e7! | a,=, am! |
}
{{ end }}
