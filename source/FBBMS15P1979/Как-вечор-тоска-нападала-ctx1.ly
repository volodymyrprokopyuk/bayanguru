{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key d \minor
  \time 4/4
  d'='4(\p a' f e | d cis d2) | f4(\mf f f g | a1) |
  a='4\( a g g | f f e e | d f e a | \af 1\! d,='1\)\> |

  \duo {
    d''=''4( a' f e | d cis d2) | f4(_\dCre f f g | a1) |
    a=''4( a g g) | f( f e e) | d(\> f e^\tRit a |
    \af 4\! d,=''1) \fermata \bar "|."
  } {
    d''=''2(\mf a | bes a) | bes1 | a4 e' d c | d2 des | c b |
    bes='2 a~ | a4 g f='2\p \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  R1 | R1 | d=4(-\frBass a' f e | d cis d2) | f4( f f g | a1) |
  a=4\( a g g | f f e e | d f e a | d,1\) | g4 d des2 | c f |
  bes,=,1 | a2 gis | g1 | f4 e d=,2 \fermata |
}
{{ end }}
