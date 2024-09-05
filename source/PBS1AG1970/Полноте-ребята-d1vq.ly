{{ define "lh1" }}
  {{ .a }} fM! d' f@M! | g,8 g7! c cM! | f, fM! a=, f@M! |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key a \minor
  \time 2/4
  a''=''8-.\mf\< a-. a16( g f \af 16\! e) | g8.(\> f16) e8 \af 8\! c |
  a'=''8\< a16( b) c8 b16( \af 16\! a) |  g8.(\> f16) e8 \af 8\! e |
  \duo {
    e''=''8-.\p e-. d( c16 d) | e8-.\< e-. d( c16 \af 16\! d) |
    e=''8-. e-. g( e16 g='') |
  } { r4 b'='8 b | a( g16 a) f4 | a16( b c8) b='4 | }
  <a,=' a'>8-.\> 8-. \af 4\! 4-- |

  a'=''16\mf b c b c8 b16 a | g a g f e c d e |
  f=''16 g a b c d c a | g f e d e f e8~ |
  e=''16 a e c d c b a~ | a b c a d e f g |
  a=''16 b c d e^\tRit f e d | a8-. <b, g' a>-. <c='' e a>4-- \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `f,=,8-\stBass`) }} | b=,8 g@7! c8 cM! |
  \rep 2 { a=,8 am! d@m!4 | } | f8 a@m! e'8 em! | a,=, am! am4 |

  {{ template "lh1" (w `f=,8`) }} | b=,8 g@7! c8 b |
  a=,8 am! f d@m! | e'8 a@m! d8 dm! | f, a@m! e'8 em! | a,-. a-. a=,4-- |
}
{{ end }}
