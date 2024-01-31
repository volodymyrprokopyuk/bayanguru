{{ define "lh1" }}
  {{ .a }} g fis16 g e8) | <g b>4( e8) e |
  e='8( fis a16 g fis e) | <g b>4( e8) e |
  a='8( g fis16 g e8) | d( b16 fis' e8) e |
  a='16( b a g) fis( g fis e=') |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Andante
  \clef treble
  \key e \minor
  \time 2/4
  \af 2\! b'='2\(\p\< | \af 2\! cis\> | \af 2\! <b d>\< | \af 2\! <g e'>\)\> |
  <a=' d fis>2~ | 4 <b e g> | <cis e a>2 | <b fis' b>4(--\>^\tRit \af 4\! <g=' b e>)-- |

  e='8(\mp\< g fis16 g \af 8\! e8) | <g b>4(\> e8) \af 8\! e |
  e='8(\p\< fis a16 g fis \af 16\! e) | <g b>4(\> e8) \af 8\! e |
  a='8(\mp g fis16 g e8) | d( b16 fis') e8 e |
  a='16(\> b a g) fis( g fis e) | d( b fis'8) \af 4\! e='4\p |

  R2\mp | e'=''8( g fis16 g e8) | <g b>4( e8) e |
  e=''8( fis a16 g fis e) | <g b>4( e8) e |
  fis=''4 a16( g fis e) | fis8.( e16) d( e d c) | b8(^\tRit d16 fis e=''4) \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key e \minor
  {{ template "lh1" (w `e'='8(-\frBass`) }} | d( b fis'8 e='4) |

  d='4.( d8 | cis2) | c4.( c8 | b2) | bes( | a4 g) | cis( c | b g=) |

  {{ template "lh1" (w `e'='8(`) }} | a4( e=') |
}
{{ end }}
