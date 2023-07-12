{% macro rightHand() %}
\relative {
  \tempo Lento
  \clef treble
  \key e \minor
  \time 3/4
  r4\p r r8 e'='8 |
  \repeat volta 2 {
    e='4\(\< g4. \af 8\! a8 | b4 ais4.\) b8 | b4\( fis4. g8 |
    fis='4\> \af 4\! e\) r8\< \af 8\! d'8 |
    d=''4\(\mf b4. a8 | a4 d,4.\) <c' e>8 |
    <c='' e>4( <b d>4. <a c>8 |
    <a=' c>4\> \af 8.\! <g b>) r8 b |
    \duo {
      b'='4(\< cis dis) | e( dis \af 4\! e) |
      <a,=' fis'>4(\f <b g'>4. <a fis'>8 | <a fis'>4 <g=' e'>) %
    } { b'='2 a4 | g2. | dis'=''2. | s2 } r8 e=''8 |
    <c='' e>4( <b d>4. <a c>8 | <a c>4 <g b>4.) <a c>8 |
    <g=' b>4^( fis4.\> \af 8\! g8 |
    \alternative {
      \volta 1 {
        e='2)\p r8 e='8 \sSlur bu #'((sh . 8)) ( |
      }
      \volta 2 {
        \hSpace e='2.)\p |
        \duo { b'='4( cis dis='' | <g,='_~ b_~ e^~ >2.\> | \af 2\! 2) } %
        { b'='2. | s2. | s2 } r4 \bar "|."
      }
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key e \minor
  e=4-\stBass em! em |
  e=4 em! em | fis b@7! b74 | b, b7! b7 | e em! em |
  g,=,4 gM! gM | d' d7! d7 | fis d@7! d74 | g, gM! gM |
  b=,4 b7! b7 | e em! em | b b7! b7 | c cM! cM |
  a=,4 am! am | b e@m! em4 | b b7! b7 | e em! em |
  e=4 em! em | b b7! b7 | e( b g | e'=2) r4 |
}
{% endmacro %}
