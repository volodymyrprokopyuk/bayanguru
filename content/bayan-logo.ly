\version "2.23.10"

\markup {
  \roman \bold {
    \magnify #1.5 \musicglyph "clefs.G"
    \magnify #2.5 {
      \rotate #30 Б
      \lower #0.75 а
      \raise #0.75 я
      \rotate #-30 Н
    }
  }
}
