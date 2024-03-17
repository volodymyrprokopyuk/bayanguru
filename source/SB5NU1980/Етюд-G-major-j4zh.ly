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
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
}
{{ end }}
