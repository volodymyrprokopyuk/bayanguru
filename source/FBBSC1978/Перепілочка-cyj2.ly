{{ define "rh1" }}
  {{ .a }} d g \af 8\! bes | a4\> \af 4\! g) |
  a='8(\< bes a \af 8\! a | \af 2\! g='2)\> |
{{ end }}

{{ define "rh2a" }}
  {{ .a }} d( g bes | a4) g8 g | a(\< bes) \af 4\! a4 | g=''2 |
{{ end }}

{{ define "rh2b" }}
  r8 {{ .a }} d4( | cis2) | c='' |
{{ end }}

{{ define "rh3a" }}
  \rep 2 { a=''4-> g8-- g=''-- | } a( bes) a=''4-- |
{{ end }}

{{ define "lh1" }}
  r16 {{ .a }} bes g bes ees bes g) | r e'( a, g a e' a, g) |
  r16 ees'=''16( a, g) r d'( a fis=') |
{{ end }}

{{ define "lh2b" }}
  r8 g=,8 r g | r g[ g g] | r g r g=, |
{{ end }}

{{ define "rightHand" }}
\accidentalStyle modern
\relative {
  \tempo Moderato
  \clef treble
  \key g \minor
  \time 2/4
  {{ template "rh1" (w `d'='8(\mf\<`) }}
  {{ template "rh1" (w `d='8(\<`) }}
  a='4(\< g8 g | a4 g8 \af 8\! g) | a(\> bes a4 | g \af 4\! g) |
  a='4( g8 g | a4 g8 g) | a(\< bes a \af 8\! a | g4\> \af 4\! g=') |

  \duo {
    {{ template "rh2a" (w `d''=''8\f`) }}
    {{ template "rh2a" (w `d=''8`) }}
    {{ template "rh3a" }} | g~ g16( d fis g) |
    {{ template "rh3a" }} | g=''2 |

    bes,='8 \rest d,='8 g( bes | a4) g8-- g-- | a( bes a4) | <bes, g'>2 |
    d='4 g8( bes | a4) g8-- g-- | a( bes a4) | <bes, g'>2 |
    \rep 2 { a'='4-- g8-- g='-- | } a( bes <fis a>4) | g~ g8( bes) |
    \rep 2 { \acc { bes='8 } a='4( g8) g=' | }
    a='8( bes) \acc { bes='8 } <fis a>4 | <g,= g'>2 |
  } {
    {{ template "rh2b" (w `d''=''8~`) }} | bes8. r16 r4 |
    {{ template "rh2b" (w `d=''8~`) }} | bes4~ bes16 r r8 |
    \rep 2 { a='2 | a | d4( c) | bes='8. r16 r4 | }

    s4 bes,=8 d | cis2 | c | s2 | r8 bes4 d8 | cis2 | c | s2 |
    <g= cis>2~\f | 2 | c | bes4( <bes d>) | <g cis>2~ | 2 | c | r4 d='4 |
  }

  r8\mf\< <a=' c d>8-- r \af 8\! <bes d g>-- |
  r8\> <c='' d fis>8-- r \af 8\! <bes d g>-- |
  r4\< r8 \af 8\! <c='' d fis a>8-- |
  r8\> <d='' g bes>8[ <bes d g> \af 8\! <g bes d>] |
  r8\p <a=' c d>8[ <bes d g> <d g bes>] | r <g, cis ees a> r <bes d g> |
  r4 r8 <c='' d fis a>8 | r <d g bes>[ <bes d g> <d='' g bes>] |

  \duo {
    a''=''4( g8) g | a4( g8) g, | a( bes a4 | g4.) g8 |
    \acc { bes'=''8 } a=''4( g8) g | a4(^\tRit g8) g, |
    a='8(^\tATem bes a4 | g)\pp \stemDown <bes=' d g> \bar "|."
  } { \rep 2 { <g'=' cis>2~ | 4. g8( | g4) fis=' | s2 | } | }
}
{{ end }}

{{ define "leftHand" }}
\accidentalStyle modern
\relative {
  \clef bass
  \key g \minor
  r8 bes=4(-\frBass g8) | r c4( g8) | r ees'4( g,8) | r d'4( g,8) |
  r8 bes=4( g8) | r cis4( g8) | r e'4( g,8) | r d'4( g,8) |
  \duo {
    r8 e'='4.(~ | e8 ees4.~ | ees8 d~ d4 | bes8) d~ d4 |
    r8 <bes= cis>4( a8) | r <a c>4( g8) |
    r8 fis=8[( c' d]) | r d[ bes( <bes= d>]) |
  } {
    \rep 2 { r8 <g= a>8-. r8 8-. | } r4 <fis a>8 d | g4~ <g bes>8 f |
    e=4. r8 | ees4. r8 | d2 | g= |
  }

  \clef treble
  {{ template "lh1" (w `ees''=''16(`) }} | r d'( g, a g a bes c) |
  {{ template "lh1" (w `ees=''16(`) }} | r d'( g, fis g d' g, f) |
  r16 cis'=''16( g e g cis g e) | r c'( g ees g c g ees) |
  r16 c'=''16( fis, d fis a fis d) | r fis_( g a bes8) r |
  r16 cis=''16( g e cis e g cis) | r c( g ees c ees g c) |
  r16 c=''16( fis, d fis a fis d) | r a'( g d=' \clef bass a= bes a g=) |

  \duo {
    d=2 | e~ | e8 ees~ ees4~ | ees8 d~ d4 |
    r8 f=4.~ | f8 e4.~ | e8 ees~ ees4~ | ees8 d=4. |
  } {
    g,=,8 r g g | {{ template "lh2b" }}
    r8 g=,8 r g | {{ template "lh2b" }}
  }
  \rep 2 { e,=,2( | ees) | d( | <g,=,, g'>) | }

  \rep 2 { d''=4( g8 bes | a4 g) | a8( bes a4 | g=2) | }
  e'='2( | ees) | \duo { d'='2~ | d=' | } { r4. c'='8( | bes a g f=) | }
  e,=2( | ees) | r4 <d a' d>( | <g d'>) <g= d' g> |
}
{{ end }}
