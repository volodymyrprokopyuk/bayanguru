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
}
{{ end }}
