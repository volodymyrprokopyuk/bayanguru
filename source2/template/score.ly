\version "2.25.11"

% Bass
stBass = \markup \larger \box Г % Готовий бас = standard (Stradella) bass
puBass = \markup \larger \box Б % Чистий бас = pure bass
frBass = \markup \larger \box В % Виборна система = free bass

% Articulation
aSim = \markup \italic simile
aLeg = \markup \italic legato
aNLeg = \markup \italic "non legato"
aSta = \markup \italic staccato
aDol = \markup \italic dolce

% Dynamic
dCre = \markup \lower #3 \italic "cresc."
dDim = \markup \lower #3 \italic "dim."

% Tempo
tRit = "rit."
tRal = "rall."
tATem = "a tempo"
tAcc = "accel."
tSos = "sost."

% Alias
acc = #acciaccatura
af = #after

% Music function
rep = #(define-music-function (n mus) (integer? ly:music?)
  #{ \repeat unfold #n { #mus } #}
)

meter = #(define-music-function (scope moment beat)
  ((symbol? 'Staff) fraction? list?)
  #{
    \set #scope .beamExceptions = #'()
    \set #scope .baseMoment = #(ly:make-moment (/ (car moment) (cdr moment)))
    \set #scope .beatStructure = #beat
  #}
)

duo = #(define-music-function (vone vtwo) (ly:music? ly:music?)
  #{ <<
       \new Voice = voiceOne \relative { \voiceOne #vone }
       \new Voice = voiceTwo \relative { \voiceTwo #vtwo }
     >>
  #}
)

trio = #(define-music-function (vone vtwo vthree)
  (ly:music? ly:music? ly:music?)
  #{ <<
       \new Voice = voiceOne \relative { \voiceOne #vone }
       \new Voice = voiceTwo \relative { \voiceTwo #vtwo }
       \new Voice = voiceThree \relative { \voiceThree #vthree }
     >>
  #}
)

{{ block "piece" . }} {{ end }}
{{ block "book" . }} {{ end }}
