{{ define "lh1" }}
  R2 | R2 | {{ .a }} bes,8 | f'2 | g,4 gm! | d'8. e16 f4 | e8 d cis=4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \minor
  \time 2/4
  \duo { d''=''4\mf f8 e16 d | cis8 e a,='4 | } { d''=''4 d8 a~ | a r a4 | }
  <f'=' c'>8. <g b>16 <a c>8 <bes d> | <a c>8. <g bes>16 <f a>4 |
  g='8[\< a bes \af 8\! d] | <f, a>8.\> g16 f8 \af 8\! a |
  g='8 f e a | d,4 f | <bes, d g>8[\< <c f a> <bes f' bes> \af 8\! <d=' f d'>] |

  <d=' a'>4\f <d a' f'> | <e bes' e>8 <d bes' d> <e a cis> <g a e'> |
  <f=' a d>4 <d f d'> |
  \duo { d'''='''4\mf f8 e16 d | cis8 e a,=''4 | } { r4 a''=''4 | g a='' | }
  <c'='' f a c>8. <b g' b>16 <c a' c>8 <d bes' d> |
  <c='' a' c>8. <bes g' bes>16 <a f' a>4 |
  <g=' g'>8[\< <a a'> <bes g' bes> \af 8\! <d d'>] |
  <a=' f' a>8.\> <g g'>16 <f f'>8 \af 8\! <a a'> |
  <g=' d' g>8 <f f'> <e a e'> <a a'> | <d, d'>4 <f d' f> |
  <g=' bes d g>8[\< <a a'> <bes g' bes> \af 8\! <d d'>] |
  <a=' d a'>4\f <f' a f'> | \duo { bes''=''4^\tRit s4 | }
  { <e''='' e'>8 <d d'> <cis e a cis> <e='' g a e'> | }
  <d='' f a d>4 4 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `f=4.-\puBass`) }} | d=4 dm! | g,8[ f' d bes=,] |

  f'=4 f8( d) | g,4 a | d dm! | {{ template "lh1" (w `f=4.`) }}
  d=8. c16 bes8 a | g4 gm! | f'8. e16 d8 f | g,4 a |
  \duo { r4 gm!4 | } { d=2 | }
}
{{ end }}
