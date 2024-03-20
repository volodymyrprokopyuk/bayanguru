{{ define "lh1" }}
  {{ .a }} r r gM! r r | {{ .b }} r8 r g+gM! r r |
  c=8 r r cM! r r | d r r g@M! r8 r |
  fis,=,8 r r d@7! r8 r | g=, r r gM! r r |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Scherzando
  \clef treble
  \key g \major
  \time 6/8
  <b'=' d>16(\mf\< <ais cis> <b d> <ais cis> <b d> \af 16\! <ais cis> %
  <b=' d>8)-. <a c>-. <b g>-. |
  \acc { fis'=''8 } <c e>8-. <b d>-. <ais cis>-. <b d>-. <d, b'>-. <b g'>-. |
  <e'='' g>16(\< <dis fis> <e g> <dis fis> <e g> \af 16\! <dis fis> %
  <e='' g>8)-. <d fis>-. <c e>-. |
  \acc { e=''8 } <b d>8-. <ais cis>-. <c e>-. <b d>-. <g g'>( b) |
  \acc { d=''8 } <a c>8-.\< <gis b>-. \af 8\! <a c>-. %
  <c='' e>8->-. <d, a'>-. <a' c>-. |
  \acc { c=''8 } <g b>8-.\< <fis ais>-. \af 8\! <g b>-. %
  <b=' d>8->-. <g b>-. <e g>-. |
  <d=' fis>8-. a'( fis) a->\< <gis b>-> \af 8\! <g cis>-> |
  <fis=' d'>8\f r r r4. |

  <b=' d>16(-> <ais cis> <b d> <ais cis> <b d> <ais cis> %
  <b=' d>8)-. fis16(\< g b \af 16\! d) |
  <c='' ees>8-. <b d>-. <ais cis>-. <b d>-. g16(\< a b \af 16\! d) |
  <e='' g>16(-> <dis fis> <e g> <dis fis> <e g> <dis fis> %
  <e='' g>8)-. <d fis>-. <c e>-. |
  \acc { e=''8 } <b d>8-. <ais cis>-. <c e>-. <b d>-. <g g'>(-> b) |
  \acc { d=''8 } <a c>8-.\< <gis b>-. \af 8\! <a c>-. <c e>-> <d, a'>-. <a' c>-. |
  \acc { c=''8 } <g b>-. <fis ais>-. <g b>-. <b d>-> <b, g'>-. <g' b>-. |
  <e=' a>8-> c'-. a-. <d, fis>-> a'-. fis-. |
  <d=' g>8-._\dCre cis'( d) <d, gis>-. dis'( e) |
  <c,=' a'>8-> c'-. a-. <d, fis>-> a'-. fis-. |
  g='8-.\ff <d g b>-> <g b d>-> <b=' d g>-> r r |

  g,=16(\p\< fis g fis g fis g8)-> a-> \af 8\! b-> |
  c='8->\f d-> e-> fis-> g-> a-> |
  bes,=16(\p\< a bes a bes a bes8)-> c-> \af 8\! d-> |
  ees='8->\f f-> g-> a-> bes-> c-> |
  <d,=' f bes>8-.\sf\< a16( bes d \af 16\! f) g( ees d ees g bes) |
  <e,=' g c>8-.\sf\< b16( c e \af 16\! g) a( f e f a c) |
  <fis,=' a d>8-.\sf\< cis16( d fis \af 16\! a) bes( g fis g bes d) |
  ees=''16(_\dCre d c d ees f) g( f e f g a='') \bar "||"

  \keyCancelBarChange
  \key bes \major
  \acc { bes=''8 } <d, f>16(\ff \rep 5 { cis=''16 <d='' f> } cis) |
  \acc { a'=''8 } <ees g>8-. <d f>-. <cis e>-. %
  <d='' f>8-.\< <ees g>-. \af 8\! <f a>-. |
  \acc { d'='''8 } <g, bes>16( \rep 5 { fis=''16 <g='' bes> } fis) |
  \acc { d'='''8 } <a c>8-. <g bes>-. <a c>-. %
  <bes='' d>8-.\< <c ees>-. \af 8\! <d f>-. |
  \acc { f,=''8 } <c ees>-.\pp\< <b d>-. \af 8\! <c ees>-. %
  <ees='' g>8-. <f, c'>-. <c' ees>-. |
  \acc { ees=''8 } <bes d>-.\< <a cis>-. \af 8\! <bes d>-. %
  <d='' f>8-. <bes d>-. <g bes>-. |
  <fis=' d'>8->\f\< <g e'>-> \af 8\! <a fis'>-> %
  \acc { a'=''8 } <b, g'>8->\> <a fis'>-> \af 8\! <g e'>-> |
  <fis=' d'>8\> r r \af 4.\! r4. \bar "||"

  \keyCancelBarChange
  \key g \major
  <b=' d>16(\mf\< <g e'> <b d> <g e'> <b d> \af 16\! <g e'> %
  <b=' d>8)-. <a c>-. <g b>-. |
  \acc { fis'=''8 } <c e>8-. <b d>-. <ais cis>-. %
  <b=' d>8-. <d, b'>-. <b g'>-. |
  <e'='' g>16(\< <c a'> <e g> <c a'> <e g> \af 16\! <c a'> %
  <e='' g>8)-. <d fis>-. <c e>-. |
  \acc { e=''8 } <b d>8-. <ais cis>-. <c e>-. <b d>-. <g g'>( b) |
  \acc { d=''8 } <a c>-. e'(-> c) <d, a'>-.\> <a' c>-. \af 8\! <d, a'>-. |
  \acc { c'=''8 } <g b>8-. d'(-> b) <b, g'>-.\> <g' b>-. \af 8\! <b, g'>-. |
  \acc { b'='8 } <fis a>8-. <d fis>(->\f g) <fis a>-. <g b>-. <a c>-. |
  <b=' d>8-._\dDim <a c>-. <b d>-. <c e>-. <d fis>-. <e g>-. |
  <fis='' a>8-. <e g>-. <fis a>-. <g b>-.^\tRit <a c>-. <b d>-. |
  <c=''' e>8-.\p r r \fermata <d,, fis d'>->\ff^\tATem <e c' e>-> <fis c' d fis>-> |
  <g=' b d g>8-> r r \acc { d'=''16 e fis } g=''8-> r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  {{ template "lh1" (w `g,=,8-\stBass` `g+c@M!`) }}
  a+d@M!8 r8 r a+a7! r r | d+dM! d'-> cis-> c-> b-> a=,-> |

  {{ template "lh1" (w `g=,8` `g+c@m!`) }}
  c+a@m!8 r8 r c+d@M! r8 r | b+g@M! r8 r e+e7! r r |
  a+am!8 r8 r d+d7! r r | g+gM! d'-> b-> g=,-> r r |

  e=,16(-\puBass dis e dis e dis e8)-> fis-> g-> | a-> b-> c-> d-> e-> fis-> |
  g,=,16( fis g fis g fis g8)-> a-> bes-> | c-> d-> ees-> f-> g-> a-> |
  r8 a,=,16( bes d f) ees8( eesM!) r | r8 b16( c e g) f8( fM!) r |
  r8 cis=16( d fis a) g8( gm!) r | c,( cm!) r c[( f@7!) f,=,8] |

  \key bes \major
  bes+besM!8-\stBass r r f'= d bes | bes+ees@M! r8 r bes+besM! r r |
  g+gm!8 r r d bes g | g+c@m! r8 r g+gm! r r |
  a=,8 r r f@7! r8 r | bes r r besM! r r |
  a+d@M!8 r8 r a+a7! r r | d+dM! d-> cis-> c-> b-> a=,-> |

  \key g \major
  {{ template "lh1" (w `g=,8` `g+c@M!`) }}
  r8 d'=4 r4. | R2. | R2. | r4 r8 \fermata r a-> aes-> |
  g=,8-> r r g+gM!-> r r |
}
{{ end }}
