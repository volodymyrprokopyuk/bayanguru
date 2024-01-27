{{ define "rh1" }}
  c,=''16 aes' f aes c, aes' f aes aes, f' c f aes, f' c f\) |
  g,='16\( ees' c ees g, ees' c ees f, d' b d f, d' b d='' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \minor
  \time 4/4
  \repeat segno 2 {
    \repeat volta 2 {
      g'='16\(\p ees' c ees g, ees' c ees g,\< ees' c ees g, ees' c ees |
      f,='16 d' b d f, d' b d f, d' b d f, d' \af 16\! b d\) |
      c,='16\( c' g c c, c' g c c, c' g c c, c' g c |
      ees,='16 c' aes c ees, c' aes c f, c' aes c f, c' aes c\) |
      f,='16\( des' aes des f, des' aes des bes g' e g bes, g' e g |
      {{ template "rh1" }}
      \alternative {
        \volta 1 { c=''16 ees, g c g c ees g, c8\) r g='4 | }
        \volta 2 { c=''16( g ees' c g' c, ees g c='''8) r r4 | }
      }
    }

    {
      \alternative {
        \volta 1 {
          \repeat volta 2 {
            bes,='16\(\mf g' ees g bes, g' ees g bes, g' ees g bes, g' ees g |
            bes,='16 aes' f aes bes, aes' f aes bes, aes' f aes bes, aes' f aes\) |
            bes,='16\( bes' aes bes bes, bes' aes bes bes,_\dCre aes' f aes bes, aes' f aes |
            bes,='16 g' ees g bes, g' ees g b, g' f g b, g' f g\) |
            c,=''16\(\f c' e, c' c, c' e, c' c, bes' g bes c, bes' g bes |
            {{ template "rh1" }}
            \alternative {
              \volta 1 { ees,='16 c' g c ees, c' g c ees,4\) bes'='\sf | }
              \volta 2 {
                \hSpace ees,='16\> %
                \sSlur nb #'((wb . 4) (ws . 18) (ww . 7) (wh . 2)) ( %
                c'=''16 g c ees, c' g c \af 4\! ees,4) g='\sf \bar "||"
              }
            }
          }
        }
        \volta 2 { \section \sectionLabel "Coda" } %
      }
    }
  }

  r16 aes,=16( ces des f) ces( des f aes) des,( f aes ces aes f des) |
  r16 aes=16( g fis) r ees'( d des) r16 aes'( g f <ees=' c'>4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \minor
  c=8-\stBass r cm! r c r cm r | d r g@7! r8 d r g@7 r8 |
  ees=8 r c@m! r8 ees r c@m r8 | aes, r aesM! r d r f@m! r8 |
  des=8 r desM! r c r c7! r | f, r fm! r d' r f@m r8 |
  g,=,8 r c@m! r8 g r g7! r | c r cm! r cm r r4 |
  c=8 r cm! r cm r c=4 |

  ees=8 r eesM! r ees r eesM r |
  \rep 2 { bes=,8 r bes7! r f=, r bes@7 r8 | }
  ees'=8 r eesM! r d r g@7! r8 | c r cM! r e r c@M r8 |
  f,=,8 r fm! r d' r f@m r8 | g, r c@m! r8 g r g7! r |
  c=8 r cm! r c4 r | c8 r cm! r c=4 g+g7! |

  des=1 | g,4 g g c= |
}
{{ end }}
