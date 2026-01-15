{{ define "rightHand" }}
\relative {
  \tempo "Lento cantabile"
  \clef treble
  \key e \minor
  \time 3/4
  \repeat volta 2 {
    d'='4(\mp\< g a | b a b | d2 \af 4\! e4 | d2.) | c4( b a |
    \alternative {
      \volta 1 { b='4\> g a | b2 a4 | \af 2.\! e'=''2.) | }
      \volta 2 { b='4(\> g e | a2 g4 | \af 2.\! d'=''2.) | }
    }
  }

  \repeat volta 2 {
    \duo { d'='4( g a | <g b> a <g b> | <g d'>2 <g c e>4 | <g b d>2.) | }
    { d'='2.~ | d | d2\< e4 | \af 2.\! d='2. | }
    <c,=' e a c>4(\f <b e b'> <c e fis a> |
    \alternative {
      \volta 1 {
        <b= e g b>4\> <b e g> <a e' a> | <b e g b>2 <a d fis a>4 |
        \af 2.\! <g= e'>2.) |
      }
      \volta 2 {
        <b= e g b>4(\> <b e g> <g b e> | <a d fis a>2^\tRit <a cis e g>4 |
        \af 2.\! <a= d fis>2.) \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  R2. | d'='2.(~-\frBass | d2 c4 | b=2.) \clef bass |
  a=2.( | g | fis | e) | g2.( | fis2 e4 | d=2.) |

  \meter 1/4 1,1,1
  r8 c'='4 b a8 | g d fis e d g, | b d g b4 a8~ | a g fis e d g, |
  a=,8 fis g4 a | b2 c4 | b2 d4 | e2. | b | a | d,=, |
}
{{ end }}
