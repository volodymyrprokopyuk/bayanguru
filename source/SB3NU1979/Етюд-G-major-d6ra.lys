{% macro rh1a(a = "") %}
  {{ a }} a b c | d2 b | a4 g a b | c2 a |
  <d,=' fis a>2 <dis fis b>\f | g <a c> | <d, g b> a'4. g8 | g='1 |
{% endmacro %}

{% macro rh1b(a) %}
  {{ a }} | 1 | <e g> | 1 | s1 | e | s2 <c fis> | b=1 |
{% endmacro %}

{% macro lh1(a) %}
  {{ a }} a4 | b2 g | c2. b4 | a2 c | c b | e a, | d1 | g,=, |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Andante
  \clef treble
  \key g \major
  \time 4/4
  \duo {
    b'='2\p c_\aLeg | d b | a b | c a | <fis=' a> g |
    <fis=' c'>2 <b g> | a g | <g b>\> \af 2\! <fis=' a> |

    {{ rh1a("b='4") }}

    g='4\p fis g a | fis2 b | e,4 d e fis | d2 g | dis e_\dCre |
    <dis=' a'>2 <e g> | <c fis> <fis, cis' e> | e'\> \af 2\! dis=' |

    {{ rh1a("b'='4\\p") }} \bar "||"
  } {
    <d'=' g>1 | 1 | <e g> | 1 | d | d | e | d=' |

    {{ rh1b("<d=' g>1") }}

    <b= e>1 | <b d> | <g c> | <g b> | b | b | s1 | <fis= b> |

    {{ rh1b("<d'=' g>1") }}
  }

  \tempo Lento
  \time 3/2
  <e= e' g>1. | <e e' a>2\< <e e' g> \af 2\! <e e' a> |
  <fis= dis' b'>1.~\f\> | \af 1.\! 1. |
  <e'=' a c>1.\p | <c e g>2 <b e g> <c fis a> | <b= g'>1. \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  g,=,2-\puBass a | b g | c b | a c | c b | a g | c cis | d=1 |

  {{ lh1("g,=,2.") }}

  e'=1 | b | c | g | a2 g | fis e | a ais | b=,1 |

  {{ lh1("g=,2.") }}

  \time 3/2
  c=1. | c2 c c | b1.~ | b | a1. | c2 e d | <g,=, d'>1. |
}
{% endmacro %}
