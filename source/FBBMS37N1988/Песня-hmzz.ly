{{ define "rightHand" }}
\relative {
  \tempo "Andante cantabile"
  \clef treble
  \key e \minor
  \time 3/4
  \partial 4 { e'='8(\mp g \bar "||" }
  \repeat segno 2 {
    \volta 1
    b='4 b b8 g | a2) a8( b | a4. a8 b[ fis] | g2) b8( b |
    b='4. a8 b[ fis] | a4 g) g8( g | g4. fis8 a[ g] | fis2) %
    \duo {
      e'='8( g | b4 b b8 g | a2) c4(~ | c2 d8 a | b2) b8( b |
      b='4. a8 b[ a] | a4 g) e8( fis | g4. e8 fis[ b,] |
      e='2) \fine \bar "!!" %
    } {
      e'='4( | d2.) | c2 fis8( e | d4. e8 fis4 | g2) r4 | <c, e>2. |
      <b= e>2 r4 | ais2 a4 | g=2 %
    }
    \volta 2
    \duo {
      e'='8( e |
      \tempo "Più mosso"
      e='4. d8 e[ fis] | a4 g) b8( b | b4. a8 d[ a] | b2) g8( g |
      g='4. fis8 a8[ g] | b4 d,) d8( d | e4. e8 fis[ e] |
      b=2) e8 \sSlur nf #'((ww . 1.5) (ws . 1)) ( g=') \bar "||"
    } {
      s4 | c'='2. | b2 r4 | c4 e fis | g2 r4 | e4 c~ c |
      d='4 d s4 | g,2 a4~ | a=2 %
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \partial 4 { r4 | }
  e=4-\stBass em!2 | e4 a@m!2 | c4 a@m!2 | b4 e@m!2 | a4 am! d |
  g,=,4 gM!2 | c4 cM!2 | b4 b7! r | e g@M! gM4 | a, am! r4 |
  d=4 d7! d7 | g, gM! r4 | c a@m! am4 | b e@m! r4 |
  fis'=4 fis7! b,4 | e= em! r |

  d=4 d7! d7 | g, gM! r | c cM! fis+d@7! | g4 gM! r |
  c=4 cM! cM | d g@M! r4 | a am! am | b=, b7! r4 |
}
{{ end }}
