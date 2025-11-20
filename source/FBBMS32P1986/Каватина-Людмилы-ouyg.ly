{{ define "rh1" }}
  d=''2( g4)-. b,-. | c2( d4)-. e-. | d-. a8( b d c b a=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} d' b d | a c g c | fis, d' a d=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 4/4
  \partial 2 { b'='4-.\mp c-. | }
  {{ template "rh1" }} | b='4 g8) r b4-. c-. |
  {{ template "rh1" }} | b='2) g4(\p a | b2) fis'4( g |
  fis=''2) e4( d | cis a') b,( cis | d8\< e d cis d fis e \af 8\! g |
  fis=''4) a2 b,4~ | b g'2 e4~ | e_\dDim b2 cis4 | d2 b4-.\mp c-. |
  {{ template "rh1" }} | b='4 g8) r b4-. c-. |
  d=''2(_\dCre g4)-. b,-. | c-. c'4(~ c8 b a g |
  fis=''8\> e d c b c a b | \af 2\! g='2) r2 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  \partial 2 { r2 | }
  {{ template "lh1" (w `g=4-\frBass`) }} | g,=4 d' b d |
  {{ template "lh1" (w `g,=4`) }} | g,=4 d' b= r \clef treble |
  dis='4 a' b, a' | e g g, bes | a e' g, e' | fis, d' a cis |
  d='4 fis dis a' | e g g, b | a g' a, e' | d fis=' r2 \clef bass |
  {{ template "lh1" (w `g,=4`) }} | g,=4 d' b d |
  g,=4 d' f, g | e g c, r | r2 <d c'>4 r | <e= g>2 r2 |
}
{{ end }}
