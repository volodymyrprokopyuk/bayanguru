{% macro lh1()%}
  g@M!8 r8 r | c@M! r8 r | d@7!8 r8 r | g@M! r8 r |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 3/8
  \repeat segno 2 {
    \volta 1
    r8\p e''=''16( f g8)-. | r f16( e d8)-. |
    r8 c=''16( d e8)-. | r d16( e f8)-. |
    r8 e=''16( f g8)-. | r f16( e d8)-. |
    r8 c=''16( e d e | c=''8) r r \fine \bar "||"

    \volta 2
    r8 d=''16(\< e f8)-. | r e16( f g8)-. |
    r8 fis=''16( g a8)-. | r g16( a \af 8\! b8)-. |
    r8 d,=''16(\< e f8)-. | r e16( f g8)-. |
    r8 fis=''16( g a \af 16\! b | g8)-.\> g-. \af 8\! g=''-. \bar "||"
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \major
  c@M!8-\stBass r8 r | g@7! r8 r | c@M!8 r8 r | g@M! r8 r |
  c@M!8 r8 r | g@7! r8 r | c@M!8[ cM8 g@7!8] | c@M!8 r8 r |

  {{ lh1() }} {{ lh1() }}
}
{% endmacro %}
