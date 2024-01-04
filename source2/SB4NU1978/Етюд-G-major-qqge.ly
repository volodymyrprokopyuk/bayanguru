{% macro t1(a, b, c, d) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } %
  \tuplet 3/2 { {{ c }} } \tuplet 3/2 { {{ d }} } |
{% endmacro %}

{% macro t2(a, b, c) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } {{ c }} r8 r4 |
{% endmacro %}

{% macro rh1(a) %}
  {{ t1(a + " <a c> <g b>8", "8\\< <a c> <b d>",
     "<c='' e>8 <d fis> <e g>8", "8 <d fis> \\af 8\\! <c e>)") }}
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 4/4
  \repeat volta 2 {
    {{ rh1("<b'=' d>8(\\p") }}
    {{ t1("<b=' d>8(\\> <a c> \\af 8\\! <g b>8", "8\\< <a c> <b d>",
       "<c='' e>8 <d fis> <e g>8", "8 <d fis> \\af 8\\! <c e>") }}
    {{ t1("<b=' d>8) <g b>( <a c>", "<b d>\\> <c e> <b d>",
       "<a=' c>8 <b d> <a c>", "<g b> <a c> <g b>") }}
    {{ t1("<fis=' a>8 <eis gis> <fis a>", "<g b> <fis a> \\af 8\\! <eis gis>",
       "<fis=' a>8)\\< <d fis>( <e g>", "<fis a> <g b> \\af 8\\! <a c>") }}
    {{ rh1("<b=' d>8\\p") }}
    {{ t1("<b=' d>8(\\> <a c> \\af 8\\! <g b>8", "8\\< <a c> <b d>",
       "<e='' g>8 <fis a> <g b>8", "8 <fis a> \\af 8\\! <e g>") }}
    {{ t1("<d='' fis>8)\\f \\ottava #1 <fis'=''' a>( <e g>",
       "<d=''' fis>8 <cis e> <b d>", "<a cis> <g b> <fis a> \\ottava #0",
       "<e='' g>8 <d fis> <cis e>") }}
    {{ t2("d=''8)-.\\> a'-. fis-.", "d-. a-. fis-.", "\\af 8\\! d='8-.") }}
  }

  \repeat volta 2 {
    {{ t1("<a''='' c>8(\\f <b d> <a c>", "<g b> <a c> <g b>",
       "<fis='' a>8_\\dDim <g b> <fis a>", "<e g> <fis a> <e g>") }}
    {{ t1("<d='' fis>8 <e g> <d fis>", "<c e> <d fis> <c e>",
       "<b=' d>8 <c e> <b d>", "<a c> <b d> <a c>)") }}
    {{ t1("<g=' b>8(\\< d <ais' cis>", "<b d> g <g' b>",
       "<fis='' a>8 <e g> <d fis>", "<c e> <b d> \\af 8\\! <a c>") }}
    {{ t1("<g=' b>8\\> d <fis ais>", "<g b> d \\af 8\\! <a' c>",
       "<eis=' gis>8\\p\\< <fis a> <g bes>", "<gis b> <a c> \\af 8\\! <ais cis>)") }}
    {{ t1("<b=' d>8(\\> <a c> \\af 8\\! <g b>8", "8\\< <a c> <b d>",
       "<c='' e>8 <d fis> <e g>8", "8 <d fis> \\af 8\\! <c e>") }}
    {{ t1("<b=' d>8) <b' d>( <ais cis>", "<b d> <ais cis> <b d>",
       "e,=''8) <a c>( <gis b>", "<a c> <gis b> <a c>") }}
    {{ t1("d,=''8)\\f <g b>(\\< <fis ais>", "<g b> <fis ais> <g b>",
       "<fis='' a>8)-. <g b>-. <a c>-.", "<b d>-. <c e>-. \\af 8\\! <a fis'>-.") }}
    {{ t2("<b='' g'>8-.\\sf d-. b-.", "g-. d-. b-.", "g='8-.") }}
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,8[-\stBass r gM!] r c[ r cM!] r | g[ r gM!] r c[ r cM!] r |
  g=,8[ r gM!] r d@M![ r8 g@M!] r8 | d'[ r dM!] r dM r r4 |
  g,=,8[ r gM!] r c[ r cM!] r | g[ r gM!] r e'[ r em!] r |
  a,=,8 r d@M!4 r4 a+a7! | d+dM!8-. r d-. r d=-. r r4 |

  d=1 | d2. fis,4 | g8[ r gM!] r c[ r a@m!] r8 | d2. r4 |
  g,=,8[ r gM!] r c[ r cM!] r | g[ r gM!] r c[ r a@m!] r8 |
  d=8[ r g@M!] r8 d[ r d7!] r | g@M!-. r8 g,-. r g=,-. r r4 |
}
{% endmacro %}
