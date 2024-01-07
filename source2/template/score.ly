\version "2.25.11"

#(ly:set-option 'warning-as-error #t)

% Logo
bayanURL = "https://volodymyrprokopyuk.github.io/bayan"
bayanLogo = \markup {
  \serif \bold \concat {
    \magnify #0.75 \musicglyph "clefs.G"
    \magnify #1.25 {
      \rotate #30 Б \lower #0.4 а \raise #0.4 я \rotate #-30 Н
    }
  }
}
logoURL = \markup { \bayanLogo \with-url \bayanURL \bayanURL }

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

hSpace = #(define-music-function () ()
  #{ \once \override NoteHead.extra-spacing-width = #'(-2.5 . 0) #}
)

sSlur = #(define-music-function (dir prs mus) (symbol? alist? ly:music?)
  (let* ((bs (assoc-get 'bs prs 2.0)) ;; vertical base line
         (sh (assoc-get 'sh prs 0.5)) ;; horiaontal shift
         (wd (assoc-get 'wd prs 1.0)) ;; slur width
         (ht (assoc-get 'ht prs 1.0)) ;; slur height
         (dt (assoc-get 'dt prs 0.0)) ;; vertical delta
         (pts (cond
               ((equal? dir 'fu)
                (let ((ax (+ sh (* 0.0 wd)))
                      (bx (+ sh (* 1.0 wd)))
                      (cx (+ sh (* 2.0 wd)))
                      (dx (+ sh (* 3.0 wd)))
                      (ay bs)
                      (by (+ bs ht))
                      (cy (+ bs ht))
                      (dy (+ bs dt)))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))))
               ((equal? dir 'fd)
                (let ((ax (+ sh (* 0.0 wd)))
                      (bx (+ sh (* 1.0 wd)))
                      (cx (+ sh (* 2.0 wd)))
                      (dx (+ sh (* 3.0 wd)))
                      (ay (* -1 bs))
                      (by (* -1 (+ bs ht)))
                      (cy (* -1 (+ bs ht)))
                      (dy (* -1 (+ bs dt))))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))))
               ((equal? dir 'bu)
                (let ((ax (- (+ sh (* 0.0 wd)) (* 3.0 wd)))
                      (bx (- (+ sh (* 1.0 wd)) (* 3.0 wd)))
                      (cx (- (+ sh (* 2.0 wd)) (* 3.0 wd)))
                      (dx (- (+ sh (* 3.0 wd)) (* 3.0 wd)))
                      (ay (+ bs dt))
                      (by (+ bs ht))
                      (cy (+ bs ht))
                      (dy bs))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))))
               ((equal? dir 'bd)
                (let ((ax (- (+ sh (* 0.0 wd)) (* 3.0 wd)))
                      (bx (- (+ sh (* 1.0 wd)) (* 3.0 wd)))
                      (cx (- (+ sh (* 2.0 wd)) (* 3.0 wd)))
                      (dx (- (+ sh (* 3.0 wd)) (* 3.0 wd)))
                      (ay (* -1 (+ bs dt)))
                      (by (* -1 (+ bs ht)))
                      (cy (* -1 (+ bs ht)))
                      (dy (* -1 bs)))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))
               )))))
    (tweak 'control-points pts mus)))

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
