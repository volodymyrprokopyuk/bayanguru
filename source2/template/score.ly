\version "2.25.11"

#(ly:set-option 'warning-as-error #t)

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
meter = #(define-music-function (scope moment beat)
  ((symbol? 'Staff) fraction? list?)
  #{
    \set #scope .beamExceptions = #'()
    \set #scope .baseMoment = #(ly:make-moment (/ (car moment) (cdr moment)))
    \set #scope .beatStructure = #beat
  #}
)

rep = #(define-music-function (n mus) (integer? ly:music?)
  #{ \repeat unfold #n { #mus } #}
)

duo = #(define-music-function (vone vtwo) (ly:music? ly:music?)
  #{
    <<
      \new Voice = voiceOne \relative { \voiceOne #vone }
      \new Voice = voiceTwo \relative { \voiceTwo #vtwo }
    >>
  #}
)

trio = #(define-music-function (vone vtwo vthree)
  (ly:music? ly:music? ly:music?)
  #{
    <<
      \new Voice = voiceOne \relative { \voiceOne #vone }
      \new Voice = voiceTwo \relative { \voiceTwo #vtwo }
      \new Voice = voiceThree \relative { \voiceThree #vthree }
    >>
  #}
)

\layout {
  \context {
    \Score
    \omit BarNumber
    \override DynamicLineSpanner.staff-padding = #3
  }
  \context {
    \Staff
    \numericTimeSignature
  }
  \context {
    \Voice
    \override TupletBracket.span-all-note-heads = ##t
  }
}

{{ block "piece" . }} {{ end }}
{{ block "book" . }} {{ end }}
