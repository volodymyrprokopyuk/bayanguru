package internal

import (
  "fmt"
  "regexp"
  "slices"
  "github.com/spf13/cobra"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
  "github.com/volodymyrprokopyuk/bayan/internal/score"
)

var invalidNeg = regexp.MustCompile(`^.+\^`)

func validate(catalog string, args []string) error {
  if invalidNeg.MatchString(catalog) {
    return fmt.Errorf("^ must be the first e.g. ^rus,blr, got -c %v", catalog)
  }
  if len(args) == 0 {
    return fmt.Errorf("at least one piece or book is required, got zero")
  }
  if len(args) > 1 && slices.Contains(args, "all") {
    return fmt.Errorf("either all or pieces and books, got %v", args)
  }
  validID := regexp.MustCompile(`^[0-9a-z]{4}$`)
  for _, arg := range args {
    if !validID.MatchString(arg) && arg != "all" {
      return fmt.Errorf("valid ID [0-9a-z]{4} or all, got %v", arg)
    }
  }
  return nil
}

func cmdError(format string, args ...any) error {
  return fmt.Errorf("command: " + format, args...)
}

func Execute() error {
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

  var piece, init, lint, optimize, meta bool
  engraveCmd := &cobra.Command{
    Use: "engrave",
    Short: "Engrave pieces and books",
    Long: `Engrave command initializes, lints, and engraves pieces and books`,
    Example: `bayan engrave [-c catalog] pieces... [--init]
bayan engrave [-c catalog] -b books... [--piece]
bayan engrave pieces... --lint=f --optimize=f --meta=f`,
    Args: func(cmd *cobra.Command, args []string) error {
      err := validate(catalog, args)
      if err != nil {
        return cmdError("%v", err)
      }
      if init && len(args) > 1 ||
        init && len(args) == 1 && args[0] == "all" {
        return cmdError("cannot initialize more than one piece, got %v", args)
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
      ec := score.EngraveCommand{
        Catalog: catalog,
        All: len(args) == 1 && args[0] == "all",
        Book: book, Piece: piece,
        Init: init, Lint: lint, Optimize: optimize, Meta: meta,
      }
      if !ec.All {
        if book {
          ec.Books = args
        } else {
          ec.Pieces = args
        }
      }
      return score.Engrave(ec)
    },
  }
  engraveCmd.Flags().BoolVarP(
    &piece, "piece", "p", false, "engrave individual pieces from books",
  )
  engraveCmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize a new piece",
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

  var random, list bool
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
bayan play --query... --random --list`,
    Args: func(cmd *cobra.Command, args []string) error {
      err := validate(catalog, args)
      if err != nil {
        return cmdError("%v", err)
      }
      for opt, query := range queries {
        if invalidNeg.MatchString(*query.varp) {
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
        All: len(args) == 1 && args[0] == "all",
        Book: book, Random: random, List: list,
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
        if len(*query.varp) > 0 {
          pc.Queries[opt] = *query.varp
        }
      }
      return cat.Play(pc)
    },
  }
  playCmd.Flags().BoolVarP(
    &random, "random", "r", false, "play pieces in a random order",
  )
  playCmd.Flags().BoolVarP(
    &list, "list", "l", false, "list pieces without playing",
  )
  for opt, query := range queries {
    playCmd.Flags().StringVarP(query.varp, opt, "", "", query.short)
  }

  bayanCmd.AddCommand(engraveCmd, playCmd)
  return bayanCmd.Execute()
}
