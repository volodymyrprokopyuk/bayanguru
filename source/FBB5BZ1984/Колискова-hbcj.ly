{{ define "rh1" }}
  \duo { a'='8(\mf\< bes \af 8.\! a4) g8(\> a \af 8.\! g='4) | }
  { g'='2-- ees='-- | }
{{ end }}

{{ define "rh2a" }}
  ees'='8(\< c a \af 16.\! c) d(\> c a \af 8\! c=') |
{{ end }}

{{ define "rh3a" }}
  {{ .a }} d \af 8.\! c4) bes='8(->\> c \af 4\! bes='4) |
{{ end }}

{{ define "lh1" }}
  r8 {{ .a }} r8 <g_~bes d>]-- g8( ees' c ees) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Adagio cantabile"
  \clef treble
  \key g \minor
  \time 4/4
  d'='4(\p g a8 bes a4 | a bes8 a g2) | d4(\mp g a8 bes a4 | a fis g='2) |
  {{ template "rh1" }} | <fis=' a>8( <a c> <g bes> <fis a> g2) |
  {{ template "rh1" }} | <ees g>4(\< 4 \af 2\! <d=' f>2) |

  \duo {
    {{ template "rh2a" }} | ees='8(\< c g' \af 16.\! c, a')\> fis( d \af 8\! a) |
    {{ template "rh2a" }} | ees='8(\< c g' \af 16.\! c,) %
  } { ees'='2-- d-- | ees4 g a8 fis4. | ees2-- d-- | ees4 g=' } %
  <d=' bes'>4(\>^\tRit \af 4\! <c=' a'>) |

  d='4--\f^\tATem g-- a8( bes a4) | <c, a'>4( <d bes'>8 <c a'> <bes g'>2) |
  d='4-- g-- a8( bes a='4) |
  \duo {
    a'='8( c bes a g2) |
    {{ template "rh3a" (w `c=''8(->\mf\<`) }} | a='4( fis g2) |
    {{ template "rh3a" (w `c=''8(->\mp\<`) }} |
    a='4(\> fis g) \af 4\! <bes=' d g>4 _-- \fermata \bar "|."
  } {
    d'='8 r d4( g2) | <ees g>2 <d f> | d( g) | <ees g> <d f> | d( g=') \fermata |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \minor
  {{ template "lh1" (w `<g= bes d>8[---\frBass`) }}
  \duo { fis=4 s4 g= s4 | } { fis=8( c' d c) g( d' ees d=') | }
  {{ template "lh1" (w `<g,= bes d>8[--`) }}
  \duo {
    r8 c'='8( a c) g4 s4 | r8 c4 c8 bes( c bes4) |
    r8 fis=8( g c) g4 s4 | r8 c4 c8 bes( c bes4) |
    r8 bes=8( g bes) r bes( f bes=) |
  } { \rep 2 { d=2 g8( d' bes g) | ees2 g4. ees=8 | } | ees=2 d= | }
}
{{ end }}
