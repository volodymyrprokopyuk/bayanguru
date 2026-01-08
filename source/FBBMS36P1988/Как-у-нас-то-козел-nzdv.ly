{{ define "rightHand" }}
\relative {
  \tempo Andantino
  \clef treble
  \key d \major
  \time 2/4
  \partial 4 { d'='8\mp d | }
  g='4 b8 b | a4 d,8 d | g4 b | a a8 a |
  g='8 g e e | fis4 d8 d | e4 cis8 cis | d4 d8\mf d=' |

  \duo {
    \rep 3 { r8 g''=''4.-> | r8 fis=''4.-> | } | r8 e4.-> | d=''4 %
  } {
    g'='8 r b b | a r d, d | g r b b | a r a a | g r e e |
    fis='8 r d d | e r cis cis | d='4 %
  }

  cis='16 d e fis | g cis, d g cis, d g b | a cis, d a' cis, d e fis |
  g='16 cis, d g cis, d g b | a cis, d a' cis, d fis a |
  g='16 d e g bis, cis e a, | fis' cis d fis ais, b d fis |
  fis,=16 g b e fis, g cis e | d e fis a c b a d, |
  b'='16\f a g d b' a g d | c' b a fis c' b a fis |
  b='16 a g d b' a g d | c' b a fis c' b a fis |
  cis'=''16 a g e e' cis a g | d' a g fis d' a g fis |
  cis'=''16 a g e ais fis e cis | b' fis d b fis'8 fis=' |

  <fis=' d'>4 8 8 | <eis cis'>4 <e b'>8 <e ais> |
  <d=' b'>4 <b a'>8 <b g'> | <ais fis'>4 <c a'>8 8 |
  <b= g'>8 8 <ais e'> <ais g'> | <b fis'>4 <fis d'>8 8 |
  <eis= cis'>4 <e ais>8 8 | <d b'>4\> <d' b'>8 \af 8\! <ais'=' fis'> |

  <fis'='' d'>16( e' <fis, d'>8) <fis cis'> <fis b> |
  <eis='' cis'>16( d' <eis, cis'>8) <e b'> <e ais> |
  <d='' b'>16( cis' <d, b'>8) <b a'> <b g'> |
  <ais=' fis'>16( g' <ais, fis'>8) <c a'>8 8 |
  <b=' g'>16( a' <b, g'>8) <ais e'> <ais g'> |
  <b=' fis'>16( g' <b, fis'>8) <fis d'>8 8 |
  <eis=' cis'>16( d' <eis, cis'>8) <e=' ais>8 8 |

  <d=' b'>4 <fis c' d>8\f 8 | <b d g>4 <d g b>8 8 |
  <c='' d a'>4 <fis, c' d>8 8 | <b d g>8 8 <d g b>8 8 |
  <d='' fis a>4 8 8 | <a cis g'>8 8 <a cis e>8 8 |
  <a=' d fis>8 8 <fis b d>8 8 | <g b e>4 <g a cis>8 8 | <fis=' a d>4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \major
  \partial 4 { <c'=' d>4-\frBass | }
  <b= d>4 <g d'> | <fis d'> <c' d> | <b d> <g d'> | <fis d'>4 4 |
  <a= cis>4 4 | <a d> <fis b> | <g b> <a, g'> | <d= fis> r \clef treble |

  \rep 2 { r8 <b''=' d>4.-> | r8 <a=' d>4.-> | }
  r8 <a=' cis>4.-> | r8 <a d>4.-> | r8 <a cis>4.-> |
  r8 <fis=' d'> r4 \clef bass |

  g,=8 <b d> d, <b' d> | fis <c' d> d, <c' d> |
  g=8 <b d> d, <b' d> | fis <a d> d, <a' d> |
  e=8 <a cis> a, <a' cis> | d, <a' d> d, <fis b> |
  e=8 <g b> a, <g' a> | <d fis a> r d d= |

  g=4 b8 b | a4 d,8 d | g4 b | a a8 a | g g e e |
  fis=4 d8 d | e4 fis8 fis | b,=,4 r |

  b'=8\( ais a4 | gis g | fis eis | fis\) dis\( | e4 cis |
  d=4 b8 a | gis g fis=,4\) | b16 d fis b cis d e fis=' \clef treble |

  b='16\( ais a ais b ais a gis | a gis g gis a gis g fis |
  a='16 gis g fis g fis e cis | fis cis ais fis\) dis'( d dis fis=' \clef bass |
  e='16 b g e) cis'\( c cis e | d cis d cis b ais a gis |
  a=16 gis g gis g fis cis fis | b,4\) <d= a'> |

  g=16 fis g d g fis g d | fis eis fis d a' gis a d, |
  g=16 fis g d g fis g d | fis eis fis d fis eis fis d |
  e=16 dis e a, g' fis g a, | fis' eis fis d b' ais b b, |
  e=16 dis e e, e' dis e a, | <d,=, a' fis'>4 %
}
{{ end }}
