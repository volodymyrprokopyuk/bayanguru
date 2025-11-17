{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 3/4
  <bes= d g>8\pp g' \rep 2 { <bes=' d g>8 g=' } |
  <bes,= ees g>8 g' \rep 2 { <bes=' ees g>8 g=' } |
  <c,=' d fis>8\< <c d g> \af 2\! \rep 2 { <c=' fis a>8 bes'=' } |
  <c,=' d bes'>4~->\>^\tRit \af 8\! 8 r r4 \barSegno \bar "||"

  \repeat volta 2 {
    bes=4(\mp^\tATem d8 g) a-. bes-. |
    \duo { \rep 2 { c'='4( bes' a=') | } | bes,( a' g=') | }
    { c'='2. | c | bes= | } | bes,=8(\< d g a) bes-. \af 8\! d-. |
    \duo { ees'='4( d' c) | ees,( d'8 c) bes a=' | }
    { ees'='2. | ees='2 r4 | } | g,='8( a) g-. f-. g-. a-. |
    \duo {
      r8 <d''='' f>8-. 8-. 8-. 8-. 8-. |
      r8 <c='' ees>8-. 8-. <d f>-. <c ees>4-- |
      r8 <d='' f>8-. 8-. <c ees>8-. 8-. 8-. |
      r8 <bes=' d>8-. 8-. <a c>-. <bes d>4-- |
    } { bes'='4.( a) | g2. | a4. ( g) | f='2. | }
    ees='4.(\mp\< <c' ees>8) <bes d>[-. <a c>]-. |
    d,='4.( <bes' d>8) <a c>[-. \af 8\! <g bes>]-. |
    c,='8( ees <c ees bes'>4) <c ees a> \codaMark 1 \bar "||"
    \alternative {
      \volta 1 {
        \duo { \af 2\! d'='2\> } { d'='4 c^\tRit bes8 a= | }
      }
      \volta 2 { <c=' ees g>4 <c ees a> <ees=' f c'> | }
    }
  }

  \repeat volta 2 {
    bes'='8\mf f g f ees d | ees g c d ees d |
    c=''8 g a g f ees | f g a bes c d |
    <d='' f>4--\f g,8 <d' f> <ees g> <d f> |
    <d='' f>8 <c ees>8 8 <g d'> <c ees>4 |
    <ees='' g>4 <f, a>8 <ees' g> <d f> <c ees> |
    <d='' f>8 <c ees> \duo { d''=''2 | } { bes'='4( c='') | }

    \duo { d''=''2.\p | cis | c | bes | a | g | }
    {
      r4 bes'='8( a bes g) | r4_ \dCre a8( g a g) |
      r4 g='8( fis e fis) | r4 fis8( g a g) |
      r4 f='8( ees f ees) | r4 ees8( d ees d=') |
    }
    \alternative {
      \volta 1 {
        \duo { fis'='2. | g='2\< \af 4\! r4 | }
        { r4 d'='8( ees d c) | r8 bes c d ees16 f g a=' | }
      }
      \volta 2 {
        \duo { fis'='2. | g=' | }
        { r8 d'='8( d c bes a) | r8 bes( ees d f ees=') \segnoDS \bar "||" }
      }
    }
  }

  ees,='8(\<^\segnoCoda f <ees f d'>4) \af 4\! <ees f c'> |
  bes'='8 f g d ees d | c^\tRit ees bes' a g fis |
  \duo {
    r4\> <bes'=' d g>8 <a c g'> <bes d g>4 |
    r4 <c='' e g>8 <c e a> <c e g>4 |
    r4 <c='' e g>4 \af 4\! 4 | <b=' d g>2.\pp \fermata \bar "|."
  } { g'='2. | g | g~ | g \fermata | }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  g,=,8-\puBass g g4 d' | ees8 ees ees4 c | d8 d d4 d |
  d=4~-> d8 c-. bes-. a=,-. |

  g=,4 gm! d' | ees c@m! cm4 | d d7! d7 | d g@m! gm4 |
  g,=,4 gm! d'4 | c cm! cm | c f@7! f74 | d bes@M! f,4 |
  d'=4 bes@M! besM4 | ees c@m! cm4 | f, f7! f7 | bes besM! d |
  c=4 cm! r | bes g@m! r4 | ees ees ees | d d d | f f ees= |

  d=4 bes@M! r4 | c cm! bes | a f@7! r4 | bes besM! aes |
  g=,4 g7! g7 | c cm! cm | f, f7! f7 | bes besM! a |
  g=,4 gm! r | a a7! r | d d7! r | g, gm! r | ees' c@m! r4 |
  d=4 g@m! r4 | d d7! d7 | g, gm! f | d' d7! d7 | g, gm! ees@M! |

  f'=4 f f | bes@M! besM4 g@7! | ees@M!4 eesM4 d@7! |
  g@m!4 gm4 gm | c@M! cM4 cM | g@M! c@M!4 cM4 | g@M! g,=,2 \fermata |
}
{{ end }}
