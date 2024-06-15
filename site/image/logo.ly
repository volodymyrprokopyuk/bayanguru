\version "2.25.17"

\paper {
  #(set-paper-size '(cons (* 48 mm) (* 23 mm)))
  top-margin = 0
  bottom-margin = 0
  left-margin = 2
  right-margin = 2
  oddFooterMarkup = ##f
}

\markup \serif \bold \concat {
  \magnify #1.5 \musicglyph "clefs.G"
  \magnify #2.9 { \rotate #30 Б \lower #0.7 а \raise #0.7 я \rotate #-30 Н }
}
