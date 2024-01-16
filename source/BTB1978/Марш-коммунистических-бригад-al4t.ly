{{ define "rh1" }}
  \duo { g''=''4\f fis e d | } { b'='2 g | } <b d>4 <a=' c> r %
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key e \minor
  \time 4/4
  \repeat volta 2 {
    <g'=' b e>4\f b <b, e g> e | <e a c>2 <c e a> |
    <fis=' c' d>4 4 4 <fis c' e> | <g b>1 |
    <b=' e g>4 e <e, g b> g | <e fis>2 <e c'> |
    <g=' b>4 4 4 <a fis'> | <g b e>2~ 8 r16 d\mf g8.\< a='16 |

    \af 4\! <g=' b>4 d' <g, b> g |
    <fis=' a>4\> d~ \af 8\! d8 r16 a'\< a8. \af 16\! b16 |
    \duo { c''=''4 e e fis | } { a'='2 ais=' | } b2~ b8\< d d \af 8\! d |
    {{ template "rh1" }} e'=''8. e16 |
    <d='' fis>2~ 8 <c e> <b d>8. <a c>16 |
    \af 2\! <g=' b>2~\> 8 d'\< d \af 8\! d |
    {{ template "rh1" }} fis'=''8. e16 | <b e g>4 4 r <a b fis'>8. 16 |
    \alternative {
      \volta 1 { <g=' b e>4 <e e'>8. 16 4 r | }
      \volta 2 {
        <g=' b e>4 <e e'>8. 16 4 8. 16 |
        <e=' g b e>2 <e'='' g b e>8 r r4 \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  e+em!4-\stBass e+em e+em e+em | a+am! a+am a+am a+am |
  d+d7!4 d+d7 d+d7 d+d7 | g+gM! g+gM b+b7! b+b7 |
  e+em!4 e+em e+em e+em | c+a@m! c+am4 a+am! a+am |
  b+e@m!4 b+em4 b+em b+b7! | e+em!4 e+em e+em d= |

  g+gM!4 d+g@M4 g+gM4 d+g@M | a+d@7!4 d+d78. d+d716 d+d74 r |
  a+am!4 e+a@m cis+fis@7!4 fis+fis74 | b+b7! b+b7 b+b7 d+d7! |
  g,=,4 b c e | a, e' c a | d+d7! a+d@7 d+d74 d+d7 | g+gM! g+gM g+gM d+d7! |
  g=,4 b c e | a, am! fis fis7! | b+e@m! b+em4 b4 b7! |
  e+em!4 e+em e+em r | e+em!4 e+em c a@m! | e+em!2 e+em8 r r4 |
}
{{ end }}
