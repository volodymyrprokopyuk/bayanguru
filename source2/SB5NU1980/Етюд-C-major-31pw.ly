{% macro t2(a, b, c, d, e, f) %}
  \tuplet 3/2 { {{ a }} {{ b }} {{ c }} }
  \tuplet 3/2 { {{ d }} {{ e }} {{ f }} } |
{% endmacro %}

{% macro t3(a, b, c, d) %}
  \tuplet 3/2 { {{ a }}[ r8 {{ b }}] }
  \tuplet 3/2 { {{ c }}[ r8 {{ d }}] } |
{% endmacro %}

{% macro t4(a, b) %}
  \tuplet 3/2 { {{ a }} r8 r } \tuplet 3/2 { {{ b }} r8 r } |
{% endmacro %}

{% macro rh1(a, b) %}
  {{ t2(a, b, "<e g>", "<a c>8 <g b> <f a>") }}
  {{ t2("<e='' g>8", "<dis fis>", "<e g>", "<c e>", "<b dis>", "<c e>") }}
  {{ t2("<d='' f>8", "<cis e>", "<d f>", "<f a>", "<e g>", "<d f>") }}
  {{ t2("<c='' e>8", "<d f>", "<c e>", "<g d'>", "<c e>", "<d='' f>") }}
{% endmacro %}

{% macro rh2() %}
  {{ t2("<a=' c>8(", "<gis b>)-.", "<a c>", "<c e>", "<b dis>", "<c e>") }}
  {{ t2("<a=' c>8(", "<gis b>)-.", "<a c>", "<fis a>(", "<eis gis>)-.", "<fis a>") }}
  {{ t2("<g=' b>8(", "<fis ais>)-.", "<g b>", "<b d>", "<ais cis>", "<a c>") }}
  {{ t2("<b=' d>8(", "<ais cis>)-.", "<b d>", "<d f>", "<c e>", "<b=' d>") }}
{% endmacro %}

{% macro lh1(a) %}
  {{ t3(a, "cM!", "f,", "fM!") }}
  {{ t3("c'=8", "cM!", "g", "c@M") }}
  {{ t3("d'=8", "dm!", "g,", "g7!") }}
  {{ t3("c=8", "cM!", "g=,", "g7!") }}
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Allegro con fuoco"
  \clef treble
  \key c \major
  \time 2/4
  {{ rh1("<e''='' g>8\\mp", "<dis fis>_\\aSta") }}
  {{ t2("<e='' g>8", "<dis fis>", "<e g>", "<a c>", "<g b>", "<f a>") }}
  {{ t2("<e='' g>8", "<dis fis>", "<e g>", "<g bes>", "<f a>", "<e g>") }}
  {{ t2("<fis='' a>8\\<", "<eis gis>", "<fis a>", "<e c'>", "<d b'>", "\\af 8\\! <c a'>") }}
  {{ t2("<b=' g'>8\\>", "<g b>", "<a c>", "<b d>", "<c e>", "\\af 8\\! <d='' f>") }}

  {{ rh1("<e='' g>8\\mp", "<dis fis>") }}
  {{ t2("<e='' g>8_\\dCre", "<dis fis>", "<e g>", "<g bes>", "<f a>", "<e g>") }}
  {{ t2("<d='' f>8", "<cis e>", "<d f>", "<f, d'>", "<e cis'>", "<f d'>") }}
  {{ t2("<g=' e'>8", "<fis dis'>", "<g e'>", "<f d'>", "<e cis'>", "<f d'>") }}
  \tuplet 3/2 { <e=' c'>8\mf g <g e'> } <e=' c'>4 |

  {{ t2("<b'=' d>8(", "<ais cis>)-.", "<b d>", "<gis b>(", "<fisis ais>)-.", "<gis b>") }}
  {{ rh2() }}
  {{ t2("<a=' c>8(", "<gis b>)-.", "<a c>", "<c e>", "<b dis>", "<c e>") }}
  {{ t2("<cis='' e>8(", "<bis dis>)-.", "<cis e>", "<e g>", "<d fis>", "<cis e>") }}
  {{ t2("<d='' fis>8(\\>", "<cis eis>)-.", "\\af 8\\! <d fis>", "<c e>\\p", "<b dis>", "<c='' e>") }}

  {{ t2("<b=' d>8(", "<ais cis>)-.", "<b d>", "<g b>(", "<fis ais>)-.", "<g b>") }}
  {{ rh2() }}
  {{ t2("<c='' e>8_\\dCre", "<b dis>", "<c e>", "<e c'>", "<d b'>", "<c a'>") }}
  {{ t2("<b=' d>8", "<ais cis>", "<b d>", "<d b'>", "<c a'>", "<b g'>") }}
  {{ t2("<a=' fis'>8", "<g e'>", "<fis d'>", "<e c'>", "<d b'>", "<c a'>") }}
  {{ t2("<b= g'>8(\\sf", "fis')-.\\p", "g", "<g b>", "<fis ais>", "<g b>") }}
  {{ t2("<a=' c>8_\\dCre", "<gis b>", "<a c>", "<bes des>", "<a c>", "<bes des>") }}
  {{ t2("<b=' d>8", "<ais cis>", "<b d>", "<c ees>", "<b d>", "<c ees>") }}
  {{ t2("<cis='' e>8", "<c ees>", "<cis e>", "<d f>", "<cis e>", "<d='' f>") }}

  {{ rh1("<e='' g>8\\f", "<dis fis>") }}
  {{ t2("<e='' g>8", "<dis fis>", "<e g>", "<g bes>", "<f a>", "<e g>") }}
  {{ t2("<f='' a>8", "<e gis>", "<f a>", "<a f'>", "<g e'>", "<f d'>") }}
  {{ t2("<e='' g>8", "<dis fis>", "<e g>", "<g e'>", "<f d'>", "<e c'>") }}
  {{ t2("<d='' b'>8", "<c a'>", "<b g'>", "<a f'>", "<g e'>", "<f d'>") }}
  {{ t2("<e=' c'>8", "<g e'>", "<f d'>", "<e c'>_\\dDim", "<d b'>", "<c a'>") }}
  {{ t2("<b= g'>8", "<c a'>", "<b g'>", "<a f'>", "<g e'>", "<f d'>") }}
  \clef bass
  {{ t2("<e= c'>8", "<g e'>", "<f d'>", "<e c'>", "<d b'>", "<c a'>") }}
  <b=, g'>4 \clef treble <b'= f' g>( |
  <c=' e c'>4)\p <c g' e'> <g= e' c'> r \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  \hideTupletBracket
  {{ lh1("c=8-\\stBass") }}
  {{ t3("c=8", "cM!", "f", "fM!") }}
  {{ t3("c=8", "cM!", "a", "a7!") }}
  {{ t3("d=8", "d7!", "d", "d7") }}
  \tuplet 3/2 { g+gM!8 r r } \tuplet 3/2 { f=8 e d= } |

  {{ lh1("c=8") }}
  {{ t3("c=8", "cM!", "a", "a7!") }}
  {{ t3("d=8", "dm!", "f,", "d@m") }}
  {{ t3("g=,8", "c@M!", "g8", "g7!") }}
  \tuplet 3/2 { c=8[ r g] } c=4 |

  {{ t4("g+gM!8", "e+eM!") }}
  {{ t4("a+am!8", "c+a@m") }}
  {{ t4("d+a@m!8", "d+d7!8") }}
  {{ t4("g+gM!8", "d+d7!") }}
  {{ t4("g+gM!8", "e+e7!") }}
  {{ t4("a+am!8", "g+a@m!") }}
  {{ t4("fis+fis7!8", "fis+fis7") }}
  {{ t4("b+bm!8", "d+d7!") }}

  {{ t3("g=,8", "gM!", "d'", "g@M") }}
  {{ t3("a=,8", "am!", "g", "a@m") }}
  {{ t3("fis=,8", "d@7!", "d'8", "d7") }}
  {{ t3("g,=,8", "gM!", "d'", "d7!") }}
  {{ t3("g,=,8", "gM!", "e", "e7!") }}
  {{ t3("a=,8", "am!", "c", "a@m") }}
  {{ t3("d=8", "g@M!", "d8", "g@M") }}
  {{ t3("d=8", "d7!", "d", "d7") }}
  g,=,2~ | g | \duo { r4 c@m! | r4 g7! | } { g,=,2 | g=, | }

  {{ lh1("c=8") }}
  {{ t3("c=8", "cM!", "a", "a7!") }}
  {{ t3("d=8", "dm!", "f,", "d@m") }}
  {{ t3("g=,8", "c@M!", "g8", "c@M") }}
  {{ t3("g=,8", "g7!", "g", "g7") }}
  \tuplet 3/2 { c+cM!8 r r } r4 |
  r4 \tuplet 3/2 { g+g7!8 r r } |
  \tuplet 3/2 { c+cM!8 r r } r4 |
  {{ t2("g=,8", "a", "g", "f", "e", "d") }} c4 r | c'= r |
}
{% endmacro %}
