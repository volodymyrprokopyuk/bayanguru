package internal

import (
  "fmt"
  "regexp"
  "github.com/spf13/cobra"
)

var wrongNeg = regexp.MustCompile(`^.+\^`)

func CmdExecute() error {
  var catalog string
  var book bool
  bayanCmd := &cobra.Command{
    Use: "",
    Short: "Engrave and play bayan sheet music",
    Long:
    `Bayan engraves pieces and books of bayan sheet music. Bayan provides a piece
classification and search system to selectively play pieces from a catalog`,
  }
  bayanCmd.PersistentFlags().StringVarP(
    &catalog, "catalog", "c", "", "catalog files e.g. ukr,rus, ^stu,sch",
  )
  bayanCmd.PersistentFlags().BoolVarP(
    &book, "book", "b", false, "engrave or play books",
  )

  var init, piece, lint, optimize, meta bool
  engraveCmd := &cobra.Command{
    Use: "engrave",
    Short: "Engrave pieces and books",
    Long: `Engrave command initializes, lints, and engraves pieces and books`,
    Args: func(cmd *cobra.Command, args []string) error {
      if wrongNeg.MatchString(catalog) {
        return fmt.Errorf("^ must be the first e.g. ^rus,blr")
      }
      if len(args) == 0 {
        return fmt.Errorf("at least one piece or book is required")
      }
      if book && init {
        return fmt.Errorf("cannot initialize books")
      }
      if !book && piece {
        return fmt.Errorf("at least one book is required")
      }
      return nil
    },
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
  engraveCmd.Flags().BoolVarP(
    &lint, "lint", "", true, "lint pieces before engraving",
  )
  engraveCmd.Flags().BoolVarP(
    &optimize, "optimize", "", true, "optimize PDF after engraving",
  )
  engraveCmd.Flags().BoolVarP(
    &meta, "meta", "", true, "include piece meta information",
  )

  var cycle, random, list bool
  var org, sty, gnr, ton, frm, bss, lvl, tit, com, arr string
  playCmd := &cobra.Command{
    Use: "play",
    Short: "Play pieces from a catalog or a book",
    Long:
      `Play command searches, lists, and plays pieces from a catalog or a book`,
    Args: func(cmd *cobra.Command, args []string) error {
      if wrongNeg.MatchString(catalog) {
        return fmt.Errorf("^ must be the first e.g. ^rus,blr")
      }
      if len(args) == 0 {
        return fmt.Errorf("at least one piece or book is required")
      }
      return nil
    },
    Run: func (cmd *cobra.Command, args []string) {
      fmt.Println("play", catalog, book, org, args)
    },
  }
  playCmd.Flags().BoolVarP(
    &random, "random", "r", true, "play pieces in a random order",
  )
  playCmd.Flags().BoolVarP(
    &cycle, "cycle", "", false, "cycle through a playlist",
  )
  playCmd.Flags().BoolVarP(
    &list, "list", "", false, "list pieces without playing",
  )
  var queries = map[string]struct{ short string; varp *string }{
    "org": {"piece origin e.g. ukr,rus", &org},
    "sty": {"piece style e.g. flk,cls", &sty},
    "gnr": {"piece genre e.g. sng,stu", &gnr},
    "ton": {"piece tonality e.g. cj,ai", &ton},
    "frm": {"piece form e.g. mel,var", &frm},
    "bss": {"piece bass e.g. stb,frb", &bss},
    "lvl": {"piece level e.g. ela,inb", &lvl},
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
