{{ define "rh1" }}
  {{ .a }} <bes d>8 <a c>4 <c ees>8 | 8 <bes=' d>4~ 4.) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Adagio
  \clef treble
  \key g \minor
  \time 6/8
  {{ template "rh1" (w `<c''='' ees>4(\mf`) }}
  <a=' c>4( <g bes>8 <fis a>4 <fis bes>8 | g4.~ g4.) |
  d='4( d8 bes'4 <c, fis>8 | a' <d, g>4~ 4.) |
  d='4( d8 <bes' d>4 <fis a>8 | <a c>8 <g=' bes>4~ 4.) |

  {{ template "rh1" (w `<c='' ees>4(\mf`) }}
  <a=' c>4( <g bes>8 <fis a>4 <a c>8 | 8 <g bes>4~ 4.) |
  <c='' ees>4\f <bes d>8 <d f>4 <c ees>8 | 8 <bes d>4~ 4. |
  <a=' c>4 <g bes>8 <fis a>4 <a c>8 | 8 <g=' bes>4~ 4. \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  c=8( g' ees' f, c' ees | bes, f' g a bes d) |
  c,=8( g' ees' d, a' c | <g bes> d' d, g4.) |
  g,=,8( d' bes' g, ees' a | g, d' bes' g, d' bes') |
  g,=,8( d' bes' g, d' fis | g, d' g a bes d=') |

  c,=8( g' ees' f, c' ees | bes, f' a bes c d) |
  c,=8( g' ees' d, a' c | g4 d'8 bes g d) |
  c=8( g' ees' f, c' ees | bes,4 f'8 d' bes f) |
  c=8( g' ees' d, a' c | g4 d8 g,=,4.) \bar "|."
}
{{ end }}
