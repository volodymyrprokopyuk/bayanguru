{{ define "rh1" }}
  {{ .a }} b' a g) <c, a'>8( e) <b g'>16( f' e d) <c e>4 |
  d=''16(^\tLarg c b a=') %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 4/4
  {{ template "rh1" (w `<e''='' c'>16(\p`) }}
  \duo { e''=''2 } { c''=''8(-. <b d>)-. a='4 } <c='' a'>4 \fermata |

  a='8(\mf^\tATem gis e gis) a( b c e) | dis( b dis fis e2) |
  d=''8( c b a) b( c d e) | c( a gis4) e2 |
  a='8(\mf^\tATem gis e gis) a( b c e) | <b g'>8( f' e d <c e>2) |
  d=''8( c b a) c( b a e) | b'( a gis4) \af 2\! <c,=' a'>2\> |

  {{ template "rh1" (w `<e'='' c'>16(\p`) }}
  c=''8(-. d)-. <c, a'>4 <c'='' a'>8-.\pp r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  <a= e'>2-\frBass f'8( g) a16( e a,8) | <d=' fis>4 \clef bass %
  <f,= a>8(-. <e gis  d'>)-. a,16( e' a c) <a= e'>4 \fermata |

  <a= c e>8 r <a b d> r <a c e> r <a c f> r |
  <a= c fis>4. <a c dis>8 <a c e>8-. 8-. <a d>-. <a c>-. |
  <f= a d>4. <f a c>8 <f a b>2 |
  <f= a e'>8 r <f a dis>( c') <e, gis d'>( c' b e,) |
  a,=,16( e' a8) e16( gis b8) a,16( e' a8) e16( a c8) |
  g,=,16( d' g8) f16( b d8) c,( e g c) | <f, a d>4. <f a b>8 <e a c>2 |
  <d= f>8( a') <e gis d'>16( c' b8) a( e c b=,) |

  a=,8( e'16 a) c,16( e a8) g,( d'16 g) c,( e g c) |
  <d,= fis a>4 <f a>8(-. <e gis d'>)-. a,16( e' a c) <a= e'>8-. r |
}
{{ end }}
