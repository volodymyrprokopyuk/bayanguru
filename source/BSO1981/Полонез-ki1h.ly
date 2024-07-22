{{ define "rightHand" }}
\relative {
  \tempo "Tempo di Pollaca"
  \clef treble
  \key a \minor
  \time 3/4
  \repeat segno 2 {
    \volta 1
    \repeat volta 2 {
      e''=''4.\p dis16( e) f8 e-. | c c16( b a4.) c8 |
      e=''8(-.\< e)-. a4.( \af 8\! e8) | g(-.\> fis)-. f4.( \af 8\! d8) |
      b'=''8.-> a16( gis8.) f16( e8.) d16( | e8.) d16 c4.( a8) |
      b='16( c b a b d f e d c b c) | a( c e a) e4.(-> a8) |
      b=''16(\< c b a b d f \af 16\! e d\> c b a) |
      gis=''16( a b \af 16\! gis) b4(->\p a=''8) r \fine |
    }

    % \volta 2
  }
}
{{ end }}

{{ define "leftHand" }}
\relative {
  \clef bass
  \key a \minor
}
{{ end }}
