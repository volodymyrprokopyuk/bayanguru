package command

import (
	"fmt"
	"regexp"
	"slices"

	"github.com/spf13/cobra"
	"github.com/volodymyrprokopyuk/bayanguru/internal/score"
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
    return fmt.Errorf("at least one piece or book is required, got none")
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

func BayanguruCmd() *cobra.Command {
  cmd := &cobra.Command{
    Use: "bayanguru",
    Short: "Engrave, play and publish bayan sheet music",
    Long:
`Bayanguru engraves pieces and books of sheet music for bayan. Bayanguru
selectively plays pieces from a catalog using a classification and search system
based on catalog metadata. Bayanguru publishes high quality PDF pieces, lyrics,
and books on the web`,
    Example: `bayanguru engrave | play | publish pieces... | books... [flags]`,
    Version: "0.1.0",
    SilenceUsage: true,
    SilenceErrors: true,
  }
  cmd.AddCommand(engraveCmd(), playCmd(), publishCmd())
  return cmd
}

func engraveCmd() *cobra.Command {
  var catalog string
  var book, piece, init, lint, optimize, meta bool
  cmd := &cobra.Command{
    Use: "engrave",
    Short: "Engrave pieces and books",
    Long:
`Engrave command initializes, lints, engraves, and optimizes pieces and books`,
    Example:
`bayanguru engrave [-c catalog] pieces... [--init]
bayanguru engrave [-c catalog] -b books... [--piece]
bayanguru engrave all --lint --optimize --meta=f`,
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
  cmd.Flags().StringVarP(
    &catalog, "catalog", "c", "", "read catalog files e.g. ukr,rus, ^stu,sch",
  )
  cmd.Flags().BoolVarP(
    &book, "book", "b", false, "engrave books or pieces from books",
  )
  cmd.Flags().BoolVarP(
    &piece, "piece", "p", false, "engrave individual pieces from books",
  )
  cmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize a new piece",
  )
  cmd.Flags().BoolVarP(
    &lint, "lint", "l", false, "lint pieces before engraving",
  )
  cmd.Flags().BoolVarP(
    &optimize, "optimize", "o", false, "optimize PDF after engraving",
  )
  cmd.Flags().BoolVarP(
    &meta, "meta", "", true, "include piece meta information",
  )
  return cmd
}
