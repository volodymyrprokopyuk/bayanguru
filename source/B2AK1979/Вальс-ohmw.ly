{{ define "rh1" }}
  {{ .a }} bes <f a>4)-. 4-. | <f d'>-. <f a>2-> |
  <e=' g>8( a <e g>4)-. 4-. | <g e'>-. <e g>2-> |
  <d=' f>8( g <d f>2) | <bes e>8( f' <bes, e>2) |
  <a= cis>8( e' a g f e=' |
{{ end }}

{{ define "lh1" }}
  {{ .a }} dm | d( dm) dm |
  cis=4( a@M!) aM4 | cis( a@M) aM4 |
  d=4( dm!) dm | g,( gm!) gm | a=,( a7!) a7 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Tempo di valzer"
  \clef treble
  \key d \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      {{ template "rh1" (w `<f'=' a>8(\mp`) }}
      \alternative {
        \volta 1 { d='8 e f g a='4) | }
        \volta 2 { \hSpace d,='2 \sSlur ub #'((wb . 3.5)) ( r4) | }
      }
    }

    c='8(\mf d c e f g | a2.) | bes8( a g4) a | c2. |
    c,='8( d c e f g | a2.) | bes8( a g4 e | \af 2.\! a2.)\> |
    {{ template "rh1" (w `<f=' a>8(\p`) }} | d4) <d=' f d'>2 \fine |

    \volta 2
    \key d \major
    \repeat volta 2 {
      <fis=' a>2(\mf b4 | <fis a>2.) |
      <g=' a>4( b cis | <g a>2.) |
      <fis=' d'>2( <fis cis'>4 | <g b>2.) |
      <dis=' b'>2( <dis a'>4 | <e g>2.) |
      g='4\( e fis | g <fis a> <g b> |
      <fis=' a>2. | <fis d'>2.\) |
      <g=' e'>2. | <g a>2. | <fis d'>2.~ |
      \alternative {
        \volta 1 { <fis=' d'>4 a g=' | }
        \volta 2 { <fis=' d'>4 \repeatTie a g=' \bar "||" }
      }
    }
    \keyCancelChangeBar
    \key d \minor
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  {{ template "lh1" (w `d=4(-\stBass dm!)`) }} | d( dm!) dm |
  \duo { r4 dm! } { d=2 } r4 |

  g,=,4 c@7! c74 | f fM! fM |
  c'=4 c7! c7 | f, fM! fM |
  g=,4 c@7! c74 | f fM! fM |
  g=,4 gm! gm | a a7! a7 |
  {{ template "lh1" (w `d=4( dm!)`) }} | d=4 dm!2 |

  \key d \major
  d=4 dM! dM | a d@M dM4 |
  a=,4 aM! aM | cis a@M aM4 |
  d=4 dM! dM | g, gM! gM |
  b=,4 b7! b7 | e em! em |
  cis=4 a@7! a74 | a a7 a7 |
  d=4 dM! dM | b d@M dM4 |
  g=,4 gM! gM | a a7! a7 |
  d=4 dM! dM | d r r | d= r r |
  \key d \minor
}
{{ end }}
