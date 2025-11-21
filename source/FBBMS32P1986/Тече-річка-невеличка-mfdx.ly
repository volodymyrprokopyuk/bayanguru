{{ define "rh1" }}
  {{ .a }} d d e f \af 8\! g | a a a4 g8 f) |
  e='8( f g4) a8( g | f\> e \af 2\! d='2) |
{{ end }}

{{ define "rightHand" }}
\relative {
  \tempo Moderato
  \clef treble
  \key f \major
  \time 3/4
  \meter 1/4 1,1,1
  {{ template "rh1" (w `d'='8(\p\<`) }}
  {{ template "rh1" (w `d='8(\mf\<`) }}
  c='4\f c'2-- | bes4 a2-- | c,4\p c'2-- | bes4 a8( bes a g) |
  {{ template "rh1" (w `d='8(\p\<`) }}

  \duo {
    d''=''2(~\mf d8 e | f2 e8 d) | cis2. | d4.( bes8 a g) |
    d='8( d d e f g | a4.) f'8( e d) | cis( d e4) a8( g |
    f=''8 e d2) | c4\f c'8( bes a g) | bes4 a8( f e d) |
    c,='4\p c'8( d c bes) | bes4 a8( bes a g) |
    d='8(\mf\< d d e f \af 8\! g | a a a4 g8 f) |
    e='8( f g4) a8(\>^\tRit g | f e \af 2\! d='2) \bar "|."
  } {
    f'='4. g8 a bes | d2 bes4 | a2. | a4. g8 f e | s4 d2 |
    d='8 e f a~ a4 | g2 cis4 | a2. | bes4 e2 | d4 c2 |
    bes,=4 e2 | d4 cis2 | s4 d2 | c b4 | cis2. | a8 g f=2 |
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \major
  \meter 1/4 1,1,1
  \rep 3 { R2. | }
  r4. bes=8( a g) | a2( g4 | f2 e8 d) | cis2( a4 |
  d=4. f8 d4) | e4. c8( d e) | f4. g8( f d) |
  e=8( f g a g e) | d( e f g f e) | d4( bes g | f d e) |
  g=,4( a cis | d4. a8 d,=,4) |

  d'=8(-\puBass d d e f g | a a a4 g8 f) | e( f g4) a8( g | f e d4) c= |

  bes=,4-\stBass g@m! gm4 | a d@m! dm4 | e' a@7! a74 | d dm! dm |
  e=4 c@7! c74 | f, fM! fM | g c@7! c74 | f e2 | d'4 c bes |
  f=,4 fM! g | a a7! a7 | d4.( a8 d=4) |
}
{{ end }}
