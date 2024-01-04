% === Template util ===

{% macro logo(scale = 1) %}
  \serif \bold \concat {
    \magnify #{{ 1.5 * scale }} \musicglyph "clefs.G"
    \magnify #{{ 2.5 * scale }} {
      \rotate #30 Б
      \lower #{{ 0.75 * scale }} а
      \raise #{{ 0.75 * scale }} я
      \rotate #-30 Н
    }
  }
{% endmacro %}

{% macro prelude() %}
  \version "2.25.11"
  bayanUrl = "https://volodymyrprokopyuk.github.io/bayan"
  stBass = \markup \larger \box Г % Готовий бас = standard (Stradella) bass
  puBass = \markup \larger \box Б % Чистий бас = pure bass
  frBass = \markup \larger \box В % Виборна система = free bass
  aSim = \markup \italic simile
  aLeg = \markup \italic legato
  aNLeg = \markup \italic "non legato"
  aSta = \markup \italic staccato
  aDol = \markup \italic dolce
  dCre = \markup \lower #3 \italic "cresc."
  dDim = \markup \lower #3 \italic "dim."
  tRit = "rit."
  tRal = "rall."
  tATem = "a tempo"
  tAcc = "accel."
  tSos = "sost."
  acc = #acciaccatura
  af = #after
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
  dPad = #(define-music-function (height) ((number? 3.0))
    #{ \override DynamicLineSpanner.staff-padding = #height #}
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
  barFermata = \mark \markup \musicglyph #"scripts.ufermata"
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
  markupInsideSlur = {
    \once \override TextScript.outside-staff-priority = ##f
    \once \override TextScript.avoid-slur = #'inside
  }
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
  \defineBarLine "!!" #'("!!" "!!" "!!")
  tocSection = #(define-music-function
    (label text) (symbol-list-or-symbol? markup?)
    (add-toc-item! 'tocSectionMarkup text label)
  )
{% endmacro %}

{% macro scoreConfig() %}
  \context {
    \Score
    \omit BarNumber
    \override DynamicLineSpanner.staff-padding = #3
  }
{% endmacro %}

{% macro voiceConfig() %}
  \context {
    \Voice
    \override TupletBracket.span-all-note-heads = ##t
  }
{% endmacro %}

{% macro paperLayout() %}
  top-margin = 8
  bottom-margin = 8
  left-margin = 15
  right-margin = 15
  indent = 7
{% endmacro %}

% === Piece util ===

{% macro pieceMeta(piece) %}
  \markup \line {
    \caps id: {{ piece.id }}, \caps org: {{ piece.org }},
    \caps sty: {{ piece.sty }}, \caps gnr: {{ piece.gnr }},
    \caps ton: {{ piece.ton | join(" ") }},
    \caps frm: {{ piece.frm | join(" ") }},
    \caps bss: {{ piece.bss | join(" ") }},
    \caps lvl: {{ piece.lvl }}
  }
{% endmacro %}

{% macro pieceTitle(piece, args) %}
  \header {
    title = "{{ piece.tit }}"
    subtitle = "{{ piece.sub or '' }}"
    {% if not args.nometa %}
      meta = {{ pieceMeta(piece) }}
    {% endif %}
    {% if piece.com %}
      composer = "{{ piece.com }}"
    {% endif %}
    {% if piece.arr %}
      arranger = "{{ piece.art }} {{ piece.arr }}"
    {% endif %}
  }
{% endmacro %}

{% macro pieceTitleMarkup() %}
  scoreTitleMarkup = \markup \column {
    \fill-line { \fontsize #4 \bold \fromproperty #'header:title }
    \vspace #0.2
    \fill-line { \fontsize #1.5 \fromproperty #'header:subtitle }
    \fill-line { \abs-fontsize #10 \fromproperty #'header:meta }
    \vspace #0.2
    \fill-line {
      \fontsize #1 \italic {
        \fromproperty #'header:arranger \fromproperty #'header:composer
      }
    }
  }
{% endmacro %}

{% macro pieceScore(piece, args) %}
  \score {
    {{ pieceTitle(piece, args) }}
    {% set source = piece.src + "/" + piece.file + ".lys" %}
    {% from source import rightHand, leftHand %}
    \new PianoStaff = bayan {
      <<
        \new Staff = rightHand { {{ rightHand() }} }
        \new Staff = leftHand { {{ leftHand() | stradella }} }
      >>
    }
  }
{% endmacro %}
