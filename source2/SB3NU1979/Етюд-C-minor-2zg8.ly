{% macro t1(a, b) %}
  \tuplet 3/2 { {{ a }} } \tuplet 3/2 { {{ b }} } |
{% endmacro %}

{% macro rh1(a) %}
  {{ t1(a, "b ees bes") }} {{ t1("aes='8 ees' c", "g ees' c") }}
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo "Moderato cantabile"
  \clef treble
  \key c \minor
  \time 2/4
  \duo {
    {{ rh1("g'='8\\mf ees'_\\aLeg c") }}
    {{ t1("f,='8 c' aes", "ees c' aes") }}
    {{ t1("g='8 g' ees", "d ees c") }}
    {{ t1("ees,='8 c' g", "fis c' g") }}
    {{ t1("f='8 c' aes", "ees c' g") }}
    {{ t1("d='8 b' g", "fis <g b> f") }}
    {{ t1("ees='8 g c", "ees c g='") }}

    {{ rh1("g='8 ees' c") }}
    {{ t1("bes='8 f' ees", "d c bes") }}
    {{ t1("g='8 bes ees", "g ees bes") }}
    {{ t1("ees,='8 c' aes", "c, f ees") }}
    {{ t1("aes,=8 d c", "c f ees") }}
    {{ t1("ees='8 c' g", "d b' g") }}
    \tuplet 3/2 { c,='8 ees g } c=''4 |

    b='4 b | c c | d d | ees 2 | f4 f | g g | a a | b=''2 |

    c='''4 c | bes bes | aes aes | g2 | fis4 fis | f ees | c=''2 |
  } {
    g'='2 | aes4 g | f ees | g2 | ees | f4 ees | d2 | ees=' |

    g='2 | aes4 g | bes aes | g2 | ees4 c | aes c | ees d | c='2 |

    {{ t1("b'='8 f g", "b f g") }}
    {{ t1("c=''8 ees, g", "c ees, g") }}
    {{ t1("d'=''8 f, g", "d' f, g") }}
    {{ t1("ees'=''8 ees, c'", "aes c g") }}
    {{ t1("f'=''8_\\dCre g, aes", "f' a, bes") }}
    {{ t1("g'=''8 a, bes", "g' b, c") }}
    {{ t1("a'=''8 b, c", "a' cis, d") }}
    {{ t1("b'=''8 d, g", "fis g f=''") }}

    {{ t1("c'='''8\\f c, ees", "c' c, ees") }}
    {{ t1("bes'=''8 bes, ees", "bes' bes, ees") }}
    {{ t1("aes=''8 aes, c", "aes' aes, c") }}
    {{ t1("g'=''8 g, ees'", "d ees c") }}
    {{ t1("fis=''8 fis, c'", "fis_\\dDim fis, c'") }}
    {{ t1("f=''8 aes, g", "ees' fis, f") }}
    {{ t1("c'=''8 c, ees^\\tRit", "d f aes='") }}
  }
  \af 2\! <ees'=' c'>2\> \fermata \bar "|."
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key c \minor
  c=4-\stBass cm! | c cm | c f@m! | c4 cm! |
  c=4 cm! | c cm | g gM! | c= cm! |

  c=4 cm! | c cm | d bes@7! | ees4 eesM! |
  aes,=,4 aesM! | f fm! | g+c@m! g+g7!4 | c'= cm! |

  d=4 g@7! | ees4 c@m! | b4 g@7! | c4 cm! |
  d=4 bes@7! | ees4 eesM! | d d7! | g,=, g7! |

  aes=,4 aesM! | g ees@M! | f4 fm! | ees' c@m! |
  aes,=,4 aesM! | g g7! | c= f@m! | c+cm!2 \fermata |
}
{% endmacro %}
