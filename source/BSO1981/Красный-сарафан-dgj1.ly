{{ define "t4" }}
  \tuplet 3/2 { {{ .a }} } \tuplet 3/2 { {{ .b }} } %
  \tuplet 3/2 { {{ .c }} } \tuplet 3/2 { {{ .d }} } |
{{ end }}

{{ define "rh1" }}
  {{ .a }} 8 <c fis b> <c fis a> | <b= d g>4 %
{{ end }}

{{ define "rh2" }}
  {{ .a }} 8 <d fis b> <d fis c'>) |
  <g=' b e>8( <g b d>) <c, e c'>( <c e a>) |
  <b= d>8 <d b'> <c e b'>8. <c=' fis a>16 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro moderato"
  \clef treble
  \key g \major
  \time 2/4
  <b= d>8(\p <d b'> <cis b'> <c a'>) |
  \duo { g'='8 fis16 e d8 e16 fis=' | } { b=4 c=' | }
  <b= g'>8( <d b'> <e c'> <d b'>) | <c a'>4( <c e>) |
  <c=' e>8( <e c'> <dis c'> <d b'>) |
  \duo { b'='8( a g e | <b d> <b g'> <c a'> <d fis b> | <b= d g>4) } %
  { <c'=' e>4 bes= | s2 | s4 } r4 |

  <g=' b g'>8( 8 <g b fis'> <g b e> | <d' a' d>4 <c a' c>8 8) |
  <b=' dis fis>8 8 <b dis b'>8. <a dis a'>16 | <a e' a>4( <g e' g>) |
  <b=' e b'>8 8 <b e a> <b e g> | <a c g'>4 <a c fis>8 8 |
  <g=' b>8 <g b e> <b dis g>8. <a b fis'>16 | <g=' b e>4. r8 |

  \duo {
    \mergeDifferentlyDottedOn
    g''=''8(\pp g fis e | d'4 c8 c) | fis,\( fis b8. * 10/9 a16 * 6/9 |
    a=''4 g | b8 b a g | g4 fis8 fis\) |
    b,='8 b'='' \ottava #1 g'='''8. * 10/9 fis16 * 6/9 | e='''4 s8 \ottava #0 %
  } {
    \meter Voice 1/8 1,1,1,1
    {{ template "t4" (w `g''=''16 b, g` `g' b, g` `fis' b, g` `e' b g`) }}
    \omit TupletNumber
    {{ template "t4" (w `d''='''16 a fis` `c fis a` `c a fis` `c' e, c`) }}
    {{ template "t4" (w `fis=''16 dis b` `fis' b, dis` `b' fis dis` `b dis a'`) }}
    {{ template "t4" (w `a=''16 e c` `g c e` `g e c` `g c e`) }}
    {{ template "t4" (w `b'=''16 e, b` `b' e, b` `a' e b` `g' e b`) }}
    {{ template "t4" (w `g'=''16 e c` `a c e` `fis c a` `fis' e c`) }}
    {{ template "t4" (w `b='16 e g` `b dis e='''` `\ottava #1 g=''' a, b` `dis b fis'`) }}
    \tuplet 3/2 { e='''16 g, b } \tuplet 3/2 { e g b } e=''''8 \ottava #0 %
  } r8 |

  {{ template "rh1" (w `<c,=' fis a>8\p`) }} <b d>8 8 |
  {{ template "rh1" (w `<c=' fis a>8`) }} r4 |
  <b= fis' a>8 <a' c> <b, g' b> <b fis' a> |
  \duo { <fis'=' a>8( <e g>) g( fis=') | } { b=4 <a= c> | }
  <g= b>8 <g b e> <b dis g>8. <a b fis'>16 | <g= b e>4 r |
  {{ template "rh2" (w `<d'=' fis a>8(`) }} <b= d g>4 r |

  \duo { b'='8( c b a) | <e g>( a16 g fis8 e) | b'( c b a) | <b,= e g>2 | }
  { <dis'=' fis>2 | b | <dis=' fis> | s2 | }
  {{ template "rh2" (w `<d=' fis a>8(`) }} <b= d g>4. r8 |
  <b'=' d>8\(\p <d b'> <cis b'> <c a'> |
  \duo { g''=''8 fis16 e d8 e16 fis='' | } { b'='4 c='' | }
  <b=' g'>8 <d b'> <e c'> <d b'> | <c a'>4 <c e>\) |
  <c='' e>8( <e c'> <dis c'> <d b'> | <c e b'> a' <bes, g'> e) |
  <b=' d>8( <d g> <c a'>8.^\tRit <d fis b>16 | <b=' d g>4.) r8 \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8(-\stBass d' e fis) | g, gM! d' d7! | g, gM! gis e@7! | a8 am! e' a@m! |
  a,=,8( e fis gis) | a am! cis cisd! | d g@M! d8 d7! | g, d' g,=,4 |

  e'=16 em! em em e em em em | a, am! am am a am am am |
  b=,16 b7! b7 b7 b b7 b7 b7 | c cM! cM cM c cM cM cM |
  g=,16[ e@m! em16 em] e' em em em | a, am! am am a am am am |
  b=,16[ e@m! em16 em] b b7! b7 b7 | e8 b=, e+em!8 r |

  e=8 em! g, e@m | a8[ am! am am] | b[ b7! b7 b7] | c[ cM! cM cM] |
  g=,8 e@m! e'8 em | a,[ am! am am] | b e@m! b8 b7! | e=[ em! em em] |

  \rep 2 { d=8 d7! fis, d@7 | g8 gM! d'= g@M | }
  dis=8 b cis dis | e em! a, am! | b e@m! b8 b7! | e b e, g |
  d'=8 c b a | g gM! a am! | d g@M! d8 d7! | g, d' g,=,4 |

  b=,16 b7! b7 b7 dis[ b@7 b716 b7] | e em! em em b[ e@m em16 em] |
  b=,16 b7! b7 b7 dis[ b@7 b716 b7] | e8 b e, g | d' c b a |
  g=,8 gM! a am! | d g@M! d8 d7! | g, d' g,=, r |
  g=,8 d e fis | g gM! d' d7! | g, gM! gis e@7! | a8 am! e' a@m |
  a,=,8 e fis gis | a am! cis cisd! | d g@M! d8 d7! | g, d' g,=, r |
}
{{ end }}
