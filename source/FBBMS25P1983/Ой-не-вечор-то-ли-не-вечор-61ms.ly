{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key c \minor
  \time 2/4
  c''=''4\(\p bes8 aes | c4 bes8 aes | g bes g4 | c,='2\) |
  \duo {
    \mergeDifferentlyDottedOn
    ees'='4.\( <d f>8 | g bes g4 | f8 aes g4 | c,2\) |
    c'=''4\(\mp bes8 aes | <g c>4 ees8 f | g bes g4 | c,2\) |
    ees='4.\( f8 | g bes g4 | f8 aes g4 | c=''2\) |
  } {
    s2 | ees'='4( d | c ees8 d | c2) | aes'8( f g aes) | s2 |
    ees='4( d) | s2 | ees8( d c4 | d2) | c4 ees8 d=' | s2 |
  }

  <c=' f>4\(\mf <f aes>8 <g bes> | <aes c>4. <f aes>8 |
  <g=' bes>8 <bes des> <aes c> <g bes> | f='2\) |
  \duo {
    aes'='4\(\p bes | c2 | des4 bes | c2\) |
    bes='8\(\mp <aes c> <g bes> <f aes> | g bes g4 |
    f='8 aes <ees g> <d f> | c2\) | ees4.\(\p f8 | g bes g4 |
    f='8 aes g4 | c,2_~\> | \af 2\! c='2\) \fermata \bar "|."
  } {
    f'='4 g8( f) | aes4.( g16 f | bes8 aes g f) | s2 | s2 |
    ees='4( d8 ees) | s2 | s2 | c4. d16( c | d2) |
    c='4( ees8 d=') | s2 | s2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  \rep 5 { R2 | } bes=2( | aes4 g | c2) | r4 ees8( f | c2) |
  bes=4.( g8 | aes[ g f ees]) | c'( bes aes4 | g2) | aes8( f g4 | c,=2) |

  <f= aes>4( ees'8 des | <aes ees'>2) | e'8( g, aes bes16 c |
  des='4 c8 bes) | aes4( bes | c4. bes16 aes | bes4 c8 des | c='2) |
  r4 bes=8 bes | c4( g | aes8 f g4) | c8[( bes aes g] | aes2 | g) |
  aes=8( f g g, | c2_~ | c=) \fermata |
}
{{ end }}
