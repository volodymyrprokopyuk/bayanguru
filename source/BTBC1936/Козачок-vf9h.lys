{% macro rh1(a) %}
  {{ a }} <d fis d'>8.-> c'16( | b8) <d,='' g>8 4 |
{% endmacro %}

{% macro rh2(a) %}
  {{ a }} a fis d c' a fis c | b' g d b g' d b g=' |
{% endmacro %}

{% macro rh3(a, b) %}
  {{ a }} fis16 g8) g | fis16( a g fis {{ b }} |
{% endmacro %}

{% macro rightHand() %}
\relative {
  \tempo Allegro
  \clef treble
  \key g \major
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ rh1("d''=''8\\f r") }} {{ rh1("d=''8 d") }}
    }

    \repeat volta 2 {
      a='16 b cis d e fis g e | fis g a8(-> a) fis |
      g=''16 fis e d cis a b cis |
      \alternative {
        \volta 1 { d=''16 cis d e fis8 d='' | }
        \volta 2 { d=''8 fis d='' r | }
      }
    }

    r8\p <fis,=' a d>8 r8 8 | r <g b d> r8 8 |
    r8\< <fis=' a d>8 r8 \af 8\! 8 | r <g b d> r8 8 |
    r8 <a=' cis e a>8 r8 8 | r <a d fis a> r8 8 |
    r8\< <a=' cis e a>8 r8 \af 8\! 8 | r4 <d='' fis a d>4-> |

    {{ rh2("d'='''16\\f") }} {{ rh2("d''='''16") }}
    a'=''16 e cis a g' e cis g |
    <fis=' fis'>8 <e e'> <fis fis'> <g g'> |
    <a=' a'>8 r <a cis e a>4-> |
    <d='' d'>8 r <d='' fis a d>4-> \fine |

    \volta 2
    \repeat volta 2 {
      g,='8.(->\mf a16 b8) b | a16( c b a g8) d |
      g='8.(-> a16 b8) b | a c b4 |
      {{ rh3("e=''8.(->\\f", "e8) b='") }}
      {{ rh3("e=''8.(->", "e=''4)") }}
    }
  }
}
{% endmacro %}

{% macro leftHand() %}
\relative {
  \clef bass
  \key g \major
  d=8-\stBass r dM!4-> | g,8 gM! gM4 |
  d'=8 dM! dM4-> | g,=,8 gM! gM4 |

  cis=8 a@7! a8 a7 | d dM! a d@M |
  e'=8 a@7! a,8 a7 | d dM! a d@M | d=8 dM! dM r |

  d=4-\puBass c | b g | d' c | b g |
  a=,4 g | fis8[ e fis g] | a4 a | d= dM!-> |

  d=8-\stBass dM! d dM | g, gM! g gM |
  d'=8 dM! d dM | g, gM! g gM | a aM! a aM | d dM! d dM |
  \duo { r4 aM! | } { a,=,2 | } \duo { r4 dM! | } { d=2 | }

  g@M!8[ gM8 gM gM] | d@M![ dM8 g@M! gM8] |
  g@M!8[ gM8 gM gM] | d@M![ dM8] g@M!4 |
  e=8 em! e em | b b7! e em! | e em! e em | b=, b7! e@m!4 |
}
{% endmacro %}
