{{ define "t1" }}
  \tuplet 3/2 { {{ .a }} } %
{{ end }}

{{ define "rh1" }}
  {{ .a }} \arpeggio {{ template "t1" (w `e'=''16( f e`) }} d8)-. c-. |
  {{ template "t1" (w `c=''16( c d`) }} b8) %
  {{ template "t1" (w `b='16( c b`) }} a='8) |
{{ end }}

{{ define "rh2" }}
  {{ .a }} <a a'>~ 16 g' f e) | <b d>8( <a f'>~ 16 e' d c) |
  <gis=' b>8( <e e'>~ 16 d' c b=') |
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

  {{ template "rh2" (w `<c='' e>8(\f`) }} | c( d c b a b c d) |
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
        e'=''16(\< fis \af 16\! gis a b e, b' c | a8)-> r <a,=' c e a>-> r |
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
        { <c''='' e>8 s4. | }
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
