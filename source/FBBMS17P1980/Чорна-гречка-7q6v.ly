{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key b \minor
  \time 6/8
  g'='4(\mp\< b8) fis4( \af 8\! d8) | e(\> d cis b4 \af 8\! b'8) |
  g='4( b8) fis4( d8) | e( d cis b4 b8) | d4(\p e8 d4_\dCre d8) |
  b'='4( b8 a4 fis8) | g4( b8) fis4( b8) | e,(\> d cis b4 \af 8\! b8) |
  <c=' d>4(\mf <c e>8 <b d>4_\dCre 8) |
  \duo { b'='4( b8 a4 fis='8) | } { d'='4 cis8 d( cis c=') | }
  <b= g'>4( <e b'>8) <b fis'>4( <d b'>8) |
  <ais= e'>8(\> <b d> cis b4 \af 8\! b=8) |

  r8\mf <e=' b'>4-- r8 <d b'>4-- | r8 <e ais>4-- r8 <d b'>4-- |
  r8\< <b'=' e>8 8 r <b fis'>8 \af 8\! 8 |
  r8\> <e='' ais>8 8 r <d='' b'>8 \af 8\! 8 |
  \duo {
    b'='8 \rest\mf a'=''8( g fis_\dCre e d) | b8 \rest d( e fis e d) |
    cis=''8( d e fis e d) | cis(\< b ais  \af 4\! b4.) |
    b='8 \rest\f a'=''8( g fis16 g fis e d8) |
    b='8 \rest\> d=''8( e fis16 g fis e \af 8\! d8) |
    e=''8(--\< fis16 e d e) fis8(-- g16 fis e \af 16\! d='') |
  } {
    s8 c''=''4~ c4. | s8 g4 fis a8 | b4. b | fis4.( g8 fis d) |
    s8 c'=''4~ c4. | s8 g4 a4. | b4. b=' |
  }
  <g,=' e'>8(--\> <gis d'>--^\tRit <ais cis>-- b4)-- \af 8\! %
  <d,=' fis b>8-- \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  e'='8(-\frBass d cis) d( cis b) | cis( b ais) b( cis d) |
  e='8( b g) d'( b fis) | cis'( ais fis) g( fis e) |
  fis=8 c' a g c b | e, g cis fis, a d |
  e,=8 <g b>8 8 d <fis b>8 8 | cis <e ais>8 8 b <d b'>8 8 |
  a'=8( g fis) g( e fis) | g( a g fis e dis) |
  e=8( d cis) d( cis b) | fis( gis ais b d fis=) |

  g=4( b8) fis4( d8) | e( d cis b4 b'8) |
  g=4( b8) fis4( d8) | e( d cis b4 b8) |
  d=4( e8 d4 d8) | b'4( b8 a4 fis8) |
  g=4( b8) fis4( b8) | e,( d cis b4 b8) |
  d=4(-- e8 d4 d8) | b'4(-- b8 a4 fis8) |
  g=4(-- b8) fis4(-- b8) |
  <e,= cis'>8(-- <f b>-- <fis e'>-- <b d>4)-- b,=,8-- \fermata |
}
{{ end }}
