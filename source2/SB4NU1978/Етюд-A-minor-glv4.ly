{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  \repeat segno 2 {
    \volta 1
    \duo {
      e''=''2(\p c4 a | a2 gis) | e4( a c e | e2 d) |
      f=''2( d4 b | a2 g) | g4( b d f | e g e2) |
      g=''2( cis, | e4 d a2) | f'( b, | d4 c g2) |
      f='4( a c f | e c a c) | b( d gis, b | a c8 e a=''2) \fine \bar "||"
    } {
      r8 <e'=' a>8 8 8 r8 8 r <c e> | r <b d>8 8 8 r8 8 8 8 |
      r8\< <a= c>8 r <c e> r <e a> r \af 8\! <a c> |
      r8 <f=' a>8 8 8 r8\> 8 8 \af 8\! 8 |
      r8 <g=' b>8 8 8 r8 8 r <d g> | r <b d>8 8 8 r8 8 8 8 |
      r8\< <b= d>8 r <d g> r <g b> r8 \af 8\! 8 |
      r8 <g=' c>8 r8 8 r <gis d'>8 8 8 |
      r8 <a=' cis>8 8 8 r <g a>8 8 8 | r <fis a> r8 8 r <d fis>8 8 8 |
      r8 <g=' b>8 8 8 r <f g>8 8 8 | r <e g> r8 8 r <c e>8 8 8 |
      r8\< <a= c>8 r <c f> r <f a> r <a c> |
      r8 <e=' a>8 r8 8 r <c e> r \af 8\! <e a> |
      r8 <f=' a>8 r8 8 r <d e> r8 8 | r\> <c e> r4 \af 2\! <a'=' c>2 \fine |
    }

    \volta 2
    \duo {
      r8\mf <c''='' e>8 8 8 r <g c> r <c e> |
      r\< <c='' f>8 8 8 r <a c> r \af 8\! <c f> |
      r8 <d='' g>8 8 8 r <d f> r <d f> | r\> <c e>8 8 8 8 8 8 \af 8\! 8 |
      r8\p <a=' c>8 8 8 r <e a> r <a c> | r\< <a d>8 8 8 r <f a> r <a d> |
      r8 \af 8\! <gis=' b>8 r <b e> r <e gis> r <e b'> | r <e a>8 8 8 8 8 8 8 |

      g=''2(\f a4 g | g f d2) | f2( g4 f | f e c g) |
      f='4( a c f | e a c a) | g( f b, a | gis2 e'='') |
    } {
      g'='2\( e4 g | a2 f4 a | b2 a4 g | g1\) |
      e='2\( c4 e | f2 d4 f | e gis b d | c1\) |

      r8 <cis='' e>8 8 8 r8 8 r8 8 | r <a d> r8 8 r <f a>8 8 8 |
      r8 <g=' b>8 8 8 r8 8 r8 8 | r\> <g c> r8 8 r <e g> r \af 8\! <c e> |
      r8\< <a= c>8 r <c f> r <f a> r <a c> |
      r8 \af 8\! <a=' c>8 r <c e> r <e a> r <c e> |
      r8 <a=' b>8 r8 8 r\> <f a> r <b, fis'> |
      r8 <d=' e>8 8 \af 8\! 8 r <e=' b'>8^\tRit 8 8 \bar "||"
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\stBass am! am am | d dm! e e7! | a, am! am c | b d@m! dm4 dm |
  g=,4 g7! g7 g7 | d' g@7! g74 g7 | g, g7! g7 g7 | c cM! e e7! |
  a,=,4 a7! a7 a7 | d dM! dM dM | g, g7! g7 g7 | c cM! cM cM |
  f,=,4 fM! fM fM | a am! am am | d dm! e e7! | a, e'= a+am!2 |

  c=4 cM! cM cM | f, fM! fM fM | g g7! g7 g7 | c cM! cM cM |
  a=,4 am! am am | d dm! dm dm | e e7! e7 e7 | a, am! am am |
  a=,4 a7! a7 a7 | d dm! dm dm | g, g7! g7 g7 | c cM! cM cM |
  f,=,4 fM! fM fM | c' a@m! am4 am | d dm! d dis | e= e7! e7 e7 |
}
{{ end }}
