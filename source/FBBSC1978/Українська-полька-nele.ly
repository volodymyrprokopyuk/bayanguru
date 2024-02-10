{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } %
{{ end }}

{{ define "rh1" }}
  {{ .a }} \arpeggio {{ template "t1" (w ` e'16( f e`) }} d8)-. c-. |
  {{ template "t1" (w ` c16( d c`) }} b8) %
  {{ template "t1" (w ` b16( c b`) }} a8) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <a a'>~ 16 g' f e) | <b d>8( <a f'>~ 16 e' d c) |
  <gis=' b>8( <e e'>~ 16 d' c b=') |
{{ end }}

{{ define "lh1" }}
  {{ .a }} <e' a c>8) 8 8] | d( <f a d>8) {{ .b }} |
  e=8( <gis d'>) <e gis d'>4 | a,8( <e' a c>8) {{ .c }} |
{{ end }}

{{ define "lh2" }}
  {{ .a }} <b b'> <c c'> <cis cis'> | <d d'> <e e'> <f f'> <d=, d'> |
{{ end }}

{{ define "lh3" }}
  e=8( <gis d'>) <e gis d'> r | a,8 r {{ .a }} r |
{{ end }}

{{ define "lh4b" }}
  c=8[^( <g' c e>8) 8 8] | d^( <f a d>8) 4 | g8^( <b= f'>8) 4 |
{{ end }}

{{ define "lh5" }}
  {{ .a }} b8 c | d e f4) | e16( gis b d c8) b= |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo "Allegro con moto"
  \clef treble
  \key a \minor
  \time 2/4
  \omit TupletBracket
  \repeat volta 2 {
    {{ template "rh1" (w `<a'=' c e a>8\mf`) }}
    gis='16( b d f e8) b |
    {{ template "t1" (w `d=''16( e d`) }} c8) %
    {{ template "t1" (w `b='16( c b`) }} a8) |
    {{ template "rh1" (w `<a=' c e a>8`) }}
    \alternative {
      \volta 1 { gis='16( b d f e8) b | a16( e c' b a b c e='') | }
      \volta 2 { gis,='16( b d f e8) gis, | a r <a=' c e a> r | }
    }
  }

  {{ template "rh2" (w `<c='' e>8(\f`) }} | c( d c b a b c d) |
  {{ template "rh2" (w `<c='' e>8(`) }} | a( e c' b a b c d='') |

  {{ template "rh2" (w `<c='' e>8(`) }} | c( d c b a b c d) |
  {{ template "rh2" (w `<c='' e>8(`) }} | a8 r <a=' c e a> r |

  \repeat volta 2 {
    e'=''16(\f f_\aDol dis e e\< a b \af 16\! c) |
    {{ template "t1" (w `c='''16( d c`) }} b8) %
    {{ template "t1" (w `b=''16(\> c b`) }} \af 8\! a8) |
    \alternative {
      \volta 1 {
        e=''16(\< fis \af 16\! gis a b e, b' c) |
        {{ template "t1" (w `b=''16( c b`) }} a8) <a,=' c e a> \arpeggio r |
      }
      \volta 2 {
        e'=''16(\< fis \af 16\! gis a b e, c' b | a8) r <a,=' c e a>-> r |
      }
    }
  }

  \repeat volta 2 {
    e'=''16(\p f e dis) e8( a) |
    \duo { c'''='''8( b) b( a) | e16( fis gis a) b8( c=''') | }
    { <d''='' f>8 b \rest <d f> b \rest | r4 <d='' e>8 b \rest | }
    \alternative {
      \volta 1 {
        \duo { b''=''8( a) a='' } { <c''='' e>8 b \rest <c='' e> } r |
      }
      \volta 2 {
        \duo { a''=''8 b, \rest \grace { e=''16_( fis gis } a=''8) b, \rest | }
        { <c''='' e>8 s8 a'=''8 s8 | }
      }
    }
  }

  \repeat volta 2 {
    <c,='' e g c>8_\markup \dAlt f p \arpeggio %
    {{ template "t1" (w `g'=''16( a g`) }} f8)-. e-. |
    {{ template "t1" (w `e=''16( f e`) }} d8) %
    {{ template "t1" (w `d=''16( e d`) }} c8) |
    b='16( d f a g8) b, |
    {{ template "t1" (w `d=''16( e d`) }} c8) c16( d e g |
    c='''8)_\dCre {{ template "t1" (w `g=''16( a g`) }} f8)-. e-. |
    {{ template "t1" (w `e=''16( f e`) }} d8) d16( c b a) |
    g='16( a b c) d8( b) |
    \alternative {
      \volta 1 { {{ template "t1" (w `d=''16( e d`) }} c8) c='' r | }
      \volta 2 { <e,=' g c>8[-> d'-> <gis, b e>-> gis'='']-> | }
    }
  }

  {{ template "rh1" (w `<a,=' c e a>8\f`) }}
  gis='16( b d f e8) d |
  {{ template "t1" (w `d=''16( e d`) }} c8) %
  {{ template "t1" (w `b='16( c b`) }} a8) |
  {{ template "rh1" (w `<a,= c e a>8`) }}
  gis=16( b d f e8) gis, | a-.\< \af 16.\! e'-. a-.\> \af 8\! e'=''-. |

  {{ template "rh1" (w `<a,=' c e a>8\p`) }}
  gis='16(_\dCre b d f e8) b |
  {{ template "t1" (w `d=''16( e d`) }} c8) %
  {{ template "t1" (w `b='16( c b`) }} a8) |
  {{ template "rh1" (w `<a,= c e a>8\f`) }}
  gis=16( b d f e8) gis | a-> r <a=' c e a>-> r \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  {{ template "lh1" (w `a,=,8[(-\frBass` `4` `4`) }}
  {{ template "lh1" (w `a,=,8[(` `8 r` `8 r`) }}
  {{ template "lh3" (w `<e'= a c>8`) }}

  \meter 1/2 #'(1)
  a,=,8( b c cis | d e f4) | e8( fis g gis | a b c4) |
  a=8( b c cis | d e f4) | e,8( fis g gis | a) r <a,=, e' a c> r |

  {{ template "lh2" (w `<a,=,, a'>8`) }}
  <e,=,, e'>8 <fis fis'> <g g'> <gis gis'> | <a a'> <b b'> <c c'> <b b'> |
  {{ template "lh2" (w `<a=,, a'>8`) }}
  <e=, e'>8 <fis fis'> <g g'> <gis gis'> | <a a'> r <a=, e' a c> r |

  \meter 1/4 1,1
  {{ template "lh1" (w `a=,8[(` `4` `8 r`) }}
  {{ template "lh3" (w `<a=, e' a c>8->`) }}

  \meter 1/2 #'(1)
  \clef treble
  r8 <a'= e' a c>8 8 8 | r <d f a d>[ r8 8] |
  r8 <e=' gis d'>8 8 8 | r <a, e' a c>[ r8 8] | 8 r %
  \clef bass <a,=, e' a c>8 r |

  \duo { c=2 | d | g | c,=4 s8 } %
  {
    \meter 1/4 1,1
    {{ template "lh4b" }} | c,8^( <g'= c e>8) 8 %
  } r8 |
  \duo { c=2 | d | g | c,=4 s8 } %
  {
    \meter 1/4 1,1
    {{ template "lh4b" }} | c,8^( <g' c e>8) <c,= g' c e> %
  } r8 |
  <c= g' c>8-> r <b=, e gis d'>-> r |

  {{ template "lh5" (w `a=,4(`) }} | a4( e) |
  {{ template "lh5" (w `a,=,4(`) }} | a=8 r r4 |

  \meter 1/2 #'(1)
  {{ template "lh1" (w `a,=,8[(` `4` `8 8`) }}
  \meter 1/4 1,1
  {{ template "lh5" (w `a,=,4(`) }} | a=8-> r <a,=, e' a c>-> r |
}
{{ end }}
