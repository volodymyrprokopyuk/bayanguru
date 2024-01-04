{% macro rightHand() %}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 2/4
  \partial 8 { c'='8\(\p | }
  f='8 f g g | a4 f8\) a\( | g d e g | f4.\) c8\(\mf |
  a'='8 a bes bes | c4 a8\) c\( | c bes a g | f4.\) c'8 |
  <e,=' g>4\mp 8 c' | <f, a>4 8 c' |
  \duo { c''=''8\(\> bes a \af 8\! g | f='4.\) } { e'='2 | f='4. } %
  r8 \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key f \major
  \partial 8 { r8 | }
  f=8-\stBass fM! c cM! | f[( fM!) fM] r |
  bes,=,8 besM! c c7! | f[( fM!) fM] r |
  f=8 fM! bes, c@M! | a8 f@M! f'8 fM |
  g,=,8 c@7! c8 c7 | f[( fM!) fM] r |
  c=8[( c7!) c7] r | f[( fM!) fM] r |
  c=8[( c7!) c7 c7] | f=[( fM!) fM] r |
}
{% endmacro %}
