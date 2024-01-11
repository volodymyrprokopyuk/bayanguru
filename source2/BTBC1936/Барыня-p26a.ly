{{ define "rh1" }}
  b='16 c b a g4~ | g8 a16 b=' %
{{ end }}

{{ define "rh2" }}
  {{ .a }} g16( fis) g8 g'16( fis | g8) {{ .b }} e f e d {{ .c }} |
{{ end }}

{{ define "rh3" }}
  {{ .a }} \acc { fis'=''8 } g4-> %
  \duo { \once \stemDown g''=''8~-> | g=''2 | }
  { s8 | fis''=''8 f <g, e'>( c='') | }
  g,='8 \acc { fis'=''8 } g4-> %
  \duo { \once \stemDown g''=''8~-> | g=''2 | }
  { s8 | fis''=''8 f <g,=' c e>4^\accent | }
{{ end }}

{{ define "rh4" }}
  \tuplet 3/2 { {{ .a }} c b } g8~ g) a | b g=' %
{{ end }}

{{ define "rh5" }}
  \duo { \tuplet 3/2 { b'='16(-> c b } g8~ g) a | b g=' } { f'='2-> | f='4 } %
{{ end }}

{{ define "rh6" }}
  g='8 b16( d) d,8 e16( fis) | g8 b16( d) c16( b c a=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} g@7! r8 g7 | g, g7! c cM! | d g@7! r8 g7 | g,=, g7! c+cM!4-> |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegro
  \clef treble
  \key c \major
  \time 2/4
  \acc { fis''=''8 } g4->\f \acc { fis=''8 } g4-> |
  \acc { fis=''8 } g8-> d16( e f e d c) |
  b='8 g16( fis g8) g'16( fis | g8) d16\( e f e d c |
  {{ template "rh1" }} c=''8\) d16\( c | {{ template "rh1" }} <e,=' c'>8\) r |

  \repeat volta 2 {
    {{ template "rh2" (w `b'='8` `d=''16(` `c='')`) }}
    {{ template "rh2" (w `b='8` `d=''16\(` `c=''`) }}
    {{ template "rh1" }} c=''8\) d16\( c | {{ template "rh1" }} <e,=' c'>8\) r |

    {{ template "rh3" (w `g='8`) }} {{ template "rh3" (w `g,='8`) }}

    {{ template "rh4" (w `b,='16(->`) }} <g c>8 8 |
    {{ template "rh4" (w `b='16(->`) }} <g c>4-> |
    {{ template "rh5" }} \duo { c''=''8 c='' | } { g'='8 g=' | }

    \alternative {
      \volta 1 {
        {{ template "rh5" }} \duo { <g'=' c>4-> } { e'='4-> } %
        \rep 3 { {{ template "rh6" }} }
        g='8 b16( d) d,8 e16( fis) | g8 a16( b) <e,=' g c>8 r |
      }
      \volta 2 {
        \duo {
          \tuplet 3/2 { b'='16(-> c b } g8~ g) g'~(-> |
          g=''16 f e d) c=''4 \bar "|."
        } { f'='4.-> g8~-> | g4 c='' | }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key c \major
  \grace { s8 } g,=,8-\stBass g7! r g7 |
  g=,8 g7! c cM! | g g7! r g7 | b g@7! c8 cM! | g g7! r g7 |
  d'=8 g@7! c8 cM! | g g7! r g7 | d' g@7! c=8 r |

  \rep 2 { d=8 g@7! g,8 g7 | d' g@7! c=8 cM! | }
  g=,8 g7! b g@7 | d8 g@7! c8 cM! | g g7! b g@7 | d8 g@7! c=8 r |

  {{ template "lh1" (w `d=8`) }} {{ template "lh1" (w `d'=8`) }}

  \duo {
    r8 g@M![ r8 gM] | r8 g@M![ r8 c@M!] |
    r8 g@M![ r8 gM] | r8 g@M! c@M!4-> |
    r8 g@7![ r8 g7] | r8 g@7![ r8 c@M!] |
    r8 g@7![ r8 g7] | r8 g@7! cM!4-> |
  } { f=2-> | f4 e | f2-> | f4 e-> | d2-> | d4 e | d2-> | d4 c=-> | }

  \rep 3 { g=,8 gM! c d@M! | b8 g@M! a8 d= | }
  g,=,8 gM! c d@M! | b8 g c r |
  \duo { r8 g@7![ r8 g7] } { d=2 } g=,8 g7! c+cM!4 |
}
{{ end }}
