{{ define "rh1" }}
  {{ .a }} g g bes | d d c bes | a[ d] d16( c) bes( a=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} bes' d, bes' | g, bes' d, bes' | a, <fis' c'> d <fis= c'> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key bes \major
  \time 2/4
  \meter 1/2 #'(1)
  {{ template "rh1" (w `d'='8\mf`) }} | g='8( bes a g) |
  {{ template "rh1" (w `d='8`) }} | g='4( f=') |

  \repeat volta 2 {
    <f=' bes d>4 <f d' f> | <f bes d>8 r r4 |
    <bes=' d>8 <d f> <c ees> <bes d> | <a c f>4 <f a c> |
    <f=' a c>8 <f c' ees> <bes d> <a c> | <bes g'>4 <bes d> |
    <bes=' d>8 8 <a c> bes | a[ d] d16( c) bes( a) |
    \alternative {
      \volta 1 { g='4( f) | <f bes d>4 <f d' f> | <f=' bes d>8 r r4 | }
      \volta 2 { g='4 r | <f bes d> <f d' f> | <f=' bes d>8 r r4 \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key bes \major
  \meter 1/2 #'(1)
  {{ template "lh1" (w `g,=,8-\frBass`) }} | g=8 <bes d> d, <bes' d> |
  {{ template "lh1" (w `g,=,8`) }} | <g= bes d>4( <f= a ees'>) |

  <bes,=, f' bes>4 4 | 8 r r4 \clef treble |
  <bes'= f'>8 8 <c f> <bes= f'> \clef bass |
  <f= c'>4 4 | 8 8 <d c'>8 8 | <g d'>4 4 |
  g=8 <bes d>4 8 | a <c d>4 8 |
  <g= bes d>4 <f a ees'> | <bes, f' bes>4 4 | 8 r r4 |
  <g'= bes d>4 r | <bes,=, f' bes>4 4 | 8 r r4 |
}
{{ end }}
