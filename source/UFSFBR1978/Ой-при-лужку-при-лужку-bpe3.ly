{{ define "lh1" }}
  {{ .a }} gm! bes g@m! g8 gm! bes=, g@m! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \minor
  \time 4/4
  \repeat segno 2 {
    \volta 1
    g'='4_\markup \dAlt mf p d' bes d | c g8 a bes4. a8 |
    g='4 d' bes d | c g8 a bes='2 |
    \repeat volta 2 {
      <d='' f>4 4 <c ees> <bes d>8 <a c> |
      <g=' g'>4 \duo { g''=''8 f='' } { g'='4 } <c ees>4 <ees g> |
      <d='' f>4. <c ees>8 <bes d>4 <a c> |
      \alternative {
        \volta 1 { <g=' g'>2 4 <bes d>8 <c='' ees> | }
        \volta 2 { <g=' g'>2 4 r \fine \bar "||" }
      }
    }

    \volta 2
    g'=''16(\mf d bes g d'' bes g d bes' g d bes g' d bes g |
    c'='''16 g ees c g'8)-. a-. bes16\( g d bes a' fis d c |
    g'=''16 d bes g d'' bes g d bes' f d bes f'' d bes f |
    ees'='''16 bes g ees d'8\)-. c-. bes-. g16(\< a bes c d \af 16\! ees |
    <f,='' bes d f>4)\f <f b d f> <ees c' ees> <d bes' d>8 <c a' c> |
    <g'='' g'>4 <g d' g>8 <f f'> <ees c' ees>4 <g ees' g> |
    <f='' bes d f>4. <ees c' ees>8 <d bes' d>4 <c a' c>4 |
    <g'='' g'>2 8 r <bes, d>8-> <c='' ees>8-> |
    \duo {
      <d''='' f>4 <d g> <c ees> d8 ees | g4 g8 f <c ees>4 <ees='' g> |
    } { bes'='4 g2 bes8 c | g4 g='2. | }
    <f,=' d' f>4. <g c ees>8 <bes d>4 <a c> |
    <g=' g'>2 \acc { g='16 bes d } g=''8\sf r r4 \bar "||"
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  \meter 1/4 1,1,1,1
  {{ template "lh1" (w `g,=,8-\stBass`) }} | c=8 cm! ees c@m! d8 dM! fis d@M! |
  {{ template "lh1" (w `g,=,8`) }} | c=8 cm! f f7! bes, besM! d= bes@M! |

  bes=,8 besM! bes besM c cm! d dM! | g, gm! b g@7! c8 cm! a c@m! |
  bes=,8 besM! c cm! d g@m! d8 d7! | \rep 2 { g,=,8 gm! g=, gm g4 r | }

  {{ template "lh1" (w `g=,8`) }} | c=8 cm! ees c@m! r8 d[-. e-. fis]-. |
  g,=,8 gm! bes g@m! bes8 besM! d bes@M! | c8 cm! f f7! bes,[( besM!) besM besM] |
  bes=,8 besM! g gM! c cm! d dM! | g, gm! b g@7! c8 cm! a c@m! |
  \duo { r8 besM![ besM] r } { bes,=,4. c=8 } d g@m! d8 d7! |
  g,=,8 gm! g gm g=,8 r r4 |

  \meter 1/2 1,1
  bes=,8-\puBass a bes_\aNLeg b c cis d fis | g, f ees d' c bes a g |
  f=,8 a bes c d ees e fis | g,4-> d'=-> g+gm!8 r r4 |
}
{{ end }}
