{{ define "rightHand" }}
\relative {
  \tempo "Tempo di marcia"
  \clef treble
  \key f \minor
  \time 4/4
  \acc { c''=''16 d e } f2\ff des | c bes4. g8 |
  \duo { aes'='4( c) g( c='') | } { <c'=' f>4 r <c=' e> r | }
  <aes,= c f>4 r \acc { des'=''8 } <aes c>4.(\mf des=''8 ) |
  \repeat volta 2 {
    \duo {
      <aes'=' c>2 aes4. g8 | <aes,= c f>2 e'4 f |
      g='2.( e4 | c) b' \rest c4.( des8) | c2 b4 c |
      g'=''2( aes4 g) | f1~ f4 b, \rest \stemDown <des f>4. <c='' e>8 |
    } {
      s2 <c'=' f>2 | s2 <aes c> | <bes~ c>1 |
      bes=4 s4 <e g>2 | <e bes'> g | <bes c>2 2 |
      <aes=' c>4 8 8 4 4 | 4 s4 s2 |
    }
    <bes=' g'>2 <des f>4 <bes des> |
    <f=' bes>2 <bes des>4( <f f'>) | <aes c>2.( <f aes>4) |
    \duo {
      <c'=' f>2( c'4. des8 | c4) b \rest e,4. g8 |
      <c,=' e c'>4 b' \rest g4. aes='8 |
    } { s2 <f'=' aes>2 | <e g>4 s4 c2 | s2 <bes= e> | }
    \alternative {
      \volta 1 {
        <aes,= c f>4 8 8 4 4 | 4 r \acc { des'=''8 } <aes c>4.( des=''8) |
      }
      \volta 2 { <aes,= c f>4 8 8 4 4 | 4 r r2\f | }
    }
  }

  \repeat volta 2 {
    r4 <aes'=' c f>8 8 4 4 | 4 4 4 4 |
    \rep 2 { r4 <bes=' c e>8 8 4 4 | 4 4 4 4 | }
    \rep 2 {r4 <aes=' c f>8 8 4 4 | 4 4 4 4 | }
    r4 <bes=' des f>8 8 4 4 | 4 4 4 4 |
    r4 <bes=' c e>4 r <bes c e> | r <bes c e>4 4 4 |
    \alternative {
      \volta 1 { r4 <aes=' c f>8 8 4 4 | 4 r r2 | }
      \volta 2 {
        <aes=' c f>4 r <g bes c e>2 | <aes=' c f>4 8 8 4 r \bar "||"
      }
    }
  }

  \acc { ees='16 f g } aes2->\ff ees-> |
  c='2-> aes-> | <bes des ees>4 f'8 ees d ees f g |
  <c,=' ees aes>4 r <e=' g bes c>2->\mf |
  \repeat volta 2 {
    <c'='' f aes>2\pp <aes c f> | <f aes c> <c f aes> |
    <bes= c e g>1~ | 4 r c'=''2 |
    <bes=' c g'>2 \duo { e''=''4.( c8) | } { <bes'=' c>2 | }
    <bes=' c g'>2 \duo { aes''=''4.( g8) | } { <bes'=' c>2 | }
    <aes=' c f>1~ | 4 c( \acc { ees=''8 } des4 c) |
    <des,=' f bes>2( <bes' des g>) | r4 bes4( c bes) |
    <c,=' f aes>2( <aes' c f>) | r4 aes4( \acc { c=''8 } bes4 aes) |
    <c,=' g'>2 <e bes' des> | <c e c'> <bes c e> |
    \duo { f'='1( | f'4)\< ees des \af 4\! c='' | }
    { r4 f=4( aes c | f) f f f=' | }
    <des=' f bes>2(\f <bes' des g>) |
    r4 bes='4( \acc { des=''8 } c4 bes) |
    <c,=' f aes>2( <aes' c f>) | r4 aes4( bes aes) |
    <bes,= e g>2 <e bes' des> | <c e c'> <bes c e> |
    \alternative {
      \volta 1 { <aes= c f>4 8 8 4 4 | 4 r c'=''2-> | }
      \volta 2 {
        <aes,= c f>4 r <g' bes c e>2-> | <aes=' c f>4 8 8 4 r \bar "|."
      }
    }
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key f \minor
  \grace { s16 s s } f=2-\stBass des | c bes |
  c+f@m!4 r4 c+c7!2 | f+fm!4 r r2 |
  \rep 2 { f=,4 fm! c'= f@m | }
  \rep 2 { e=4 c@7! c=4 c7 | }
  \rep 2 { g=,4 c@7! c=4 c7 | }
  f,=,4 fm! c' f@m | f+fm!4 r f,=,2 |
  \rep 2 { des'=4 bes@m! bes4 besm | }
  f=,4 fm! c' f@m | aes4 f@m! f4 fm |
  \rep 2 { c'=4 c7! c= c7 | }
  f,=,4 fm! c' aes | f+fm! r r2 |
  f=,4 fm! c' aes | f+fm! r c=2 |

  aes'=1~-\puBass | aes2 g4. f8 | g1~ | g4 r c,2 |
  g'=1~ | g2 aes4. g8 | f1~ | f4 r c2 |
  f=1~ | f2 g4. f8 | bes,1~ | bes4 bes c des |
  c=2 g | aes2. g4 | f2 c'4 aes | f r c'2 |
  f+fm!4-\stBass r c+c7!2 | f,=,4 fm! fm r |

  aes=,2-> ees'-> | c-> aes-> |
  ees'=4 des c bes | aes r c+c7!2 |
  \rep 2 { f=,4 fm! c'= f@m | }
  \rep 2 { g=,4 c@7! c=4 c7 | }
  c=4 c7! g c@7 | e'4 c@7! c4 c7 |
  f,=,4 fm! c' aes | f+fm! r r2 |
  bes=,4 besm! des bes@m | bes4 besm! bes besm |
  \rep 2 { c=4 f@m! f,=,4 fm | }
  e'=4 c@7! c4 c7 | g4 c@7! c4 c7 |
  f,=,4 fm! c' f@m | f,4 f g a |
  bes=,4( besm!8) besm des4 f, |
  bes=,4( besm!) des( bes@m) |
  c=4( f@m!8[) fm8] f,4 aes | c( f@m!) f,4( fm) |
  c'=4 c7! c c7 | g c@7! c4 c7 |
  f,=,4 fm! c' aes | f+fm! r r2 |
  f+fm!4 r c+c7!2 | f+fm!4 r f+fm4 r |
}
{{ end }}
