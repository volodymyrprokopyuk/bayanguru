package internal

import "fmt"
import "github.com/spf13/cobra"

func CmdExecute() error {
  var (cat string; book bool)
  bayanCmd := &cobra.Command{
    Use: "bayan",
    Short: "Engrave and play bayan sheet music",
    Long:
    `Bayan engraves pieces and books of bayan sheet music. Bayan provides a piece
classification and search system to selectively play pieces from a catalog`,
  }
  bayanCmd.PersistentFlags().StringVarP(
    &cat, "cat", "c", "", "pattern for catalog files",
  )
  bayanCmd.PersistentFlags().BoolVarP(
    &book, "book", "b", false, "engrave or play books",
  )

  var init, piece, lint, opt, meta bool
  engraveCmd := &cobra.Command{
    Use: "eng",
    Short: "Engrave pieces and books",
    Long: `Engrave command initializes, lints, and engraves pieces and books`,
    Args: func(cmd *cobra.Command, args []string) error {
      if len(args) == 0 {
        return fmt.Errorf("at least one piece of book is required")
      }
      if book && init {
        return fmt.Errorf("cannot initialize books")
      }
      if !book && piece {
        return fmt.Errorf("missing books")
      }
      return nil
    },
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("eng", cat, book, init, piece, args)
    },
  }
  engraveCmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize a new piece",
  )
  engraveCmd.Flags().BoolVarP(
    &piece, "piece", "p", false, "engrave individual pieces from books",
  )
  engraveCmd.Flags().BoolVarP(
    &lint, "lint", "", false, "lint pieces before engraving",
  )
  engraveCmd.Flags().BoolVarP(
    &opt, "opt", "", false, "optimize PDF after engraving",
  )
  engraveCmd.Flags().BoolVarP(
    &meta, "meta", "", true, "include piece meta information (default true)",
  )

  var cycle, random, list bool
  var org, sty, gnr, ton, frm, bss, lvl, tit, com, arr string
  playCmd := &cobra.Command{
    Use: "play",
    Short: "Play pieces from a catalog",
    Long: `Play command searches, lists, and plays pieces from a catalog`,
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("play", cat, book, org, args)
    },
  }
  playCmd.Flags().BoolVarP(
    &random, "random", "", false, "play pieces in a random order",
  )
  playCmd.Flags().BoolVarP(
    &cycle, "cycle", "", false, "cycle a playlist",
  )
  playCmd.Flags().BoolVarP(
    &list, "list", "", false, "list pieces to play",
  )
  var queries = map[string]struct{ short string; varp *string }{
    "org": {"piece origin e.g. ukr, rus", &org},
    "sty": {"piece style e.g. flk, cls", &sty},
    "gnr": {"piece genre e.g. sng, stu", &gnr},
    "ton": {"piece tonality e.g. cj, ai", &ton},
    "frm": {"piece form e.g. mel, var", &frm},
    "bss": {"piece bass e.g. stb, frb", &bss},
    "lvl": {"piece level e.g. ela, inb", &lvl},
    "tit": {"piece title", &tit},
    "com": {"piece composer", &com},
    "arr": {"piece arranger", &arr},
  }
  for opt, conf := range queries {
    playCmd.Flags().StringVarP(conf.varp, opt, "", "", conf.short)
  }

  bayanCmd.AddCommand(engraveCmd, playCmd)
  return bayanCmd.Execute()
}
