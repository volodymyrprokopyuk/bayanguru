{{ define "rightHand" }}
\relative {
  \tempo Vivo
  \clef treble
  \key g \major
  \time 2/4
  \repeat volta 2 {
    d''=''4.\f b8 | c4 b8 a | g2 | d'8( g,) g'( f) | e4 d8( c) | b4 d8( b) |
    a='4 a | a g8( fis) | e4( d) | g b | a g |
    \alternative {
      \volta 1 { <d=' d'>2 | }
      \volta 1 { <d=' d'>2 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \meter 1/2 #'(1)
  g,=,8( gM!) gM gM | d'( d7!) d7 d7 | g,_\aSim gM! gM gM |
  b=,8( g@M!) g8( g7!) | c cM! cM cM | g gM! gM gM |
  d'=8 dM! dm dm | a aM! aM aM | cis( a@7!) d8( dM!) |
  g,=,8[( gM!]) e( g@M) | a8 a7! a7 a7 | d( c b a) |
  \duo { r4 dM! | } { d=2 | }
}
{{ end }}
