package command

import (
	"github.com/spf13/cobra"
	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

type query struct {
  short string; varp *string
}

func validateQueries(queries map[string]query) error {
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

func playCmd() *cobra.Command {
  var cat string
  var book, random, list bool
  var tit, com, arr, art, aut, lcs, org, sty, gnr, ton, frm, bss, lvl, ens, lyr string
  var queries = map[string]query{
    "tit": {"piece title", &tit},
    "com": {"piece composer", &com},
    "arr": {"piece arranger", &arr},
    "art": {"arrangement type", &art},
    "aut": {"lyrics author", &aut},
    "lcs": {"piece license e.g. cpl,cpr", &lcs},
    "org": {"piece origin e.g. ukr,rus", &org},
    "sty": {"piece style e.g. flk,cls", &sty},
    "gnr": {"piece genre e.g. sng,stu", &gnr},
    "ton": {"piece tonality e.g. cmj,ami", &ton},
    "frm": {"piece form e.g. mel,var", &frm},
    "bss": {"piece bass e.g. stb,frb", &bss},
    "lvl": {"piece level e.g. ela,inb", &lvl},
    "ens": {"piece ensemble e.g. duo,vc1", &ens},
    "lyr": {"piece lyrics e.g. lyr", &lyr},
  }
  cmd := &cobra.Command{
    Use: "play",
    Short: "Play pieces from a catalog or a book",
    Long:
`Play command searches, lists, and plays pieces from a catalog or a book`,
    Example:
`bayanguru play [-c catalog] pieces...
bayanguru play [-c catalog] -b books... [--query...]
bayanguru play all --query... --random --list`,
    Args: func(_ *cobra.Command, args []string) error {
      err := validateReq(cat, args)
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
      pc := catalog.PlayCommand{
        CatalogDir: catalogDir, BookFile: bookFile,
        PieceDir: pieceDir, BookDir: bookDir,
        Catalog: cat,
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
      return catalog.Play(pc)
    },
  }
  cmd.Flags().StringVarP(
    &cat, "catalog", "c", "", "read catalog files e.g. ukr,rus, ^stu,sch",
  )
  cmd.Flags().BoolVarP(
    &book, "book", "b", false, "play pieces from books",
  )
  cmd.Flags().BoolVarP(
    &random, "random", "r", false, "play pieces in a random order",
  )
  cmd.Flags().BoolVarP(
    &list, "list", "l", false, "list pieces without playing",
  )
  for opt, query := range queries {
    cmd.Flags().StringVarP(query.varp, opt, "", "", query.short)
  }
  return cmd
}
