{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \minor
  \time 2/4
  \duo {
    b'='8 \rest \p <ees,=' g>8 b' \rest 8 | b \rest 4 <d, g>8 |
    c='8 ees~ <bes ees~ g> <bes ees>~ | <ees f>4 ees8 <c d> |
    <ees=' g>4( <d f>) | <ees, g c>4 b''16 \rest d,16(\< <c ees> <d f> |
    ees='8 <ees g> <g bes>8 \af 8\! 8 |
    <aes=' c>4 <g bes>8\> \af 8\! <f aes> | g4) r8 g(\< |
    <c,=' fis a>4 \af 4\! <b f' aes b> | <d g~ d'>8 <ees~ g~ c> <ees g>4~ |
    <ees=' g>8) ees[(\p d c]) |
    <ees='g>8( <d f> <f aes>4~ | 4) <g bes>8( <f aes> |
    <ees=' g>4) <d f>8( <c ees> | <ees g>4 <d=' f>) |
  } {
    s2 | a=4 b | c2( | <a c>4) <aes c> | b2 |
    s2 | bes=4 des | c <aes d> | ees'8[ g,( bes <bes ees>]) |
    s2 | r8 c='~ c bes | <a c> r r4 |
    aes=4 aes8( c~ | <aes) c d> <c d> r4 | s2 | <g= b>2 |
  }

  <ees= g c>8\p \noBeam <g'=' c ees g>\< \arpeggio r8 \af 8\! 8 |
  r8 <f=' b ees g>4\> \arpeggio \af 8\! <g'='' g'>8 |
  <ees,=' g c>8( <g c ees> <g c ees g> <g bes ees> |
  <f=' a ees' f>4) \duo { <ees'=' ees'>8( <d=' d'>) | } { <aes'=' c>4 | }
  <g=' b ees g>4( <f b d f>) | <c ees g c>\< r16 d'16 <c ees> \af 16\! <d f> |
  <g,=' bes ees>8( <g bes ees g> <bes ees g bes>8 8) |
  <c='' ees aes c>4( <bes d g bes>8 <aes d f aes> |
  <g=' bes ees g>8) <bes, ees>[( <ees g> <g bes>]) |
  <a=' c fis a>4\< \af 4\! <aes b f' b> |
  <d='' g d'>8 <c g' c> \duo { <g'='_~ ees'~ g~>4 | 8 } { c''=''8 bes | a=' } %
  <ees,=' ees'>8[(\p <d d'> <c c'>]) |
  \duo { c''=''2_~ | 8 } { <g'=' g'>8 <f d' f> <bes g' bes> <aes=' f' aes>8 | 8 } r %
  <bes'=' g' bes>8( <aes f' aes> | <g ees' g>4) <f d' f>8( <ees c' ees>) |
  <g=' c ees g>4( <f c' d f>)\< | <ees g c> \af 4\! <g c ees g> |
  <a=' c fis a>4\< \af 4\! <b d f b> |
  \duo { <ees''='' g>4 } { <d''='' d'>8 <c='' c'> } <a c ees g>4~ | 4\> \af 4\! %
  \duo { d'='8( <c ees> | <ees g> <d=' f>) } { s4 | aes=4 } <d,=' f aes>8 <d' f aes> |
  <aes'='' c f aes>8\pp r %
  \duo { c''=''4 | s4 } { <bes'=' g' bes>8^(\p <aes f' aes> | <g=' c ees g>4) } %
  <f,=' d' f>8( <ees c' ees>) | <aes c ees g>4\< \af 4\! <g c d g> |
  <c='' ees g c>4\p <ees,,= g c> \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  g=4-\stBass a8 f8~ | f4 g+g7! | c+cm! r | r8 <f, c'>4. | r8 g4 g8 |
  r8 c=8[ c16] r8. | r8 ees8~ ees4 | r8 aes,8 bes4 | r8 bes[ ees] r |
  d=8 dM! des desM! | c+cm! r r4 | R2 | r8 <f, c'> r4 | r2 |
  r8 g=,8 g4 | <g des'>8 g4 g=,8 |

  c=8 g'( a g | b des, g) g, | c c bes4 | f@M!8[ <f c'>8] aes'4 |
  g=8 g, gM! g | c+cm! c ees c@m! | ees+eesM!4 des8 ees@7! |
  aesM!8 aes=, bes7! bes | ees[ eesM! eesM eesM] | d d7! des4 |
  c+cm!8 cm cm4 | R2 | f+fm!8 f g aes | c=' r r4 |
  g,=,8 c@m! d'8 c | aes@M![ g8] f@m![ g8] | c@m![ g8] c@m![ g8] |
  r8 g=,8 g7! g | c+cm!4 c@m!8[ cm8] | c@m!4 r4 |
  f=,8 c' f@m![ fm8] | f@m! aes'8[ bes aes] | c@m![ g,8] r4 |
  c@m!8[ g8] f@m![ g8] | c@m!4 c+cm!4 \fermata |
}
{{ end }}
