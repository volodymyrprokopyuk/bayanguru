package internal

import (
  "fmt"
  "regexp"
  "slices"
  "github.com/spf13/cobra"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

var wrongNeg = regexp.MustCompile(`^.+\^`)

func cmdError(format string, vals ...any) error {
  return fmt.Errorf("command: " + format, vals...)
}

func validate(catalog string, args []string) error {
  if len(args) > 1 && slices.Contains(args, "all") {
    return cmdError("either all or pieces and books, got %v", args)
  }
  if wrongNeg.MatchString(catalog) {
    return cmdError("^ must be the first e.g. ^rus,blr, got -c %v", catalog)
  }
  if len(args) == 0 {
    return cmdError("at least one piece or book is required")
  }
  return nil
}

func CmdExecute() error {
  var catalog string
  var book bool
  bayanCmd := &cobra.Command{
    Use: "bayan",
    Short: "Engrave and play bayan sheet music",
    Long:
    `Bayan engraves pieces and books of bayan sheet music. Bayan provides a piece
classification and search system to selectively play pieces from a catalog`,
    Example: "bayan engrave | play pieces... | books... [flags]",
    Version: "0.1.0",
    SilenceUsage: true,
    SilenceErrors: true,
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
    Example: `bayan engrave [-c catalog] pieces... [--init]
bayan engrave [-c catalog] -b books... [--piece]
bayan engrave pieces... --lint=f --optimize=f --meta=f`,
    Args: func(cmd *cobra.Command, args []string) error {
      if err := validate(catalog, args); err != nil {
        return err
      }
      if book && init {
        return cmdError("cannot initialize books")
      }
      if !book && piece {
        return cmdError("at least one book is required")
      }
      return nil
    },
    RunE: func (cmd *cobra.Command, args []string) error {
      fmt.Println("eng", catalog, book, init, piece, args)
      return nil
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
  playCmd := &cobra.Command{
    Use: "play",
    Short: "Play pieces from a catalog or a book",
    Long:
    `Play command searches, lists, and plays pieces from a catalog or a book`,
    Example: `bayan play [-c catalog] pieces...
bayan play [-c catalog] -b books... [--query...]
bayan play --query... --cycle --random=f --list`,
    Args: func(cmd *cobra.Command, args []string) error {
      if err := validate(catalog, args); err != nil {
        return err
      }
      for opt, query := range queries {
        if wrongNeg.MatchString(*query.varp) {
          return cmdError(
            "^ must be the first e.g. ^rus,blr, got --%v %v", opt, *query.varp,
          )
        }
      }
      return nil
    },
    RunE: func (cmd *cobra.Command, args []string) error {
      pc := cat.PlayCommand{
        Catalog: catalog,
        Book: book, Cycle: cycle, Random: random, List: list,
        All: len(args) == 1 && args[0] == "all",
        Queries: map[string]string{},
      }
      if !pc.All {
        if book {
          pc.Books = args
        } else {
          pc.Pieces = args
        }
      }
      for opt, query := range queries {
        if len(*query.varp) != 0 {
          pc.Queries[opt] = *query.varp
        }
      }
      return cat.Play(pc)
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
  for opt, query := range queries {
    playCmd.Flags().StringVarP(query.varp, opt, "", "", query.short)
  }

  bayanCmd.AddCommand(engraveCmd, playCmd)
  return bayanCmd.Execute()
}
