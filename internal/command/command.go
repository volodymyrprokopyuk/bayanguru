package internal

import (
  "fmt"
  "regexp"
  "slices"
  "path/filepath"
  "github.com/spf13/cobra"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
  "github.com/volodymyrprokopyuk/bayan/internal/score"
  "github.com/volodymyrprokopyuk/bayan/internal/site"
)

var (
  catalogDir = "catalog"
  bookFile = "books.yaml"
  sourceDir = "source"
  pieceDir = "piece"
  bookDir = "book"
  siteDir = "site"
)

var validPat = regexp.MustCompile(`^\^?\pL[-\pL,]*[^,]$`)

func validateReq(catalog string, args []string) error {
  if len(catalog) > 0 && !validPat.MatchString(catalog) {
    return fmt.Errorf("valid pattern ukr-cls or ^rus,blr, got -c %v", catalog)
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

type Query struct {
  short string; varp *string
}

func validateQueries(queries map[string]Query) error {
  for opt, query := range queries {
    val := *query.varp
    if len(val) > 0 && !validPat.MatchString(val) {
      return cmdError(
        "valid pattern ukr,stu or ^rus,blr, got --%v %v", opt, val,
      )
    }
  }
  return nil
}

func cmdError(format string, args ...any) error {
  return fmt.Errorf("command: " + format, args...)
}

func Execute() error {
  bayanCmd := &cobra.Command{
    Use: "bayan",
    Short: "Engrave, play and publish bayan sheet music",
    Long:
`Bayan engraves pieces and books of sheet music for bayan. Bayan selectively
plays pieces from a catalog using a classification and search system based on
catalog metadata. Bayan publishes high quality PDF pieces on the web`,
    Example: `bayan engrave | play | publish pieces... | books... [flags]`,
    Version: "0.1.0",
    SilenceUsage: true,
    SilenceErrors: true,
  }

  var catalog string
  var book, piece, init, lint, optimize, meta bool
  engraveCmd := &cobra.Command{
    Use: "engrave",
    Short: "Engrave pieces and books",
    Long:
`Engrave command initializes, lints, engraves, and optimizes pieces and books`,
    Example:
`bayan engrave [-c catalog] pieces... [--init]
bayan engrave [-c catalog] -b books... [--piece]
bayan engrave all --lint --optimize --meta=f`,
    Args: func(_ *cobra.Command, args []string) error {
      err := validateReq(catalog, args)
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
    RunE: func (_ *cobra.Command, args []string) error {
      ec := score.EngraveCommand{
        CatalogDir: catalogDir, BookFile: bookFile,
        SourceDir: sourceDir, PieceDir: pieceDir, BookDir: bookDir,
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
  engraveCmd.Flags().StringVarP(
    &catalog, "catalog", "c", "", "read catalog files e.g. ukr,rus, ^stu,sch",
  )
  engraveCmd.Flags().BoolVarP(
    &book, "book", "b", false, "engrave books or pieces from books",
  )
  engraveCmd.Flags().BoolVarP(
    &piece, "piece", "p", false, "engrave individual pieces from books",
  )
  engraveCmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize a new piece",
  )
  engraveCmd.Flags().BoolVarP(
    &lint, "lint", "l", false, "lint pieces before engraving",
  )
  engraveCmd.Flags().BoolVarP(
    &optimize, "optimize", "o", false, "optimize PDF after engraving",
  )
  engraveCmd.Flags().BoolVarP(
    &meta, "meta", "", true, "include piece meta information",
  )

  var random, list bool
  var org, sty, gnr, ton, frm, bss, lvl, tit, com, arr string
  var queries = map[string]Query{
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
    Example:
`bayan play [-c catalog] pieces...
bayan play [-c catalog] -b books... [--query...]
bayan play all --query... --random --list`,
    Args: func(_ *cobra.Command, args []string) error {
      err := validateReq(catalog, args)
      if err != nil {
        return cmdError("%v", err)
      }
      err = validateQueries(queries)
      if err != nil {
        return cmdError("%v", err)
      }
      return nil
    },
    RunE: func (_ *cobra.Command, args []string) error {
      pc := cat.PlayCommand{
        CatalogDir: catalogDir, BookFile: bookFile,
        PieceDir: pieceDir, BookDir: bookDir,
        Catalog: catalog,
        All: len(args) == 1 && args[0] == "all",
        Book: book, Random: random, List: list,
        Queries: make(map[string]string, 10),
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
  playCmd.Flags().StringVarP(
    &catalog, "catalog", "c", "", "read catalog files e.g. ukr,rus, ^stu,sch",
  )
  playCmd.Flags().BoolVarP(
    &book, "book", "b", false, "play pieces from books",
  )
  playCmd.Flags().BoolVarP(
    &random, "random", "r", false, "play pieces in a random order",
  )
  playCmd.Flags().BoolVarP(
    &list, "list", "l", false, "list pieces without playing",
  )
  for opt, query := range queries {
    playCmd.Flags().StringVarP(query.varp, opt, "", "", query.short)
  }

  publishCmd := &cobra.Command{
    Use: "publish",
    Short: "Publish pieces on the web",
    Long:
`Publish command uploads PDF pieces to a cloud storage, generates and publishes
a web site`,
    Example:
`bayan publish [-c catalog] pieces...
bayan publish [-c catalog] -b books... [--query]
bayan publish all --query...`,
    Args: func(_ *cobra.Command, args []string) error {
      err := validateReq(catalog, args)
      if err != nil {
        return cmdError("%v", err)
      }
      err = validateQueries(queries)
      if err != nil {
        return cmdError("%v", err)
      }
      return nil
    },
    RunE: func(_ *cobra.Command, args []string) error {
      pc := site.PublishCommand{
        CatalogDir: catalogDir, BookFile: bookFile,
        PieceDir: pieceDir, BookDir: bookDir,
        Catalog: catalog,
        Init: init,
        All: len(args) == 1 && args[0] == "all",
        Book: book,
        Queries: make(map[string]string, 10),
        SiteDir: siteDir,
        TemplateDir: filepath.Join(siteDir, "template"),
        PublicDir: filepath.Join(siteDir, "public"),
        PageSize: 24,
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
      return site.Publish(pc)
    },
  }
  publishCmd.Flags().StringVarP(
    &catalog, "catalog", "c", "", "read catalog files e.g. ukr,rus, ^stu,sch",
  )
  publishCmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize the site",
  )
  publishCmd.Flags().BoolVarP(
    &book, "book", "b", false, "publish pieces from books",
  )
  for opt, query := range queries {
    publishCmd.Flags().StringVarP(query.varp, opt, "", "", query.short)
  }

  bayanCmd.AddCommand(engraveCmd, playCmd, publishCmd)
  return bayanCmd.Execute()
}
