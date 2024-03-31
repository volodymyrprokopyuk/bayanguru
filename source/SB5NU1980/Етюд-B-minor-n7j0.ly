{{ define "rh1a" }}
  r8 {{ .a }} e d4.~ | d8) d[( cis] b4.~ |
  b='8)\mf cis[( d] e4.~ | e8) d[( e] fis) r\p r |
  r8 fis=''8( e d4.~ | d8) d[( cis] b4.~ | b8) cis[( d] e=''4.~ |
{{ end }}

{{ define "rh1b" }}
  b=4.~ b8) d[(_\dCre e] | fis4.~ fis8) e[( fis] |
  g='4.~ g8) fis[(_\dDim e] | d4.~ d8) d[( cis] |
  b=4.~ b8) d[( e] | fis4.~ fis8) fis[(\< g] |
  \af 4.\! a='4.~ {{ .a }} %
{{ end }}

{{ define "rh2a" }}
  {{ .a }} fis=''8( e d4.~ | d8) d[( cis] b4.~ |
  b='8)\mf cis[( d] e4.~ | e8) d[( e] fis=''16) r\p r8 r |
{{ end }}

{{ define "rh2b" }}
  b=4.~ b16 cis[_\dCre d cis d e] | fis4.~ fis16) b,[( cis d e fis] |
  g='4.~ g16) g[(_\dDim fis g fis e] | d4.~ d='16) %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tranquillo caloroso"
  \clef treble
  \key b \minor
  \time 6/8
  \duo {
    \partial 4 { r8\p r8 | }
    {{ template "rh1a" (w `fis''=''8(`) }} e8) d[( e] fis) r r |
    r8 c=''8( d e4.~ | e8) fis[( e] d4.~ |
    d=''8) e[( d] c4.~ | c8)\mf d[( c] b) r r |
    r8 c=''8( b a4.~ | a8) b[( a] g4.~ |
    g='8) a[(^\tRal g] fis=') r\p r | \time 9/8 r4. r4. r4. |

    \time 6/8 {{ template "rh1a" (w `fis'=''8(`) }}
    \time 9/8 e=''8) r4 r4.^\tRit r4.^\tATem |

    \time 6/8 r8 d=''8( e fis4.~ | fis8) a[( fis] d4.~ |
    d=''8) e[( fis] g4.~ | g8) fis[( g] a) r r |
    r8 g=''8( a b4.~ | b8)\sf b[( a] gis4.~ |
    gis=''8) fis[( gis] a4.~ | a8)\sf a[( g] fis) r r |
    r8 e=''8( fis g4.~ | g8) a[( g] fis4.~ |
    fis=''8) d[(_\dCre e] fis) r r |
    r8\sf a=''8( g fis4.~ | fis=''8) r r r4. | \time 9/8 R1*9/8 |

    \time 6/8 {{ template "rh2a" (w `r8^\tATem`) }}
    {{ template "rh2a" (w `r8`) }}
    \rep 2 { r8\sf e=''8( dis e4.~ | e8) d[( e] fis=''16) r r8 r | }
    r8 e=''8( d cis4.~ | cis8) b[( ais] b4.~ |
    b='8) e[( d] cis4.~ | cis8) b[( ais] b) r r |
    r8 ais='( gis ais4.~ | ais8) a[( g] a4.~ |
    a='8) g[( fis] g4.~ | g8) fis[( eis] fis4.~ | fis='8) %
  } {
    d'='8( cis |
    {{ template "rh1b" (w `a='8)\f`) }} b='8[( a] |
    fis='4.~\> \af 8\! fis8) d[(\p fis] |
    a='4.~ a8) g[( a] | b4.~ b8) a[(_\dCre g] |
    fis='4.~ fis8) e[( d] | g4.~ g8) fis[( d] |
    dis='4.~ dis8) g[(_\dDim fis] | e4.~ e8) e[( d] |
    cis='4.~ cis8) cis[( b] |
    ais=8 cis g' fis g fis e) d[(\p^\tATem cis='] |

    {{ template "rh1b" (w `a='8)\mf`) }} e='8[( fis] |
    g='8 a b cis\> b a \af 8\! g) b[(\mp a] |
    fis='4.~ fis8) d[(\< fis] | a4.~ \af 8\! a8)\f g[( a] |
    b='4.~ b8) a[(_\dCre g] | c4.~ c8) b[( a] |
    d=''4.~ d8) c[( b] | f'4.~ f8) e[( d] |
    c=''4.~ c8) b[( a] | ees'4.~ ees8) d[( c] |
    b='4.~ b8) a[(\p g] | ais4.~ ais8) gis[( a] |
    b='4.~ b8) ais[( b] | c4.~ c8) c[( b] |
    ais='8) g[( fis] e16_\dDim fis e d cis b |
    ais=16 cis e cis e g fis g fis e fis e d^\tRal e d cis) d(\p cis=' |

    {{ template "rh2b" }} e='16[( d cis d cis] |
    {{ template "rh2b" }} b=16[( cis d e fis]) |
    g='4.~ g8 fis[(\> e] | \af 4.\! fis4.~ fis16) b,[\< cis d e \af 16\! fis] |
    g='4.~ g8 fis[(\> e] | \af 4.\! fis4.~ fis16) fis[( e fis e d] |
    cis='4.~ cis8) b[(_\dDim cis] | d4.~ d16) fis[( e fis e d] |
    cis='4.~ cis8) b[(\p cis] | \rep 5 { d='4.~ d8) b[( cis='] | } d=') %
  }
  fis=8-.\pp eis-. <fis d'> b[-.\> ais]-. | \af 8\! b=-. r r r4.\ppp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
}
{{ end }}
