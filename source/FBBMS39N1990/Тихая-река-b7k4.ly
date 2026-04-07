{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key b \minor
  \time 2/4
  \meter 1/2 #'(1)
  \repeat segno 2 {
    fis'='8(\p a e a | d,4. b8) | a( d e b' | a2) |
    fis='8(\< a e \af 8\! a | fis a d b) | cis(\> d cis \af 8\! d | b='2) |

    g='8(\mp\< e g \af 8\! cis | b4 fis8 fis) |
    e='8( g cis b | \af 2\! b2)\> | a8(\p a fis e | d4 e8) e=' \bar "||"
    \alternative {
      \volta 1 {
        b=8 b cis a | d(\> d') d( \af 8\! cis='') |
        r8\pp <d,=' fis b>8[-- r <e fis>]-- |
        <d=' fis b>8-- <fis b d>-- <g b cis e>4-- |
        r8 <fis=' b d>8[-- r <e fis>]-- |
        r8 <d=' fis b>8[( <fis b d> <d fis b>]) |
        r8 <cis=' g' a>8[ r8 8] | r8 <d fis a>[ <d e g b>8 8] |
        r8 <d=' fis a>8[ r <d g b>] |
        r8\> <cis=' g' a>8[( <cis g' b> \af 8\! <cis=' a' b>]) \bar "||"
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }

  fis='8(^\tRit a, fis' e) |
  \duo { r4 <fis'=' a b>4 \fermata | }
  { \af 2\! d'='2\> \fermata \bar "|." }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key b \minor
  \meter 1/2 #'(1)
  d@M!4-\stBass a@7!4 | \rep 2 { d@M!4 g@M!4 | } | a@m!4( d@M!4) |
  b@m!4 a@M!4 | d@M!4 b@m!4 | fis@7!4. fis@7!8 | b@m!2 |

  e=4 em! | d b@m! | cis4 e@m! | d4 b@m! | fis@m!4 e@m!4 |
  d@M!4 g@M!4 | e@m!4 a@7!4 | d@M!4( fis@7!4) |

  b=,8-- b-- cis( fis,) | b4( cis) | cis8( d cis fis, | b2) |
  cis=8( e a, cis) | d4( e) | cis8( d cis b | a=,2) |

  d@M!4 a@7!4 | d@M!2-\fermata |
}
{{ end }}
