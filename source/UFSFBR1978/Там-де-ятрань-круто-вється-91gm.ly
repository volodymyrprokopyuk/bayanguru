{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key g \minor
  \time 3/4
  \meter 1/4 2,1
  \partial 4 { g'='8\p\< bes | }
  d=''4.( ees8 d c | bes a g4) <d' f>8( <bes d> |
  \af 8.\! <ees='' g>4. <g bes>8\mp <f a> <ees g>\> | \af 2\! <d f>2) bes8\(\< d |
  <d='' f>8[ <f a>] <ees g> <b d>16 <d f> <c ees>8 \af 8\! <bes d> |
  <a=' c>8\mp\> <g bes> <fis a> g <ees' g>8 8 |
  <d='' f>8 <c ees> <bes d> <a c> <g bes> <fis a> | \af 4\! g='2\) %

  \duo {
    bes=8\(\mp\< d | <d f> <f a> <g b>4 <c, g' c>8 \af 8\! <d g d'> |
    <ees=' g c ees>8\mf\> <f bes d f> <fis c' d fis> \af 8\! <g bes d g>\) %
    <ees'='' g>8\(\p\< 8 | <d f>8 \tuplet 3/2 { <c='' ees>16 <d f> <c ees> } %
    <bes=' d>8 <a c> <g bes> <fis a> | \af 4\! g2\) g8\(\mp\< bes=' |

    d=''4. \af 8\! ees8 d\mf c\> | bes a g4 <bes f'>8 \af 8\! d |
    <ees='' g>4.\< <g bes>8 <f a> <ees g> | \af 4\! <d f>2\) bes8\(\< d='' |

    <d='' f>8[ <f a>] <ees g> d16 f ees8 d | c bes a \af 8\! g g'\f g~ |
    g=''2~\> g8\) r | \af 4\! s2 bes,,8\(\< d=' |

    <d=' f>8 <f a> <g b>4 <c, g' c>8 <d g d'> |
    <ees=' g c ees>8 <f bes d f> \af 8\! <fis c' d fis>^\tRit %
    <g=' bes d g>8\)\f \fermata g'8\p^\tATem g~ | g=''2 %
  } {
    s4 | s4 r8 d'='8 s4 | \rep 5 { s2. | } | r8 bes'8 a16[ bes g8] f4~ | f2 r4 |
    r4 g='16 gis a b c8 bes | a g fis g ees'( ees |
    <d='' f>8 \tuplet 3/2 { <c='' ees>16 <d f> <c ees> } %
    <bes=' d>8 <a c> <g bes> <fis a> | g='2) s4 | s4 r8 d=' s4 |
    s2 ees'=''8( ees | <d f> \tuplet 3/2 { <c='' ees>16 <d f> <c ees> } %
    <bes=' d>8 <a=' c>)^\tTen %
  }
  <g=' bes>8(^\tRit <fis a> | g2.~ | g=') \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \partial 4 { r4 | }
  R2. | r4 r bes,=,4(-\puBass | ees2 f4 | bes,2) r4 |
  bes=,8( d g,4 c^~ | c d8 g,) a4_( | bes8 c d ees d4 | g,=,2) r4 |

  bes=,4( g8) d'16[( f] ees8 d | c bes a g) a4_( | bes8 c d ees d4 | g,=,2) r4 |

  r8 g=,8_( bes c d4~ | d g,) bes( ees,4. c'8 f, g16 a) |
  \duo { r4 besM!4 } { bes,=,2 } r4 | bes8_( d g,4 c^~ |
  c+cm!4) \duo { r4 r8 c@m! | } { d=8 g, a=,4 | } |
  bes=,8_( c d ees d4 | g,=,2) r4 |

  bes=,4( g8) d'16[( f] ees8 d | c bes a g) \fermata a4( |
  bes=,8 c d ees) d4_( | g,=,2.^~ | g+gm!) |
}
{{ end }}
