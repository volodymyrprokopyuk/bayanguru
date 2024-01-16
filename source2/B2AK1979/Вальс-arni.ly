{{ define "rh1" }}
  d'='''8(\mp e d b g d' | b d d, d' b d) |
  cis='''8(\< d cis bes g cis | bes cis e, cis' bes \af 8\! cis) |
  c='''8(\> d c a ees c') | b( c b g d \af 8\! g='') |
{{ end }}

{{ define "rh2" }}
  e='8(\p fis c' fis, e fis) | e( {{ .a }} fis b fis e fis) |
  e='8( fis {{ .b }} fis e \af 8\! fis=') |
{{ end }}

{{ define "lh1" }}
  g,=,4 gM! gM | g gM gM | g gd! gd | g gd gd |
  g=,4 c@m! cm4 | g gM! gM | c a@m! {{ .a }} |
{{ end }}

{{ define "lh2" }}
  a=,2 a4 | b2 b4 | c2 c4 | b2 {{ .a }} |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valzer"
  \clef treble
  \key e \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      b''=''8(\p c_\aDol b g e b' | g b b, b' g b) |
      a=''8( b a fis dis a' | fis a b, a' fis a) |
      g=''8( a g e\< b g') | fis( \af 8\! g fis c a fis') |
      \alternative {
        \volta 1 {
          e=''8( fis e cis g e') | dis( b ais'\> b, b' \af 8\! b,=') |
        }
        \volta 2 {
          dis=''8(\> e dis b fis \af 8\! dis' | e=''2) r4 \fine \bar "||"
        }
      }
    }

    \volta 2
    {{ template "rh1" }}
    a=''8(\mf\< e a e g \af 8\! e | fis d cis'\> d, d' \af 8\! d,) |
    {{ template "rh1" }} | a=''8(\mf\> e e' e, fis \af 8\! d) |
    g=''4 r \tuplet 3/2 { g,='8(\< a \af 8\! b=') } |

    \rep 2 {
      <e,=' g c>2\f c'4 | c8( d16 c b4 c) |
      \duo { <c''='' a'>2.-> | <c aes'>2.-> | \af 2.\! <c='' g'>2.->\> | }
      { a'='2 a4-- | aes2 aes4-- | g2 g='4-- | }
      \acc { c=''16 d } c4(\< b \af 4\! c) |
      <g=' c e>2 g4 | <fis a>2(\> \af 4\! <f=' b>4) |
    }
    e='8(\mp\> g c g e g | c g e g c \af 8\! g=') |

    \repeat volta 2 {
      {{ template "rh2" (w `\<` `a='`) }} |
      e='8(\> fis b fis e \af 8\! fis) |
      {{ template "rh2" (w `\>` `ais='`) }}
      \alternative {
        \volta 1 { <dis=' b'>2\pp r4 | }
        \volta 2 { <dis=' b'>2\pp b''=''4 \bar "||" }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e=4-\stBass em! em | e em em | b b7! b7 | b b7 b7 |
  g=,4 e@m! em4 | a am! am | ais fis@M! fisM4 |
  b=,4 e@m! b@M!4 | b4 b7! b7 | e= em! r |

  {{ template "lh1" (w `cis=4`) }} | d=4 g@m! d@M!4 |
  {{ template "lh1" (w `d+d7!4`) }} | g=,4 gM! r |

  \rep 2 {
    c=4 cM! cM | e c@M! cM4 | f, fM! fM | f fm! fm |
    e'=4 c@M! cM4 | fis, d@7! d74 | g c@M! cM4 | g=, d@7! g@7!4 |
  }
  c=4 cM! cM | c= cM r |

  {{ template "lh2" (w `b=,4`) }}
  {{ template "lh2" (w `r4`) }} | b=,2 r4 |
}
{{ end }}
