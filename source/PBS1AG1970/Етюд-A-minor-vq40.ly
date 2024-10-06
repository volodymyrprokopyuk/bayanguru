{{ define "rightHand" }}
\relative {
  \tempo "Allegro non troppo"
  \clef treble
  \key a \minor
  \time 2/4
  \partial 4 { b'='16\mf c d dis | }
  \repeat segno 2 {
    e=''16\< c b a f' c b \af 16\! a | e'\> c b a~ a g a \af 16\! e |
    g='16 f e d~ d c b e | a,\< c e \af 32.\! a b\> c d \af 16\! dis \bar "||"
    \alternative {
      \volta 1 {
        e=''16-- c b a f'-- c b a | g'-- c, b a  a'-- g a ais |
        b=''16\< gis b e dis b dis fis |
        <gis,='' b e>8 <b, f' g>-> \af 8\! <c e g>->\mf r |
        r8 <b,= f' g>8 b'16 d g f | \duo { g''=''4-> } { f''=''16 e e d='' } %
        <e='' g a>8\f r | r <cis, g' a> cis'16 e a g |
        \duo { a''=''4->\< \af 4\! s4 | } { g''=''16 f f e d c b a=' | }
        b,='16\f b' b b, d c b a | b b' b b, d c b a |
        b='16\mp b' b b,~ b b' b b,~ |
        b='16\p b' b b,~ b\<^\tRit c d \af 16\! dis='' \bar "||"
      }
      \volta 2 { \section \sectionLabel "Coda" }
    }
  }

  e=''16\< c b a f'^\tRal c b \af 16\! a | a'->\f f c b~ b a c e |
  fis,='16\< e' gis, \af 16\! e' b\>^\tRit a c \af 16\! <b e> |
  <a=' a'>2\p \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
