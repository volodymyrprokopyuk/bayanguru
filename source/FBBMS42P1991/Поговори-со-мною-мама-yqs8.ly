{{ define "rh1a" }}
  r8 {{ .a }} f e g f f e | d( c) bes=2. |
{{ end }}

{{ define "rh2" }}
  <a=' c>4(~ \tuplet 3/2 { 8 <bes d> <a c> } <g bes>2) |
  r8 \duo { <g'=' bes>8 <a c> <g bes>8 <g bes>8 <f a> g bes=' | }
  { s4. s4 e'='4 | } | <f=' a>2( <fis=' c'>) |
  r8 \duo {
    d'='8( <e c'> <d bes'> <c a'> <bes g'> f' e) | f( e d2.) |
    bes'='8 \rest <g bes>( <d a'> <bes g'> f' e cis e=') |
  } { s4. s4 bes=4 | g d'8( c bes=2) | s2 a= | }
{{ end }}

{{ define "lh1" }}
  {{ .a }} d' bes' d,) | c( g' c g=) | \duo { a=4( c) a( d=') | } { f=2 d= | }
  g,=,4( d' g) a8( g) | bes,4( f') bes( f) | e,( e') a,( g'=) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Tranquillo
  \clef treble
  \key d \minor
  \time 4/4
  r8\p a'='8( f' d a' e f d) | r a( f' d a' e f d) |
  \repeat volta 2 {
    \duo {
      {{ template "rh1a" (w `f'='8`) }} | r8 e='8 e d f e e d |
      r4 a'='8( f b b, g' f) | {{ template "rh1a" (w `f='8`) }}
      r8 f'='8 e d f e e d | a4 a'8( g cis a cis g'='') |
    } { a=1 | e | gis2 a4 cis | d1 | a | e | gis | cis=' | }
    fis=''8 <fis, a>[( <g bes> <a c>] 8 <fis a> <a c> <bes d>) |
    {{ template "rh2" }}

    \alternative {
      \volta 1 {
        \time 3/4
        \meter 1/4 1,1,1
        \duo { d'='2. | } { d'='8^( <a' f'>8) 8^( <bes g'>8) 8^( <a=' f'>) | }
        <cis'='' a'>8( <bes g'>8) 8( <a f'>) <bes g'>( <g e'>) |
        r8 <a=' f'>8 8( <g e'>) <bes g'>( <a f'>) |
        <a=' f'>8( <g e'>8) 8( <f d'>) <g e'>( <e=' cis'>) |
      }
      \volta 2 {
        \time 4/4
        \meter 1/2 1,1
        \duo { d'='1 | } { r8 a'='8( f' d a' e f d='') | }
        r8 <fis=' a>8( <g bes> <a c>8 8 <fis a> <a c> <bes=' d>) |
      }
    }
  }
  {{ template "rh2" }}
  \time 3/4
  \duo { d'='2. | } { r8 <d''=''f>8 <e g>( <f a>8) 8( <e='' g>) | }
  <e'='' g>2~ 8 f( | g f e4.) d8( <a cis>4.) b8( <a cis> d) |
  <f,=' a d>2. \arpeggio \pp \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key d \minor
  d=2.(-\frBass a4) | d2.( a4) | d,2 a'4( d) | g,2 d'4( g) |
  e,=,4( bes') a( g') | d,( a') g( d') | d,2 a'4( d) | g,2 d'4( g) |
  e,=,4( bes') e( e,) | a2 e'4( a,) | d,( d' fis c') |
  {{ template "lh1" (w `g,=,4(`) }}
  d,=,2( a'4) | a,2( e'4) | d2( a'4) | a,2( a'4) | d,2 a'4( d) |
  d,=,4( a' fis' a,) | {{ template "lh1" (w `g=,4(`) }}
  d,=,2. \clef treble | r8 g''='8( a bes bes4~ | bes4.) a8( g4~ |
  g='8) f( e4) a,= \clef bass | <d,= bes' d>2. \arpeggio |
}
{{ end }}
