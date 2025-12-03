{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 4/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      a''=''8\f gis_\aSta b a g f e d | e dis f e d c b a | gis b d f e c e a |
      \alternative {
        \volta 1 { b=''8 dis, fis c' c( b) b( e,='') | }
        \volta 2 { a=''8 b, d gis <c,='' e a>4 r \fine | }
      }
    }

    \volta 2
    \repeat volta 2 {
      g'=''8 fis g c b a g f | e dis e a g f e d |
      \alternative {
        \volta 1 { c=''8 b c f e d c b | a b c e d4 <b=' d f g> | }
        \volta 2 { c=''8 b c f e c d e | f g a b <e, g c>4 <d='' gis b> \bar "||" }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,4-\frBass <e' a c>4 4 r | a, <e' a c>4 4 r |
  b=,4 <e gis d'> <e a c> r | b <dis a' b> e <gis d'> |
  <d= f a>4 <e gis d'> <a,=, e' a c> r |

  \rep 3 { c=4 <e= g c>4 4 r | } | f( fis g) <g b f'> |
  c,=4 <e= g c>4 4 r | <d f a d> <g b f'> <g c e> <e= gis d'> |
}
{{ end }}
