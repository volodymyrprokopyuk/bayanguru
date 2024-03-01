{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key e \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      b''=''8(\p c_\aDol b g e b' | g b b, b' g b) |
      a=''8( b a fis dis a' | fis a b, a' fis a) |
      g=''8( a g e b g' | fis\< g fis c a \af 8\! fis') |
      \alternative {
        \volta 1 {
          e=''8(\> fis e cis g \af 8\! e') | dis( b ais'\sf b, b'\p b,=') |
        }
        \volta 2 { dis=''8(\> e dis b fis \af 8\! dis') | e=''2 r4 \fine | }
      }
    }

    \volta 2
    \repeat volta 2 {
      d'='''8(\p e d b g d' | b d d, d' b d) |
      cis='''8(\< d cis bes g cis | bes cis e, cis' bes \af 8\! cis) |
      c='''8(\> d c a ees \af 8\! c') | b(\> c b g d \af 8\! g) |
      \alternative {
        \volta 1 {
          \duo { a''=''4\mf\< a \af 4\! g | fis8( d cis' d, d' d,='') | }
          { a'='8( e' a, e' a, e') | a,=' r r4 r | }
        }
        \volta 2 {
          a=''8( e e' e, fis d) | g4 r \tuplet 3/2 { g,='8( a b=') } |
        }
      }
    }

    \repeat volta 2 {
      <e,=' g c>2\f c'4 | c8( d16 c b4 c) |
      \duo { <c''='' a'>2. | <c aes'> | <c='' g'> | }
      { a'='2 a4 | aes2. | g2 g='4 | }
      \acc { c=''16 d } c=''4( b c) | <g c e>2 g4( |
      \alternative {
        \volta 1 { <fis=' a>2 <f=' b>4) | }
        \volta 2 {
          <fis=' a>2 <f b>4 \sSlur ub #'((wb . 2.5) (ww . 2.8)) ( |
          e='8)(\pp  g c g e g) | c( g e g c g=') |
        }
      }
    }

    \repeat volta 2 {
      \duo {
        r8\p fis'='8( c' fis, e fis) | r8\< fis( b fis e \af 8\! fis) |
        r8 fis='8( a fis e fis) | r8\> fis( b fis e \af 8\! fis) |
        r8\p fis='8(_\dDim c' fis, e fis) | r8 fis( b fis e fis) |
        r8 fis='8( ais fis e fis=') |
      } {
        e'='4 c'2 | e,4 b'2 | e,4 a2 | e4 b'2 |
        e,='4 c'2 | e,4 b'2 | e,4 ais='2 |
      }
      \alternative {
        \volta 1 { <dis=' b'>2.\pp | }
        \volta 2 { <dis=' b'>2\pp b''=''4\p \bar "||" }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \duo {
    r4 <g= b e>8 r8 8 r8 | r4 <g b>8 r8 8 r8 |
    r4 <dis= fis b>8 r8 8 r8 | r4 <dis fis>8 r8 8 r8 |
    r4 <b=, e>8 r8 8 r8 | r4 <e fis>8 r8 8 r8 |
    r4 <e= g>8 r8 8 r8 | b=,4 \clef treble <e'=' g>8 r8 <dis=' fis>8 r8 |
    \clef bass r4 <dis,= fis>8 r8 8 r8 | <e= g>2 %
  } {
    e=2.-\frBass | e | b | b | g | a | ais | s4 b'2 | b,2. | r4 e,=, %
  } r4 |
}
{{ end }}
