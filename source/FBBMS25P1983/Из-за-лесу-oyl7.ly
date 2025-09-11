{{ define "rightHand" }}
\relative {
  \tempo Largo
  \clef treble
  \key aes \major
  \time 4/4
  bes'='4.(\mp c8 aes g f4) | ees4(\< f8 g aes4 \af 4\! des='') |
  \duo {
    c''=''4.(\> bes8 aes4) \af 4\! ees' | ees(\< \af 8.\! ees f ees8 des) |
    c=''4( ees ees8 des c bes) | aes4\< c \af 2\! <bes ees>2 |
    <bes=' des>4.( <c ees>8 <des f>4 <c ees>8 <bes des>) |
    <ees,=' aes c>4.( <des g ees'>8 <c ees aes>4) \af 4\! bes' \rest\< |
    <c='' ees>4(\f 4 <des f> ees8 des) | c4( ees ees8[ des] c[ bes=']) |
  } {
    s2. g'='4 | aes8[ bes] aes g f aes g4 | aes4. g8 f2 | f ees |
    f='1 | s1 | ees2 f4 <f bes> | <ees aes> <ees g> <f aes> <ees=' g> |
  }
  <f,=' aes>4-- <f aes c f>-- <ees=' ees'>2 \fermata \bar "|."
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef treble
  \key aes \major
  R1 | ees'='4(-\frBass des c8 f4 e8 | ees8 aes g4) aes8( f ees des |
  c='2) des4( ees~ | ees c des8 bes des='4) \clef bass | c=' aes g2 |
  bes=4( aes g2) | aes8( g f ees) aes( f) ees16( des c bes) |
  aes=,8 bes aes ges f aes g4 | aes-- c-- bes-- ees-- | f2-- ees=-- \fermata |
}
{{ end }}
