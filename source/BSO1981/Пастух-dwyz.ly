{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key g \major
  \time 2/4
  r8\mf <d'=' g>8 r <fis a> | r\> <d g> r <fis a> | g\p g a4 |
  b='8 d4-> c8 | b4 a | g4~ g16 a b cis | <a d>8\mf 8 <a e'>4 |
  \duo { fis''=''8 a4-> g=''8 } { a'='8[ d c b='] | }
  <a=' fis'>4 <g e'> | \duo { d''=''2_\dCre | } { fis'='8[ a b c=''] | }

  \repeat volta 2 {
    \duo { g''=''8\f b4-> a8 | g4(\> \af 4\! fis='') | } { b'='8 b4. | c=''2  | }
    <c='' e>8 4-> <b d>8 | <a c>4(\> \af 4\! <g b>) | <e a>8 8 <e b'>4 |
    <e=' d'>8 4-> <e c'>8 |
    \alternative {
      \volta 1 { <g=' b>4\> \af 4\! <fis a> | g='2\mf | }
      \volta 2 { <g=' b>8 r <fis a> r | g='4 r \bar "|." }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key g \major
  g,=,8-\stBass gM! d' dM! | \rep 2 { g,=,8 gM! d' dM! | }
  g,=,8 gM! c a@m! | d8 g@M! d8 d7! | g, gM! g r |
  fis=,8 d@M! cis'8 a@M! | d8 dM! dis e | a, aM! a a7! | d=8 dM!4 d7!8 |

  g,=,8 gM!4 gM8 | a8 am!4 d@7!8 | d8 d7!4 d78 | g, d@M! g8 gM! |
  c=8 a@m! gis8 e@M! | a8 am! c a@m! | d=8 g@M! d8 d7! |
  \duo { r8 gM!4 gM8 | } { g,=,2 | } | d+g@M!8 r8 d+d7! r | g+gM!4 r |
}
{{ end }}
