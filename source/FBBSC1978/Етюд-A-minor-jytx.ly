{{ define "rh1" }}
  {{ .a }} g) g g <f d'>( g) g g |
  | <g e'>16( d') <g, c>( e') <f, d'>( g) g g |
  | <e c'>16( g) g c <d, b'>( g) g-. {{ .b }} |
{{ end }}

{{ define "rh2" }}
  \duo { a'='16( e) e( a) b( e,) e( b') | c( a) a( c) d( b) b( d='') | }
  { c'='4 d | e {{ .a }} | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  <c'=' a'>16(\mf e) e a <d, b'>( e) e b' |
  <e,=' c'>16( a) a c <f, d'>( b) b d |
  <e,=' c'>16( a) a c <d, b'>( gis) <d gis> b' |
  <c,=' a'>16-. b'-. <e, c'>-. a-. <d, gis b>8 <e=' d'> |

  {{ template "rh2" (w `f='4`) }}
  <e=' c'>16( e') e( <c a'>) <c a'>( gis') <b, d gis>-. b'-. |
  <c,='' e a>8-. <b d gis>-. <c e a> a'32( g fis g='') |

  {{ template "rh1" (w `<e='' c'>16(\p` `a=''-.`) }}
  <d,='' g b>8-. <c fis a>-. <b d g>[ \acc { g='16 g g } g16 g='] |

  {{ template "rh1" (w `<e=' c'>16(\f` `a='-.`) }}
  <d,=' g b>8-.^\tRit <c fis a>-. <b d g> g'32( f e d=') |

  {{ template "rh2" (w `a='4`) }}
  \duo { c''=''16( a) a( c) b( gis) gis( b) | } { e'='4 d=' | }
  <c=' a'>16( b' <e, c'> a) <b, gis'>8 e'32( d c b=') |

  \duo {
    a'='16( e) e( c') b( e,) e( d') | c( a) a( c) d( b) b( d='') \barFermata |
  } { c'='4 d | e a | }
  <e,=' c'>16(\f^\tATem e') e( <c a'>) <c a'>( gis') <b, d gis>( b' |
  <c,='' e a>8) <b d gis>-> <c='' e a>-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\frBass <a' c> e <gis b> | a, <a' c> d, <f a d> |
  e=8 <a c> e <gis b> | a, <e' a c> <e gis b> <e= gis d'> |

  a=4( gis | g f) | \duo { e=4 e= | } { e=8 <a c> e <gis= b> | }
  <a= c e>8 <e= b' e> \clef treble <a= e' a>8 r |

  <e'=' g c>8 r <g b d> r | <g c e> <e g c> <g b d> r |
  <e=' g c>8 r <g b> r | <g b> <d a' d> <g,= d' g> r \clef bass |

  \rep 3 { c,=8( <e g c>) <g= b d> r | } | <g b d> <d a' d> g= r \clef treble |

  \duo { a'='4( gis | a~ a8) d='' \rest | } { s2 | a'='8 g f='4 | } \clef bass |
  \duo { e'='2~ | e8~ <c=' e> s8 } { r8 <a= c>8 e b' | a4 <e= b' e>8 } r8 |

  a=4( gis | a8 g d4) | e8( <a c>) e( <gis d'>) |
  <e= a c>8-> <e gis b>-> <a,=, e' a c>-> r |
}
{{ end }}
