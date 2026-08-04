{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key d \minor
  \time 2/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      f'='8( a f'4) | e8( f32 e dis e g8.)-> f16( | e8 d gis, a |
      \alternative {
        \volta 1 {
          c=''8\> bes=') e, \af 8\! g=' | \duo { a'='2 | } { r8 cis'='4. | }
        }
        \volta 2 {
          c=''8[\>^\tRit bes <g e'>] \af 8\! g'( |
          <f,=' d'>2) \fermata \fine \bar "||"
        }
      }
    }

    \volta 2
    \time 4/4
    \repeat volta 2 {
      \duo { c''=''4(^\tATem d16 c b c a'4.. a16 | a2 g4 g='') | }
      { s2\f c''=''4( d16 c b c | c4 b='2.) | }
      bes='4(_\dDim c16 bes a bes g'4. bes,8 |
      \alternative {
        \volta 1 { bes='2 a=') | }
        \volta 2 {
          \trio { a'='1^\tRit | } { s2 e'='4 \rest g='4 | }
          { s2 e''=''2 \bar "||" }
        }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  \meter 1/2 #'(1)
  \duo {
    d=2 | a | bes | g | r8 g'8( f e) | g,2 | d'= \fermata |
  } {
    d=8^(-\frBass f a d) | a,^( e' cis' g) | bes,^( f' d'4) |
    g,,=,8^( d' bes'4) | a,2 | g8^( d'~ <d bes'>4) |
    d=8^( a'~ <a= d>4) \fermata |
  }

  \duo {
    r4 <a= c>4 r <c f> | r8 f8 d f~ f d f d | r4 bes r c |
    r4 <a= c>2 <c f>4 | r4 c( cis='2) |
  }
  { f=2 a | g1 | c,2 e= | f2. a4 | f2 r4 a=4 | }
}
{{ end }}
