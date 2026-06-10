{{ define "rightHand" }}
\relative {
  \tempo "Andante sostenuno"
  \clef treble
  \key e \minor
  \time 2/4
  \partial 8 { b''=''8(\fp | }
  c='''4) <a, b dis>4( | <g=' b e>) \af 8\fp r |
  r4 \duo { fis'='4(-> | e=') \fermata } { c'='8.( b16)~ | b=4 } r8 b(\fp |
  \repeat volta 2 {
    c=''4) dis,( | e <dis fis> | <b= e g>) %
    \duo { b'='8(-> a) | <e g>4( <dis=' fis>8) } %
    { <c'=' e fis>4 | b~ b=8 } r8\fp |
    r4 <c=' fis a>4( | <b= e g>8) %
    \duo {
      a'='8[(\> b \af 8\! c]) | b8.( a16 g8. a16) | <g b>4( g8) \noBeam c(\fp |
      b='4 a | g4.) e'8( | d4 c | b2) | b~( | b~ | b4~ b8 c='') |
    } {
      <e'=' g>4. | <c fis>2 | b4~ b8 s8 | g'2~ | g~ | g4. fis8 |
      g='4. g8 | fis4 e | dis <e g> | <dis a'> <e=' g> |
    }
    <fis'=' b>8^\tRit <cis fis ais> <dis fis b> \fermata \noBeam b'8(\pp^\tATem |
    c=''4) dis,( | e) fis( | g=') %
    \trio {
      b'='8(-> a) | b2( | a4) b8( c) | b2~ | b~ | b='4 \fermata %
    } {
      <c'=' e fis>4-> | <b e g> <f' gis>( | e2) | e4( <dis fis>8 <e=' g>) |
      fis='4.( e8) | <dis=' fis>4 \fermata %
    } { s4 | \rep 3 { s2 | } | a'='4 g=' | s4 } %
    b='8( dis | e4.\ppp b'8 |
    \alternative {
      \volta 1 { e='''4) \fermata r8 b,='8 \sSlur nf #'() ( | }
      \volta 2 {
        \hSpace e'='''4) \sSlur nb #'((wb . 6)) ( \fermata r) \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key e \minor
  \partial 8 { r8 | } | r4 <b= fis'>4(-\frBass | e) r8 b( | c4) <dis, a'>(-> |
  <e= g>4) \fermata r | r4 <a c> |
  \duo { b=2~ | b4 s4 | } { g=4 fis( | e) a,=,-> | }
  b,=,4~ b8 \noBeam b'( | c4) dis,( | e8) c[( b a]) | <d, d'^~>2 |
  <g=, d'>4~ 8 \noBeam e'' |
  d='4( c | b g8) a( | b4 a | g e) | d c= |
  \duo { b,=,4 b'8( g | fis4 e) | dis8 fis fis= \fermata } %
  { b,=,2~ | b~ | b8 fis b=, } r8 | r4 r8 b'=8( | c4) dis,( | e a,)-> |
  e=,4 d''~(-> | d8 c b a=) |
  \duo { a=8( g fis e) | dis4( e8 g | b=4) \fermata } %
  { b,=,2~ | b~ | b=,4 \fermata } <b= fis' a>4( | <e=' g>2~ |
  <e=' g>4) \fermata r4 | 4 \sSlur nb #'((wb . 6)) ( \fermata r) |
}
{{ end }}
