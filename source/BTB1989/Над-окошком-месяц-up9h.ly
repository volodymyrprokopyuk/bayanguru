{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 3/4
  a=2 a4 |
  \duo { f'='2 d4 | e2 f4 | e='2. | } { a=2. | gis=~ | gis= | }
  a=2 a4 | \duo { g'='2 e='4 | } { cis'='2. | }
  <d=' f a>2. | <a d f> | d2 d4 | <c a'>2 d4 |
  <d=' g bes>2. | <bes d g> | c2 g'4 | <e bes' d>2 <g c>4 |
  <c,=' g' bes>2. | <c=' f a> |

  \repeat volta 2 {
    <cis=' g' a>2 4 | <g' cis e>2 <g a>4 | <a d f>2. | <f a d> |
    \duo { <bes'=' d>2 <a c>4 | 2 <fis=' a>4 | } { fis'='2. | d=' | }
    <d=' a' c>2. | <d g bes>2. |
    \duo { <g'=' bes>2 <a c>4 | <g bes>2 <e=' g>4 | } { e'='2. | c=' | }
    <c=' f bes>2. | <c f a> | <gis d' e>2 <d' f>4 |
    <a= cis g'>2 <cis e>4 | <d f a>2. |
    \alternative {
      \volta 1 { d='4.\< e8 f[ \af 8\! g='] | }
      \volta 2 { d='2. \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=4-\stBass dm! dm | d dm dm | e e7! e7 | bes e@7 e74 |
  a=,4 a7! a7 | e' a@7 a74 | d dm! dm | a d@m dm4 |
  d=4 d7! d7 | fis, d@7 d74 | g gm! gm | d' g@m gm4 |
  c=4 c7! c7 | g c@7 c74 | f fM! fM | f=, fM fM |

  e'=4 a@7! a74 | a, a7 a7 | d dm! dm | a d@m dm4 |
  d=4 d7! d7 | fis, d@7 d74 | g gm! gm | d' g@m gm4 |
  c=4 c7! c7 | e c@7 c74 | f, fM! fM | f fM fM |
  bes=,4 e@7! e74 | a a7! a7 | f d@m! dm4 | a d@m dm4 | d=4 dm! dm |
}
{{ end }}
