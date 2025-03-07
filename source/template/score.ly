\version "2.25.19"

% Logo
bayanURL = "https://bayanguru.org"
bayanLogo = \markup \serif \bold \concat {
  \magnify #0.75 \musicglyph "clefs.G"
  \magnify #1.45 { \rotate #30 Б \lower #0.35 а \raise #0.35 я \rotate #-30 Н }
}
logoURL = \markup {
  \with-url \bayanURL \bayanLogo \fontsize #1 \with-url \bayanURL \bayanURL
}

% Bass
stBass = \markup \larger \box Г % Готовий бас = standard (Stradella) bass
puBass = \markup \larger \box Б % Чистий бас = pure bass
frBass = \markup \larger \box В % Виборна система = free bass

% Pitch
pOss = \markup \italic ossia

% Articulation
aSim = \markup \italic simile
aLeg = \markup \italic legato
aNLeg = \markup \italic "non legato"
aSta = \markup \italic staccato
aTen = \markup \italic \center-align "ten."
aMar = \markup \italic marcato
aDol = \markup \italic dolce
aEsp = \markup \italic espressivo
aLAssai = \markup \italic "leggiero assai"
aPes = \markup \italic pesante

% Dynamic
dCre = \markup \lower #3 \italic "cresc."
dDim = \markup \lower #3 \italic "dim."
#(define-markup-command (dAlt layout props d1 d2) (markup? markup?)
  (interpret-markup layout props
    #{
      \markup \concat {
        \dynamic #d1 \bold \italic ( \dynamic #d2 \bold \italic )
      }
    #}
))

% Tempo
tRit = "rit."
tRal = "rall."
tATem = "a tempo"
tAcc = "accel."
tSos = "sost."
tTen = "ten."

% Segno section
sTrio = \markup { \fontsize #2 "Trio" }
sCoda = \markup { \fontsize #2 "Coda" }
sRep = #(define-music-function (a b) (markup? markup?)
  #{
    \tweak direction #DOWN \textEndMark \markup {
      \italic \right-column { #a #b }
    }
  #}
)

% Bars
barFermata = \mark \markup \musicglyph #"scripts.ufermata"
\defineBarLine "!!" #'("!!" "!!" "!!")

keyCancelChangeBar = \once {
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

keyCancelBarChange = \once {
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
    staff-bar
    key-signature
    time-signature
    custos
  ))
  \override Staff.KeyCancellation.extra-spacing-width = #'(-1.5 . 0)
}

% Aliases
acc = #acciaccatura
af = #after

% Meter
meter = #(define-music-function (scope moment beat)
  ((symbol? 'Staff) fraction? list?)
  #{
    \set #scope .beamExceptions = #'()
    \set #scope .beatBase = #(/ (car moment) (cdr moment))
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
hSpace = \once \override NoteHead.extra-spacing-width = #'(-2.5 . 0)

sSlur = #(define-music-function (dir prs mus) (symbol? alist? ly:music?)
  (let* ((bs (assoc-get 'wb prs 2.0)) ;; vertical base line
         (sh (assoc-get 'ws prs 0.5)) ;; horiaontal shift
         (wd (assoc-get 'ww prs 1.0)) ;; slur width
         (ht (assoc-get 'wh prs 1.0)) ;; slur height
         (dt (assoc-get 'wd prs 0.0)) ;; vertical delta
         (pts (cond
               ((equal? dir 'nf)
                (let ((ax (+ sh (* 0.0 wd)))
                      (bx (+ sh (* 1.0 wd)))
                      (cx (+ sh (* 2.0 wd)))
                      (dx (+ sh (* 3.0 wd)))
                      (ay bs)
                      (by (+ bs ht))
                      (cy (+ bs ht))
                      (dy (+ bs dt)))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))))
               ((equal? dir 'uf)
                (let ((ax (+ sh (* 0.0 wd)))
                      (bx (+ sh (* 1.0 wd)))
                      (cx (+ sh (* 2.0 wd)))
                      (dx (+ sh (* 3.0 wd)))
                      (ay (* -1 bs))
                      (by (* -1 (+ bs ht)))
                      (cy (* -1 (+ bs ht)))
                      (dy (* -1 (+ bs dt))))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))))
               ((equal? dir 'nb)
                (let ((ax (- (+ sh (* 0.0 wd)) (* 3.0 wd)))
                      (bx (- (+ sh (* 1.0 wd)) (* 3.0 wd)))
                      (cx (- (+ sh (* 2.0 wd)) (* 3.0 wd)))
                      (dx (- (+ sh (* 3.0 wd)) (* 3.0 wd)))
                      (ay (+ bs dt))
                      (by (+ bs ht))
                      (cy (+ bs ht))
                      (dy bs))
                  `((,ax . ,ay) (,bx . ,by) (,cx . ,cy) (,dx . ,dy))))
               ((equal? dir 'ub)
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

% Turns
markupInsideSlur = {
  \once \override TextScript.outside-staff-priority = ##f
  \once \override TextScript.avoid-slur = #'inside
}
#(define-markup-command (uTurn layout props up) (markup?)
  (interpret-markup layout props
    #{
      \markup \center-column {
         \raise #-1 \teeny #up
         \musicglyph "scripts.turn"
      }
    #}
))
#(define-markup-command (dTurn layout props down) (markup?)
  (interpret-markup layout props
  #{
    \markup \center-column {
      \musicglyph "scripts.turn"
      \lower #-1 \teeny #down
    }
  #}
))
#(define-markup-command (udTurn layout props up down) (markup? markup?)
  (interpret-markup layout props
  #{
    \markup \center-column {
      \raise #-1 \teeny #up
      \musicglyph "scripts.turn"
      \lower #-1 \teeny #down
    }
  #}
))

% Lyrics
#(define-markup-command (lyrOneColOne layout props a aa)
  (markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT) {
          \line { \vspace #1.5 #a #aa }
        }
      }
    }
  #}
))
#(define-markup-command (lyrOneColTwo layout props a aa b bb)
  (markup? markup? markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT) {
          \line { \vspace #1.5 #a #aa }
          \line { \vspace #1.5 #b #bb }
        }
      }
    }
  #}
))
#(define-markup-command (lyrOneColThree layout props a aa b bb c cc)
  (markup? markup? markup? markup? markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT) {
          \line { \vspace #1.5 #a #aa }
          \line { \vspace #1.5 #b #bb }
          \line { \vspace #1.5 #c #cc }
        }
      }
    }
  #}
))
#(define-markup-command (lyrTwoColTwo layout props a aa b bb)
  (markup? markup? markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT ,LEFT) {
          \line { \vspace #1.5 #a #aa }
          \line { \vspace #1.5 #b #bb }
        }
      }
    }
  #}
))
#(define-markup-command (lyrTwoColFour layout props a aa b bb c cc d dd)
  (markup? markup? markup? markup?
   markup? markup? markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT ,LEFT) {
          \line { \vspace #1.5 #a #aa }
          \line { \vspace #1.5 #c #cc }
          \line { \vspace #1.5 #b #bb }
          \line { \vspace #1.5 #d #dd }
        }
      }
    }
  #}
))
#(define-markup-command (lyrTwoColSix layout props a aa b bb c cc d dd e ee f ff)
  (markup? markup? markup? markup?
   markup? markup? markup? markup?
   markup? markup? markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT ,LEFT) {
          \line { \vspace #1.5 #a #aa }
          \line { \vspace #1.5 #d #dd }
          \line { \vspace #1.5 #b #bb }
          \line { \vspace #1.5 #e #ee }
          \line { \vspace #1.5 #c #cc }
          \line { \vspace #1.5 #f #ff }
        }
      }
    }
  #}
))
#(define-markup-command (lyrTwoColEight layout props a aa b bb c cc d dd e ee f ff g gg h hh)
  (markup? markup? markup? markup?
   markup? markup? markup? markup?
   markup? markup? markup? markup?
   markup? markup? markup? markup?)
  (interpret-markup layout props
  #{
    \markup \fill-line {
      \column {
        \override #'(padding . 10)
        \table #`(,LEFT ,LEFT) {
          \line { \vspace #1.5 #a #aa }
          \line { \vspace #1.5 #e #ee }
          \line { \vspace #1.5 #b #bb }
          \line { \vspace #1.5 #f #ff }
          \line { \vspace #1.5 #c #cc }
          \line { \vspace #1.5 #g #gg }
          \line { \vspace #1.5 #d #dd }
          \line { \vspace #1.5 #h #hh }
        }
      }
    }
  #}
))
#(define-markup-command (lyrRep layout props lyr n)
  (markup? markup?)
  (interpret-markup layout props
  #{
    \markup { \line { #lyr \hspace #3 \italic \concat { (#n) } } }
  #}
))
#(define-markup-command (lyrChorus layout props) ()
  (interpret-markup layout props
  #{
    \markup { \hspace #5 \italic Приспів }
  #}
))

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
          \caps id: \bold \concat { \fromproperty #'header:id "," }
          \caps org: \bold \concat { \fromproperty #'header:org "," }
          \caps sty: \bold \concat { \fromproperty #'header:sty "," }
          \caps gnr: \bold \concat { \fromproperty #'header:gnr "," }
          \caps ton: \bold \concat { \fromproperty #'header:ton "," }
          \caps frm: \bold \concat { \fromproperty #'header:frm "," }
          \caps bss: \bold \concat { \fromproperty #'header:bss "," }
          \caps lvl: \bold \fromproperty #'header:lvl
        }
      }
      \vspace #0.2
    {{ end }}
    \fill-line {
      \fontsize #1 \italic \fromproperty #'header:arr
      \fontsize #1 \italic \fromproperty #'header:com
    }
  }
}

{{ define "pieceTocItem" }}
\tocItem \markup {
  \caps id: "{{ .ID }}" "{{ .Tit }}"
  {{ if .Com }} \italic "{{ .Com }}" {{ end }}
  {{ if .Arr }} \italic "{{ .UkrArt }}{{ .Arr }}" {{ end }}
  {{ if .Aut }} \italic "{{ .Aut }}" {{ end }}
}
{{ end }}

{{ define "pieceScore" }}
\score {
  \header {
    tit = "{{ .Tit }}"
    sub = "{{ .Sub }}"
    com = "{{ .Com }}"
    arr = "{{ .UkrArt }}{{ .Arr }}"
    id = "{{ .ID }}"
    org = "{{ .Org }}"
    sty = "{{ .Sty }}"
    gnr = "{{ .Gnr }}"
    ton = "{{ .Ton | join ` ` }}"
    frm = "{{ .Frm | join ` ` }}"
    bss = "{{ .Bss | join ` ` }}"
    lvl = "{{ .Lvl }}"
  }
  {{ if eq .Ens "sol" }}
    \new PianoStaff = bayan <<
      \new Staff = rightHand { {{ .RightHand }} }
      \new Staff = leftHand { {{ .LeftHand }} }
    >>
  {{ end }}
  {{ if eq .Ens "duo" }}
    <<
      \new PianoStaff = bayanOne <<
        \new Staff = rightHandOne { {{ .RightHandOne }} }
        \new Staff = leftHandOne { {{ .LeftHandOne }} }
      >>
      \new PianoStaff = bayanTwo <<
        \new Staff = rightHandTwo { {{ .RightHandTwo }} }
        \new Staff = leftHandTwo { {{ .LeftHandTwo }} }
      >>
    >>
  {{ end }}
  {{ if eq .Ens "vc1" }}
    <<
      \new ChoirStaff = choir <<
        \override ChoirStaff.SystemStartBracket.collapse-height = #4
        \new Staff = vocal { {{ .Vocal }} }
      >>
      \new PianoStaff = bayan <<
        \new Staff = rightHand { {{ .RightHand }} }
        \new Staff = leftHand { {{ .LeftHand }} }
      >>
    >>
  {{ end }}
  {{ if eq .Ens "vc2" }}
    <<
      \new ChoirStaff = choir <<
        \new Staff = vocalOne { {{ .VocalOne }} }
        \new Staff = vocalTwo { {{ .VocalTwo }} }
      >>
      \new PianoStaff = bayan <<
        \new Staff = rightHand { {{ .RightHand }} }
        \new Staff = leftHand { {{ .LeftHand }} }
      >>
    >>
  {{ end }}
}
{{ if eq .Lyr "lyr" }}
\markup \column {
  {{ if .Aut }}
    \fill-line { \null \italic "{{ .Aut }}" }
  {{ end }}
  {{ .Lyrics }}
}
\pageBreak
{{ end }}
{{ end }}

{{ block "piece" . }} {{ end }}
{{ block "book" . }} {{ end }}
