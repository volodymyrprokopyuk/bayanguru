{{ define "rh1" }}
  {{ .a }} | 1 | 1 | <b d fis>2 <b=' cis a'> |
{{ end }}

{{ define "lh1a" }}
  {{ .a }} | 1 | <e=' g>1 | 2 2 |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key d \major
  \time 4/4
  {{ template "rh1" (w `<b'=' d>1\pp`) }}
  {{ template "rh1" (w `<b=' d>1`) }}

  \repeat volta 2 {
    a='4.\( fis8 a4. fis8 | a4 a g fis | e fis a2\) |
    <b=' e>8(\pp <d fis> <b e> <d fis>) <e a>8-. 8-. 4-- |
    a,='4.\(\mp  e8 a4. e8 | a4 g fis e | d fis a2\) |
    <a=' d>8-.\pp <b e>-. <cis fis>-. <d g>-. <e a>4-- r |
    a,='4.( a8 b4 a | d d b a) | d,( d g a | b b a g) |
    fis='4( fis g fis=') | \duo { a'='2. r4 | } { r2 d'='8( fis a b=') | }
    g='2( e | d8) a'[( b cis] d e fis g='') |

    <d='' fis a>4.\(\mf <d fis>8 <cis fis a>4. <cis fis>8 |
    <b=' fis' a>4 4 <b e g> <a d fis> | <g b e> <b d fis> <cis e a>2\) |
    e,='8( fis e fis) a-. a'-. a'4-. |
    <d,,='' e a>4.\( <b d e>8 <cis e a>4. <b e>8 |
    <d='' e a>4 <b d g> <a cis fis> <g b e> |
    <fis=' a d>4 <a d fis> <cis fis a>2\) |
    d,='8(\< e fis b a b d \af 8\! fis) |
    <c='' e a>4(\mf 4 <d fis b> <c e a> |
    <fis='' a d>4 4 <d fis b> <c e a>) |
    <g=' b d>4( 4 <b d g> <b d a'> | <d g b>4 4 <b d a'> <b d g>) |
    <a=' cis fis>4( 4 <a cis g'> <a cis fis> | <a d fis a>1) |
    <b=' d g>2( <g=' b cis e>) |
    \alternative {
      \volta 1 { \duo { <fis'=' a d>2. } { r4 b=8 a= r4 } r4 | }
      \volta 2 {
        \hSpace <fis=' a d>4 \sSlur nb #'() ( <a a'>8)-. <b b'>-. %
        <fis'='' a d>4-- r4 \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key d \major
  \duo {
    {{ template "lh1a" (w `<fis'=' a>1-\frBass`) }}
    {{ template "lh1a" (w `<fis=' a>1`) }}
  } { \rep 2 { \rep 3 { r2. a=4 | } | \rep 2 { r4 a=4 } | } \clef bass | }

  d=4 <fis a  d>4 a, <fis' a cis> | d <fis a b> a, <fis' a b> |
  e=4 <g b> a, <g' a cis> | \rep 3 { e=4 <g b d> a, <g'= a cis> | }
  \rep 2 { d=4 <fis a b> a, <fis'= a cis> | }
  d=4 <fis c'> d <fis c'> | d <fis c'> g( fis) |
  g,=,4 <g' b>2 4 | e4 <g= b d>2 4 |
  \duo { r4 <a= cis>4 r4 4 | } { fis=1 | }
  b,=,8( fis' a b=) r2 | \duo { r4 <g= b d>4 r <g= b cis> | } { e=2 a,=, | }
  <d,= fis a>2. r4 |

  d=4 <fis a d> a, <fis' a cis> | d <a' d> a, <fis' a d> |
  e=4 <g b d> a, <g' a cis> | e <g b d> a, <g' a cis> |
  e=4 <g b d> a, <g' a cis> | fis <g b d> a, <g' a cis> |
  d=4 <fis a d> a, <fis' a cis> | d <a' b d> a, <a' b d> |
  d,=4 <fis c'>2 4 | d <fis c'>4 a, <fis' c'> | g, <d' g b>2 4 |
  e=4 <g b>2 4 | fis,-. cis'-. a'-. cis-. |
  b,=,8-. fis'-. a-. b=-. \clef treble d='8-. fis-. a-. b='-. \clef bass |
  e,,=4 <g b d> a, <g' a cis> | <d a' b>2 fis8 d b a |
  <d= a' b>2 <d= fis a>4-- r |
}
{{ end }}
