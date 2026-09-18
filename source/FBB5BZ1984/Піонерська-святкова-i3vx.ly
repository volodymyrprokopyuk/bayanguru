{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key c \major
  \time 4/4
  \partial 4 { g'='8-.\f g' | }
  \repeat volta 2 {
    \rep 2 { <c,='' e>4-> g8-. g'=''-. } |
    <f='' a>8(->\> <e g>) <d f> <c e> \af 4\! <g d'>4-- g8-.\f g'-. |
    \rep 2 { <b,=' d>4-> g8-. g'=''-. } |
    <e='' g>8(->\> <d f>)-. <c e>-. <g d'>-. \af 4\! <e c'>4-- c'8(\mp b |
    <f=' a>8\< c' f a) \af 4\! <c, a'>4-- c8( a |
    <e=' g>8\> c' e g) \af 4\! <c, g'>4-- e,8( a |
    <d,=' g>8\< b' d g) <b, g'>-. <c a'>-. <d b'>-. \af 8\! <e c'>-. |
    <fis='' d'>8(-> <e c'>)-. <d b'>-. <c a'>-. \af 4\! <b g'>4-- g8(\p f |
    <e=' g>8\< c' e g) \af 4\! <c, g'>4-- b8( a |
    <d,=' g>8\< b' d g) \af 4\! <b, g'>4-- <a fis'>8-.\f <b g'>-. |
    <c='' a'>8(-> <b g'>)-. <a fis'>-. <g e'>-. <fis d'>-. <e c'>-. <d b'>-. <c=' a'>-. |

    <b= g'>4-- <d b'>-- <b g'>-- fis'8(\p g | a4 d,2) <a' c>4( |
    <g=' b>4 g2) fis8( g | a4 d,2) <c' e>4( | <b d>2~ 8) r <c e>( <d fis> |
    <e='' g>4\< <d fis> <c e> <fis, c'> | <g b> \af 4.\! <b d>2) %
    \duo { <e'=' c'>8( b' | a4)\> d2( c4 | b2~ b8) \af 16.\! b=' \rest } %
    { s4 | g'='4 fis g a | g2~ g='8 s8 } <c e>8( <d fis> |
    <e='' g>4\< <d fis> <c e> <fis, c'> | <g b> \af 4.\! <b d>2) <e, c'>8( b' |
    <g=' a>4)\> <fis d'>2(-> <c fis>4 |
    \alternative {
      \volta 1 { \af 4.\! <b= g'>2.) g'8-.\f g'=''-. | }
      \volta 2 {
        \hSpace <b,,= g'>2. \sSlur ub #'((wb . 4.5)) ( d'8)\mf cis='' |
      }
    }
  }

  \duo { d''=''2. d8( cis | d=''2.)^\tRit } %
  { r8 d'='8( <a' c> <g bes> <fis a>4) s4 | r8 d( <g bes> <fis a> g='4) } %
  d,='8-.\p^\tATem d'-. |
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \partial 4 { r4 | }
  <c'=' g'>8(->-\frBass g)-. r4 <c g'>8(-> g)-. r4 |
}
{{ end }}
