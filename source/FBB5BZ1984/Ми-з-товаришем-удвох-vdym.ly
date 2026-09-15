{{ define "rh1" }}
  \acc { {{ .a }} } d=''4(\mf g,) | \acc { b='8 } a4( e=') |
{{ end }}

{{ define "rh2" }}
  \acc { cis'='''8 } d='''4(\p g,) | \acc { b=''8 } a4( e='') |
{{ end }}

{{ define "rh3" }}
  d=''16(\< e fis g a fis g \af 16\! a | b8) g-. d=''4-> |
{{ end }}

{{ define "rh4" }}
  d='16(\< e fis g a d, e \af 16\! fis | g8) b-. g='4-> |
{{ end }}

{{ define "rh5" }}
  \acc { cis=''8 } d=''8->\f <d b'>-. <d ais'>-. <d b'>-. |
  \acc { fis=''8 } <cis='' e>8-> <cis b'>-. <cis ais'>-. <cis='' b'>-. |
{{ end }}

{{ define "rh6" }}
  {{ .a }} g16 g g8 r | <c e g>8-> a16 a a8 r |
  <fis=' a d>8-> d16 d d8 d=' |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Allegretto
  \clef treble
  \key g \major
  \time 2/4
  {{ template "rh6" (w `<c''='' e>8->\f`) }} | \af 2\! d='2\> \fermata |

  {{ template "rh1" (w `cis'=''8`) }}
  d='16(\< e fis g a fis g \af 16\! a | b8) g-. d4-> |
  {{ template "rh1" (w `cis'=''8`) }} {{ template "rh4" }}

  {{ template "rh2" }} {{ template "rh3" }}
  {{ template "rh2" }}
  d=''16(\< e fis g a d, e \af 16\! fis | g8) b-. g=''4-> |

  \repeat volta 2 {
    b,='16(\mf c b c b8) <b g'> |
    \duo {
      g''=''8( fis cis4) | c16( d c d c8) fis |
      <b,=' fis'>8( e b4) | e8.( fis16 g8 fis16 e='') |
    } { ais'='2 | a4.-- a8 | g2 | c4~ c=''8 r | }
    \alternative {
      \volta 1 {
        \duo { d''=''2 | c8.( d16 e8 d16 c='') | }
        { b'='4( g) | g( fis='8) r | }
        <a=' b>4-- <b=' dis b'>8-> r |
      }
      \volta 2 {
        \duo { g''=''4( d) | e4-- b8-. a='-. | }
        { b'='2 | d8.( c16) s4 | }
        e=''8-. r <g,=' b e>-> r |
      }
    }
  }

  {{ template "rh2" }} {{ template "rh3" }}
  {{ template "rh1" (w `cis=''8`) }} {{ template "rh4" }}

  {{ template "rh5" }} {{ template "rh3" }}
  {{ template "rh5" }} | a'=''16(\< g fis e d c b \af 16\! a |
  g='8) b-. g='4-> |

  {{ template "rh6" (w `<c='' e>8->\f`) }} | g r <g=' b g'>-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  c+cM!8->-\stBass r8 r4 | a+c@M!8-> r8 r4 | d+d7!8-> r8 r4 | R2 \fermata |
}
{{ end }}
