package main

import ("fmt"; "os")
import "github.com/spf13/cobra"

func readCLI() {
  var book, init bool
  bayanCmd := &cobra.Command{
    Use: "bayan",
    Short: "Engrave and play bayan sheet music",
    Long:
    `Bayan engraves pieces and books of bayan sheet music. Bayan provides a piece
classification and search system to selectively play pieces from a catalog`,
  }
  bayanCmd.PersistentFlags().BoolVarP(
    &book, "book", "b", false, "engrave or play books",
  )
  engraveCmd := &cobra.Command{
    Use: "eng",
    Short: "Engrave pieces and books",
    Long: `Engrave command initializes, lints, and engraves pieces and books`,
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("eng", book, init, args)
    },
  }
  engraveCmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize a new piece",
  )
  playCmd := &cobra.Command{
    Use: "play",
    Short: "Play pieces from a catalog",
    Long: `Play command searches, lists, and plays pieces from a catalog`,
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("play", book, args)
    },
  }
  bayanCmd.AddCommand(engraveCmd, playCmd)
  if err := bayanCmd.Execute(); err != nil {
    fmt.Println(err)
    os.Exit(1)
  }
}

func main() {
  readCLI()
}
