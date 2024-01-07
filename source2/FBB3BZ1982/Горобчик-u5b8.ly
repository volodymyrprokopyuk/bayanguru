{{ define "rh1" }}
  {{ .a }} e r4 f8-> d r4 | f8-> d r4 e8-> c r4 |
  e=''8\pp c g'[\< e] f g a \af 8\! f | e c d[\> b] c d e \af 8\! f='' |
{{ end }}

{{ define "lh1" }}
  r4 {{ .a }} e r4 f8 d | r4 f8 d r4 e8 c | r4 e8 c d2( | g, c='8) r r4 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegretto scherzoso"
  \clef treble
  \key c \major
  \time 4/4
  {{ template "rh1" (w `g''=''8->\mf`) }}
  g=''8\mf e r4 f8 d r4 | f8 d r4 e8 c r4 |
  e=''8\pp c g'[\< e] a f b[ g] | c a d[ \af 8\! b] e d c b='' |

  e='''4.(\mf \startTrillSpan \af 16\stopTrillSpan dis8 e) d c b |
  e='''4.(\mp \startTrillSpan \af 16\stopTrillSpan dis16[ e] f8) e d c |
  d='''8 c bes a g[ f e dis] |
  \time 6/4 e=''2( \startTrillSpan \acc { dis=''16 e } \af 16\stopTrillSpan %
  f=''8[) e\> d c] b a gis \af 8\! f=' |
  \time 4/4 r8 e='8 e' e, r e' e'^\tRit e, |
  r8 \ottava #1 e'=''' e' e, \ottava #0 r e, e' f,='' |

  {{ template "rh1" (w `g=''8->^\tATem`) }}
  g=''8 e g'16( e c g f8) d-. f'16( d b g |
  f=''8) d-. b'16( g f d e8) c-. g'16( e c g |
  a='8) f-. c'16( b a aes g8) e'-. d16( c b a |
  g='8) d'-. g16( f e d c8[) aes']-. \slashedGrace { b=''8( }
  <e,='' c')>8 r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  {{ template "lh1" (w `g'='8-\frBass`) }}
  r4 g'='8-> e r4 f8-> d | r4 f8-> d r4 e8-> c | r4 e'8 c f d g[ e] |
  a=''8 fis b[ g] gis=''4 r |

  \rep 2 { c,=''8( b bes a <gis=' b>4) r | }
  <g=' bes>8 r r <fis a> r r <f aes> r |
  \time 6/4 e='2( f8) r d r b r gis r |
  \time 4/4 e=8 r r4 e'8 r r4 | e'8 r r4 e,='8 r r4 |

  {{ template "lh1" (w `g='8`) }}
  e='8 c g4( d'8) b g4 | b8 g f4( c'8) g e4( | f) f16( g a b c4) c16( d e f |
  g='4) g16( gis a b c4) <c,=' gis' c>8 r |
}
{{ end }}
