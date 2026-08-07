{{ define "lh1" }}
  \rep {{ .a }} { g='8( <b d>8) 8 | g( <c='' e>8) 8 | }
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key c \major
  \time 3/8
  \repeat volta 2 {
    <c''='' g'>8(_\markup \dAlt p pp f) e | <b d>( e) f |
    <g,=' e'>8( f') g | <b, d>4. | <c g'>8( f) e |
    <b=' d>8( e) f | <g, e'>( f') <b, d> | c=''4. |
  }

  \repeat volta 2 {
    \ottava #1
    r8\p <a'='' b f'>8 8 | r <g c e>8 8 | r <f b d>8 8 | r8 <e g c>8 8 |
    r8\pp <a='' b f'>8 8 | r \acc { f'='''8 } <g, c e>8 8 |
    r8 \acc { e'='''8 } <f,='' b d>8 8 | <e='' g c>4. |
    \ottava #0
  }

  \repeat volta 2 {
    \ottava #1
    g=''16(_\markup \dAlt mf p f' d b g b | c d e f g e) |
    e='''16( f d b g b | c d e c b a) | g( f' d b g b | c d e f g e) |
    e='''16( f d b g b | c='''4) r8 |
    \ottava #0
  }

  \repeat volta 2 {
    <c,='' g'>8(_\markup \dAlt p pp f) e | <b d>( e) f |
    <g,=' e'>8( f') g | <b, d>4. | <c g'>8( f) e | <b d>( e) f |
    <g,=' e'>8( f') <b, d> | c=''4. |
  }

  \repeat volta 2 {
    \ottava #1
    <a'='' b d f>4.\p | <g c e> | <f b d> | <e g c> |
    <f='' a d>8 <g cis e> <a d f> | \acc { f'='''8 } <g, c e>4. |
    <f='' b d>4. | <e='' g c>4. |
    \ottava #0
  }

  \repeat volta 2 {
    <g,=' c e g>8(_\markup \dAlt mf p <d' f>) \arpeggio <c e> |
    <b=' d>8( <c e>) <d f> | <c e>( <d f>) <e g> | <b d>4. |
    <g=' c e g>8( <d' f>) \arpeggio <c e> |
    <b=' d>8( <c e>) <d f> | <c e>( <d f>) <f, b d> | <e=' g c>4. |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key c \major
  e''=''8(-\frBass d) c | g( c) d | c( d) e | g,4. | e'8( d) c |
  g='8( c) d | c( d) g, | c=''4. |

  {{ template "lh1" (w `3`) }} | g='8( <b d>8) 8 | <g=' c>4. |
  {{ template "lh1" (w `3`) }} | g='8( <b d>8) 8 | g <c='' e> r |

  e=''8( d) c | g( c) d | c( d) e | g,4. | e'8( d) c |
  g='8( c) d | c( d) g, | c=''4. |

  {{ template "lh1" (w `2`) }} | d,='8 <a' cis> <a d> |
  g='8 <c e>8 8 | g <b d>8 8 | <c,=' g' c>4. |

  <c=' e>8 r r | <g d'> r r | <c e> r r | <g d'>4. |
  <c=' e>8 r r | <g d'> r r | <c e> r <g d'> | c='4. |
}
{{ end }}
