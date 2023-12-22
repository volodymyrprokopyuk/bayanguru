package internal

import ("fmt"; "os")
import "github.com/spf13/cobra"

func ExecuteCmd() {
  var (catalog string; book bool)
  bayanCmd := &cobra.Command{
    Use: "bayan",
    Short: "Engrave and play bayan sheet music",
    Long:
    `Bayan engraves pieces and books of bayan sheet music. Bayan provides a piece
classification and search system to selectively play pieces from a catalog`,
  }
  bayanCmd.PersistentFlags().StringVarP(
    &catalog, "catalog", "c", "", "pattern for catalog files",
  )
  bayanCmd.PersistentFlags().BoolVarP(
    &book, "book", "b", false, "engrave or play books",
  )

  var init, piece bool
  engraveCmd := &cobra.Command{
    Use: "eng",
    Short: "Engrave pieces and books",
    Long: `Engrave command initializes, lints, and engraves pieces and books`,
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("eng", catalog, book, init, piece, args)
    },
  }
  engraveCmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize a new piece",
  )
  engraveCmd.Flags().BoolVarP(
    &piece, "piece", "p", false, "engrave individual pieces from books",
  )

  playCmd := &cobra.Command{
    Use: "play",
    Short: "Play pieces from a catalog",
    Long: `Play command searches, lists, and plays pieces from a catalog`,
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("play", catalog, book, args)
    },
  }

  bayanCmd.AddCommand(engraveCmd, playCmd)
  if err := bayanCmd.Execute(); err != nil {
    fmt.Println(err)
    os.Exit(1)
  }
}
