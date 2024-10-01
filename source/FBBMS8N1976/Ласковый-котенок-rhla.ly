{{ define "rh1" }}
  bes='4(\< f') | bes,8 bes( \af 4\! f'4) |
  bes=''8(\> bes, f' ees16 d | c8 f, \af 4\! bes='4) |
{{ end }}

{{ define "lh1" }}
  {{ .a }} 8 <c ees>8 8 | <d f>8 8 <ees=' g>8 8 |
{{ end }}

{{ define "lh2" }}
  <f=' a>8 <ees g> <d f>8 8 | <c ees>8 8 <bes= d>4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key bes \major
  \time 2/4
  bes'='4(\mp\< f') | bes,8 bes( \af 4\! f'4) |
  bes=''4(\> bes,) | f'8( ees16 d c8 \af 8\! f,) |
  {{ template "rh1" }}

  \af 8.\! <g=' c>4(\< \af 4\! <fis d'>)\> |
  \duo {
    \af 8\! c''=''8--\< c-- \af 4\! d4\> |
    <g,=' bes>8(\< <a c> d \af 8\! g) |
    c,=''8(\> d16 ees d8 \af 8\! c='') |
  } { g'='4( fis) | s4 bes | bes a=' | }
  {{ template "rh1" }}
  \af 2\! <f=' aes bes>2--\< | \af 2\! <g bes>--\> |
  \af 2\! <ees=' ges bes>--\< | \af 2\! 2--\> |
  <bes'=' ees>4--\< \af 4\! <c ges'>-- |
  \af 2\! <d='' bes'>2--\> \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key bes \major
  {{ template "lh1" (w `<bes= d>8-\frBass`) }}
  <f=' a>8 8 <ees g>8 8 | <d f>8 8 <c ees>8 8 |
  <bes= d>8 8 <c ees>8 8 | <d f>8 8 <ees g>8 8 |
  {{ template "lh2" }}

  ees='8( a, d bes) | ees( a,= \clef bass d=' d,) |
  <g= d'>2 \clef treble | <ees'=' g>4 f8 f, |
  {{ template "lh1" (w `<bes= d>8`) }} {{ template "lh2" }}
  c='8[( ees d c]) | ees( d c4) | bes8[( d c bes]) | d( c bes4) |
  <c=' ges'>4-- <ees bes'>-- | <bes= f'>2-- |
}
{{ end }}
