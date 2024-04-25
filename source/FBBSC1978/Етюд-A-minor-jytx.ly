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
}
{{ end }}
