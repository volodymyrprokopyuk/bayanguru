\version "2.25.11"

#(ly:set-option 'warning-as-error #t)

% Logo
bayanURL = "https://volodymyrprokopyuk.github.io/bayan"
bayanLogo = \markup \serif \bold \concat {
  \magnify #0.75 \musicglyph "clefs.G"
  \magnify #1.45 { \rotate #30 Б \lower #0.35 а \raise #0.35 я \rotate #-30 Н }
}
logoURL = \markup { \bayanLogo \fontsize #1 \with-url \bayanURL \bayanURL }

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

% Tuplet
hideTupletBracket = {
  \override TupletBracket.bracket-visibility = ##f
  \override TupletNumber.stencil = ##f
}

% Bars
barFermata = \mark \markup \musicglyph #"scripts.ufermata"
\defineBarLine "!!" #'("!!" "!!" "!!")

keyChangeBeforeBar = \once {
  \override Score.BreakAlignment.break-align-orders =
  #(make-vector 3 '(
    left-edge
    staff-ellipsis
    cue-end-clef
    ambitus
    breathing-sign
    signum-repetitionis
    clef
    cue-clef
    key-cancellation
    key-signature
    staff-bar
    time-signature
    custos
  ))
  \override Staff.KeyCancellation.extra-spacing-width = #'(-1.5 . 0)
}

% Alias
acc = #acciaccatura
af = #after

% Meter
meter = #(define-music-function (scope moment beat)
  ((symbol? 'Staff) fraction? list?)
  #{
    \set #scope .beamExceptions = #'()
    \set #scope .baseMoment = #(ly:make-moment (/ (car moment) (cdr moment)))
    \set #scope .beatStructure = #beat
  #}
)

% Repetition
rep = #(define-music-function (n mus) (integer? ly:music?)
  #{ \repeat unfold #n { #mus } #}
)

% Voices
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

% Volta
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

% TOC
tocSection = #(define-music-function
  (label text) (symbol-list-or-symbol? markup?)
  (add-toc-item! 'tocSectionMarkup text label)
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

\paper {
  indent = 8
  % top-margin = 8
  % bottom-margin = 8
  % left-margin = 12
  % right-margin = 12

  two-sided = ##t
  inner-margin = 12
  outer-margin = 12
  binding-offset = 6

  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null

  scoreTitleMarkup = \markup \column {
    \fill-line { \fontsize #5 \bold \fromproperty #'header:tit }
    \vspace #0.2
    \fill-line { \fontsize #2 \fromproperty #'header:sub }
    \vspace #0.2
    {{ if .Meta }}
      \fill-line {
        \line {
          \caps id: \concat { \fromproperty #'header:id "," }
          \caps org: \concat { \fromproperty #'header:org "," }
          \caps sty: \concat { \fromproperty #'header:sty "," }
          \caps gnr: \concat { \fromproperty #'header:gnr "," }
          \caps ton: \concat { \fromproperty #'header:ton "," }
          \caps frm: \concat { \fromproperty #'header:frm "," }
          \caps bss: \concat { \fromproperty #'header:bss "," }
          \caps lvl: \fromproperty #'header:lvl
        }
      }
      \vspace #0.2
    {{ end }}
    \fill-line {
      \fontsize #1 \italic \fromproperty #'header:arr
      \fontsize #1 \italic \fromproperty #'header:com
    }
  }

  bookTitleMarkup = \markup \column {
    \vspace #12
    \fill-line { \fontsize #7 \bold \fromproperty #'header:tit }
    \vspace #1
    \fill-line { \fontsize #5 \bold \fromproperty #'header:sub }
  }

  tocTitleMarkup = \markup \column {
    \fill-line { \fontsize #4 \bold "Зміст" }
    \vspace #1
  }

  tocSectionMarkup = \markup \column {
    \vspace #0.5
    \line { \fontsize #1 \bold \caps \fromproperty #'toc:text }
    \vspace #0.3
  }

  tocItemMarkup = \markup \fill-line {
    \fill-with-pattern #0.5 #RIGHT .
    \fromproperty #'toc:text \fromproperty #'toc:page
  }
}

{{ define "pieceScore" }}
\tocItem \markup {
  \caps id: "{{ .ID }}" "{{ .Tit }}"
  {{ if .Com }} \italic "{{ .Com }}" {{ end }}
  {{ if .Arr }} \italic "{{ .Art }}{{ .Arr }}" {{ end }}
}
\score {
  \header {
    tit = "{{ .Tit }}"
    sub = "{{ .Sub }}"
    com = "{{ .Com }}"
    arr = "{{ .Art }}{{ .Arr }}"
    id = "{{ .ID }}"
    org = "{{ .Org }}"
    sty = "{{ .Sty }}"
    gnr = "{{ .Gnr }}"
    ton = "{{ .Ton | join ` ` }}"
    frm = "{{ .Frm | join ` ` }}"
    bss = "{{ .Bss | join ` ` }}"
    lvl = "{{ .Lvl }}"
  }
  \new PianoStaff = bayan {
    <<
      \new Staff = rightHand { {{ .RightHand }} }
      \new Staff = leftHand { {{ .LeftHand }} }
    >>
  }
}
{{ end }}

{{ block "piece" . }} {{ end }}
{{ block "book" . }} {{ end }}
