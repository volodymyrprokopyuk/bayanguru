{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valse"
  \clef treble
  \key a \minor
  \time 3/4
  \repeat segno 2 {
    a'='2.\(\mf | c\< | \af 2.\! e~ | e4\) f8( e d c | bes2 b4~ |
    b='4) d8( c b a | b2\> \af 4\! e,4~ | e) <dis fis>4\(\< \af 4\! <d gis> |
    <c=' a'>2. | e | \af 2.\! c~\> | c4\) b8(\< c d \af 8\! e |
    g='2)->\> \af 4\! f4~ | f d8(\< f a \af 8\! c | e2->\> \af 4\! d4~ |
    d=''4) e(\mp\< f | g a)-. g-. | e-. d-. \af 4\! c-. |
    bes='4( c)-. a-. | g-.\> e-. \af 4\! c='-. |

    d='8(\mp e d4 c | e_\dCre dis)-. dis-. | d8( e d4 c | g' f)-. f-. |
    e='8( f e4 g | a g)-. g-. | e8( f e4 g | bes a)-. a-. |
    a='8(\f b a4 c | e d)-. d-. | d8( e d4 f | a\> g)-. \af 4\! g=''-. \bar "||"

    \alternative {
      \volta 1 {
        <e='' g c>2.\mp\< | \af 2.\! <ees a c> | <f a c>4.-> <f a b>8 4 |
        \duo { d'''='''4(\> c \af 4\! b='') | } { <d''='' gis>2. | }
        <c='' e a>2.\< | \af 2.\! <c f a> | <b f' a>4.-> <b f' g>8 4 |
        \duo { <e''='' g>4(\> d \af 4\! c='') | } { bes'='2. | }
        <a=' f'>2.\< | \af 2.\! <aes d> | <g e'>4.-> <f d'>8 4 |
        \duo { c''=''4( d c='') | } { e'='2. | } | <f a b>2. |
        \duo { c''=''4( d c='') | } { <ees'=' a>2. | }
        <e=' gis e'>4.->\f <e=' e'>8 4 | \af 2.\! 2.\>^\tRit \bar "||"
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }

  \duo {
    r4\mp <e''='' g>4 4 | r_ \dCre <g b>4 4 | r <g c>4 4 |
    r4 <a='' c>4 4 | r <c, c'>4 4 | r <f='' b d>4 4 |
  } { c''=''2.\( | d | e | f | fis | g=''\) | }
  <e'='' g c>4->\ff r8 \clef bass <c,,= c'>8-> 4-> | 4-> r r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! am | e' a@m! am4 | a, am! am | c a@m! am4 |
  d=4 dm! dm | f d@m! dm4 | e e7! e7 | b e@7! e74 | a am! am |
  gis=,4 a@m! am4 | g a@m! am4 | fis a@m! am4 | f d@m! dm4 |
  d'=4 dm! dm | g, g7! g7 | d' g@7! g74 | c cM! cM | g c@7! c74 |
  c=4 c7! c7 | g c@7! c74 | f fM! fM | c' f@M! fM4 | f, fm! fm |
  c'=4 f@m! fm4 | c cM! cM | g c@M! cM4 | a a7! a7 | e' a@7! a74 |
  d=4 dm! dm | a d@m! dm4 | g g7! g7 | d'= g@7! g74 |

  c=4 cM! cM | f, fM! fM | d' dm! dm | e e7! e7 | a, am! am |
  d=4 dm! dm | g, g7! g7 | c c7! c7 | f, fM! fM | bes besM! besM |
  g=,4 g7! g7 | c cM! cM | d( c b | f2.) | e2 r4 | r c'( b=,) |

  c=2.-\puBass | b | bes | a | aes | g | c4-> r8 c8-> c4-> | c=-> r r |
}
{{ end }}
