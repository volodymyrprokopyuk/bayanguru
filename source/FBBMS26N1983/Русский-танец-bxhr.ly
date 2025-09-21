{{ define "rightHand" }}
\relative {
  \tempo Tranquillo
  \clef treble
  \key a \minor
  \time 2/4
  \repeat volta 2 {
    \duo { e''=''4\f a8 f | e4 a,8 b | c c b b=' | }
    { r8 <a'=' c>8[ r d] | r <a c>[ r <d, f>] | r <e a>[ fis <e=' gis>] | }
    \alternative {
      \volta 1 { \duo { a'='4 e=' | } { a'='8 f e d=' | } | }
      \volta 2 { \duo { a'='4\> \af 8.\! g=' | } { g'='8 a, b cis=' | } | }
    }
  }

  \repeat volta 2 {
    \duo { f'='8\p a b4 | c4. b8 | a b c a=' | }
    { d'='4 <d f> | <e g>2 | f4 <c=' a'> | }
    \alternative {
      \volta 1 { \duo { g'='4 c,=' | } { <c'=' e>4 c=' | } | }
      \volta 2 { <c'=' e g>4 <d=' e gis> | }
    }
  }

  \repeat volta 2 {
    <a'=' c e>4 <a d f a>8 f' | <a, c e>4 a8 b | <f a c>4 <d fis b>8 <d gis b> |
    \alternative {
      \volta 1 { <c=' e a>4 e=' | }
      \volta 2 { <cis=' g' a>4 <cis=' g'> | }
    }
  }

  \repeat volta 2 {
    <d=' f>8 a' <d, f b>4 | \duo { c''=''4. b='8 | } { <e'=' g>2 | }
    <f=' a>8 b \duo { <aes'=' c>8 aes=' | } { f'='4 | }
    \alternative {
      \volta 1 { g='4 c,=' | }
      \volta 2 { g'='4 <d=' e gis> | }
    }
  }

  \repeat volta 2 {
    e'=''16( a gis a fis a gis a | e a gis a d, a' gis a) |
    c,=''16( a' fis a d, gis f gis | c, a' gis e c a gis <e=' c'>) |
  }

  \repeat volta 2 {
    <d'='' f>8 a' <d, f b>4 <e g c>4. <e g b>8 | <d f a>8 b' <d, f c'> a' |
    \alternative {
      \volta 1 { <c,='' e g>4 c='' | }
      \volta 2 { <c='' e a>4 <d='' e gis> | }
    }
  }

  \repeat volta 2 {
    \duo { e''=''4 a8 f | e4. d8~ | d e fis gis='' | }
    { r8 a'='4 b8~ | b c a b | c c b b=' | }
    \alternative {
      \volta 1 { \duo { a''=''8 d, c b=' | } { a'='4 e=' | } | }
      \volta 2 { \duo { a''=''8 b, a g=' | } { a'='4 s4 | } | }
    }
  }

  \repeat volta 2 {
    \duo { f'='8 a b4 | c4. b8 | a b c a=' | }
    { d'='8 r <e g> d | <e g> r <e g> r | <c f> r <c=' f> r | }
    \alternative {
      \volta 1 { \duo { g'='4 c,=' | } { <c'=' e>8 r a= r | } | }
      \volta 2 { \duo { g'='8 b c d='' | } { a'='4 <e=' gis> | } | }
    }
  }

  \repeat volta 2 {
    \duo { e''=''4 a8 f | e4 a,8 b | c c b <b=' e> | }
    { r8 <a'=' c>8[ r d] | r <a c>[ r <d, f>] | r <e a>[ r e='] | }
    \alternative {
      \volta 1 { \duo { a'='4 e=' | } { a'='8 d, c b= | } | }
      \volta 2 { \duo { a'='2 | } { r8 <d'=' f>8 <c=' e>4 \bar "|." } | }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
  a,=,8-\stBass am! b d@m! | c8 a@m! d8 dm! | e b@m! e8 ed! |
  r8 d=8[ c b=,] | a+aM! r r4 |

  d=8 dm! g, dM! | c cM! e c@M | f8 fM! f fM | c cM! e c@M |
  c=8 cM! b=, e@M!  \clef treble |

  a'=16-\frBass b c_\aSta d f g a b | c b a g f e d c |
  e='16 d c b= \clef bass a= gis fis e | a e fis gis a b c d=' |
  e,=16 d cis b a a' b cis=' |

  d='16 a g f e d c b | c d e f g a b c | d c b a aes bes c d |
  e='16 d c b a g f e | e' d c b a gis fis e= |

  \duo { e'='4 a8 fis | e4 a,8 b | c c <fis, b> <gis b> | a4 a= | }
  { <a= c>4 cis | c f, | ees d | e a= | }

  \clef treble c'='16( a' gis a c, a' gis a | c, g' fis g c, g' fis g) |
  c,='16( a' gis a c, a' gis f | c b' ais b c, g' fis e) |
  c='16( b' ais g b, b' ais e=') \clef bass |

  r8 a+am!-\stBass r a+d@m! | r8 a+am! r a+d@m! | r8 a+am! r a+b@d! |
  r8 a+am! am r | a+aM!4 a@7! |

  d,=8 dm! g, gM! | c cM! e c@M | f8 fM! f fM | c cM! c cd! | c cM! b=, e@M! |

  a=,8 am! b d@m! | c8 a@m! d8 dm! | e a@m! e8 b@d! | a,8 f e' d | r b a=,4 |
}
{{ end }}
